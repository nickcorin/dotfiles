local curl = require("plenary.curl")
local n = require("nui-components")

---@class AssistantOptions
---@field show_diffs boolean If true, diffs will be shown before applying.

--- Assistant is the core class for the LLM plugin.
---
---@class Assistant : AssistantOptions
---@field provider Provider The provider for the assistant to use.
local Assistant = {}

---@param provider Provider
---@param opts AssistantOptions
---@return Assistant
function Assistant:new(provider, opts)
    local ass = setmetatable({}, { __index = self })

    local defaults = {
        show_diffs = false,
    }

    opts = vim.tbl_deep_extend("force", defaults, opts or {})
    for k, v in pairs(opts) do
        ass[k] = v
    end

    ass.provider = provider
    vim.validate({
        provider = { ass.provider, "table", "cannot be nil" }
    })

    return ass
end

---@class PromptContext
---@field content string[]
---@field file string
---@field file_type string
---@field buffer number
---@field window number
---@field start_line number
---@field end_line number
local PromptContext = {}

function Assistant:spawn(cmd)
    local ctx = {
        content = {},
        file = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":."),
        file_type = vim.bo.filetype,
        buffer = vim.api.nvim_get_current_buf(),
        window = vim.api.nvim_get_current_win(),
        start_line = cmd.line1,
        end_line = cmd.line2,
    }

    -- Override the start and end lines if there was a visual selection.
    local _, start_mark, _, _ = table.unpack(vim.fn.getpos("'<"))
    local _, end_mark, _, _ = table.unpack(vim.fn.getpos(">'"))

    if start_mark ~= 0 and end_mark ~= 0 then
        cmd.start_line = start_mark
        cmd.end_line = end_mark
    end

    ctx.content = vim.api.nvim_buf_get_lines(0, ctx.start_line - 1, ctx.end_line, false)

    local function handle_prompt(prompt)
        local json = self:request(ctx, prompt)
        local modified_content = self.provider:parse_response(json)
        local diff = self:create_diff(ctx, modified_content)
        if self.show_diffs then
            self:show_diff(ctx, diff)
        else
            self:apply_diff(ctx, diff)
        end
    end

    local prompt_from_args = cmd.args
    if prompt_from_args and prompt_from_args ~= "" then
        handle_prompt(prompt_from_args)
    else
        self:prompt_for_prompt(ctx, function(prompt_from_ui)
            handle_prompt(prompt_from_ui)
        end)
    end
end

---@param ctx PromptContext
---@param callback function(string)
function Assistant:prompt_for_prompt(ctx, callback)
    local renderer = n.create_renderer({
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.5),
    })

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, ctx.content)

    local form = n.form(
        {
            id = "prompt-form",
            submit_key = "<S-CR>",
            on_submit = callback,
        },
        n.text_input({
            id = "prompt-input",
            border_style = "double",
            border_label = "prompt",
            autofocus = true,
            autoresize = false,
            size = 1,
            placeholder = "what do you want now?",
        }),
        n.buffer({
            id = "context-preview",
            border_style = "single",
            border_label = "context",
            flex = 3,
            buf = buf,
            filetype = "markdown",
        })
    )

    renderer:render(n.rows(form))
end

---@param ctx PromptContext
---@param prompt string
---@return string
function Assistant:request(ctx, prompt)
    if not prompt or prompt == "" then
        vim.notify("ass: no prompt provided, cancelling request.", vim.log.levels.WARN)
        return ""
    end

    if not ctx then
        vim.notify("ass: no context provided, cancelling request.", vim.log.levels.WARN)
        return ""
    end

    local req = self.provider:build_request(ctx, prompt)

    -- `-s` enables silent mode, and supresses progress logs being sent to stderr.
    -- `-N` disables response buffering.
    req.raw = vim.list_extend({ "-s", "-N" }, req.raw or {})
    req.timeout = 30000

    local res = curl.request(req)
    if res.exit ~= 0 or res.status > 299 then
        error("ass: curl request bombed: status code: `" .. res.status .. "`, exit code: `" .. res.exit .. "`")
        return ""
    end

    return res.body
end

---@param ctx PromptContext
---@param diff Diff
function Assistant:apply_diff(ctx, diff)
    vim.api.nvim_set_cSurrent_buf(ctx.buffer)

    -- Namespace for the highlights, so it's easy to clear them later.
    local ns_id = vim.api.nvim_create_namespace("ns_ass")

    -- `offset` keeps track of net lines added / deleted in the buffer as we apply changes.
    local offset = 0

    local adjusted_delay = 0
    local function schedule_update(update_fn, delay)
        adjusted_delay = adjusted_delay + delay
        vim.defer_fn(update_fn, adjusted_delay)
    end

    -- A small delay keeps things easy on the eyes.
    local LINE_UPDATE_DELAY = 50
    local function update_line(update_fn)
        schedule_update(update_fn, LINE_UPDATE_DELAY)
    end

    -- Set the cursor to the start of the first hunk.
    local cursor = diff.changes[1][1]
    vim.api.nvim_win_set_cursor(ctx.window, { cursor + 1, 0 })

    for hunk_index, hunk in ipairs(diff.changes) do
        local startA, countA = hunk[1] + offset, hunk[2]
        local startB, countB = hunk[3], hunk[4]

        -- Phase 1: move the cursor to the next hunk.
        -- if hunk_index > 1 then
        --     local prev_hunk = diff.changes[hunk_index - 1]
        --     for i = prev_hunk[1] + prev_hunk[2] - 1, startA - 1 do
        --         update_line(function()
        --             vim.api.nvim_win_set_cursor(ctx.window, { i, 0 })
        --         end)
        --     end
        -- end

        -- Phase 2: apply line modifications.
        for i = 0, math.min(countA, countB) do
            local p = startA + i
            local q = startB + i

            update_line(function()
                vim.api.nvim_win_set_cursor(ctx.window, { p + 1, 0 })
                vim.api.nvim_buf_set_lines(ctx.buffer, p, p + 1, false, { diff.modified[q + 1] })
                vim.api.nvim_buf_add_highlight(ctx.buffer, ns_id, "DiffChange", p, 0, -1)
            end)
        end

        -- Phase 2A: apply deletions.
        for i = 0, countA - countB - 1 do
            local p = startA + countB + i

            update_line(function()
                vim.api.nvim_win_set_cursor(ctx.window, { p + 1, 0 })
                vim.api.nvim_buf_set_lines(ctx.buffer, p, p + 1, false, {})
            end)
        end

        -- Phase 2B: apply insertions.
        for i = 0, countB - countA - 1 do
            local p = startA + countA + i
            local q = startB + countA + i

            update_line(function()
                vim.api.nvim_buf_set_lines(ctx.buffer, p, p, false, { diff.modified[q] })
                vim.api.nvim_win_set_cursor(ctx.window, { p + 1, 0 })
                vim.api.nvim_buf_add_highlight(ctx.buffer, ns_id, "DiffAdd", p, 0, -1)
            end)
        end

        -- Update the offset.
        offset = offset + (countB - countA)
    end

    -- Clear highlights on save.
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = ctx.buffer,
        callback = function()
            vim.api.nvim_buf_clear_namespace(ctx.buffer, ns_id, 0, -1)
        end
    })
end

---@class Diff
---@field original string[]
---@field modified string[]
---@field changes number[][]

---@param ctx PromptContext
---@param modified_content string[]
---@return Diff
function Assistant:create_diff(ctx, modified_content)
    -- TODO: this seems to be working for now, but we refactored this and removed the logic that calculates the diffs
    -- properly. Whoops. I'm not sure that this will all work properly with visually selected content, as this sort of
    -- assumes we're using the entire file as context. maybe i'm wrong, i'm tired. but look into it.
    local hunks = vim.diff(table.concat(ctx.content, "\n"), table.concat(modified_content, "\n"), {
        linematch = true,
        result_type = "indices",
    })
    assert(type(hunks) == "table", "ass: diff hunks are of incorrect type (" .. type(hunks) .. ").")
    return { original = ctx.content, modified = modified_content, changes = hunks }
end

---@param ctx PromptContext
---@param diff Diff
function Assistant:show_diff(ctx, diff)
    -- Create a buffer to hold the original and modified content
    local pre_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(pre_buf, 0, -1, false, diff.original)

    -- Create a buffer to hold the updated content.
    local post_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(post_buf, 0, -1, false, diff.modified)

    local views = { pre_buf, post_buf }
    local curr_view = 2

    -- Toggles which view of the diff is being displayed.
    local function toggle_view()
        curr_view = (curr_view % #views) + 1
        vim.api.nvim_set_current_buf(views[curr_view])
    end

    -- Resets the view and deletes the temporary buffer.
    local function cleanup()
        vim.cmd("diffoff!")
        vim.api.nvim_echo({ { "", "Normal" } }, false, {})
        vim.api.nvim_set_current_win(ctx.window)
        vim.api.nvim_set_current_buf(ctx.buffer)

        -- Delete the temporary buffers.
        for _, buf in ipairs(views) do
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end

    for _, buf in ipairs(views) do
        vim.api.nvim_set_current_buf(buf)
        vim.api.nvim_buf_call(buf, function() vim.cmd("diffthis") end)
        vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })
        vim.api.nvim_set_option_value("filetype", vim.bo.filetype, { buf = buf })

        -- 'a' accepts the changes and applies them to the original buffer.
        vim.api.nvim_buf_set_keymap(buf, "n", "a", "", {
            callback = function()
                self:apply_diff(ctx, diff)
                cleanup()
            end
        })

        -- 'n' and 'N' navigate between change hunks.
        vim.api.nvim_buf_set_keymap(buf, "n", "n", "]c", {})
        vim.api.nvim_buf_set_keymap(buf, "n", "N", "[c", {})

        -- 't' toggles the view.
        vim.api.nvim_buf_set_keymap(buf, "n", "t", "", { callback = toggle_view })

        -- 'q' triggers a cleanup.
        vim.api.nvim_buf_set_keymap(buf, "n", "q", "", { callback = cleanup })
    end

    vim.api.nvim_echo({ { "(a)pply, (q)uit, (t)oggle, (n)ext, (N)revious", "WarningMsg" } }, false, {})
end

return Assistant
