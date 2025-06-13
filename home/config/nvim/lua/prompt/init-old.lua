local Job = require("plenary.job")

local Input = require("nui.input")
local Popup = require("nui.popup")
local Layout = require("nui.layout")

-- Get the root directory of the current project.
--
-- Use Neovim's built-in LSP to get the project root, or default to the current working directory.
local function get_project_root()
    local clients = vim.lsp.get_clients()
    for _, client in ipairs(clients) do
        if client.config.root_dir then
            return client.config.root_dir
        end
    end
    return vim.fn.getcwd()
end

-- Overwrite defaults with user provided options. Only keys present in the defaults table will be included in the output
-- table.
--
-- @param defaults table: Default options.
-- @param overrides table: User provided options.
local function overwrite_defaults(defaults, overrides)
    local opts = {}
    for k, v in pairs(defaults) do
        opts[k] = (overrides and overrides[k] ~= nil) and overrides[k] or v
    end

    return opts
end

local llm = {
    opts = {
        api_key = "",
        model = "gpt-4o",
        output_file = "",
        log_file = "",
        temperature = 0.7,
        systemPrompt = [[
        You are an expert in the field of computer science, and a helpful assistant.
        Do not respond with anything other than code.
        Do not wrap your response in any code blocks or backticks like ```.
        If you are sent code then you should modify it.
        The code should be correct.
        If you are unable to complete the task, or you think something is wrong, you should say so in the form of code
        comments. Only do this if it's absolutely necessary.
        Use the initial prompt to guide your actions.
        ]],
    },
}

function llm.setup(opts)
    llm.opts = overwrite_defaults(llm.opts, opts)
    if not llm.opts.api_key or llm.opts.api_key == "" then
        llm.opts.api_key = os.getenv("OPENAI_API_KEY")
    end

    if not llm.opts.api_key or llm.opts.api_key == "" then
        vim.notify("llm: no api key present.", vim.log.levels.ERROR)
        return
    end

    local root_dir = get_project_root()
    if not root_dir or root_dir == "" then
        vim.notify("llm: no project root found.", vim.log.levels.ERROR)
        return
    end

    llm.opts.output_file = root_dir .. "/.llm"
    llm.opts.log_file = root_dir .. "/.llm.log"

    vim.api.nvim_create_user_command("LLM", llm.command, {
        range = true,
        nargs = "?",
        complete = "customlist,v:lua.llm.complete",
    })
end

function llm.command(cmd)
    llm.window = vim.api.nvim_get_current_win()
    llm.buffer = vim.api.nvim_get_current_buf()

    local prompt_from_args = cmd.args
    local context = {
        content = "",
        filename = vim.api.nvim_buf_get_name(0),
        filetype = vim.bo.filetype,
        selection = (cmd.range > 0) and { cmd.line1, cmd.line2 } or { 1, -1 },
    }

    context.content = vim.api.nvim_buf_get_lines(0, context.selection[1] - 1, context.selection[2], false)

    local function handle_prompt(prompt)
        local json = llm.send_req({ prompt = prompt, context = context })
        local modified_content = llm.decode_response(json)

        llm.show_diff(context, modified_content)
    end

    if prompt_from_args and prompt_from_args ~= "" then
        handle_prompt(prompt_from_args)
    else
        llm.prompt_for_prompt(context, function(prompt_from_ui)
            handle_prompt(prompt_from_ui)
        end)
    end
end

function llm.prompt_for_prompt(context, callback)
    -- Create the context popup
    local ctx_buf_label = "[Context]: " .. context.filename .. " (lines: " .. #context.content .. ")"
    local ctx_buf = Popup({
        enter = false,
        focusable = true,
        buf_options = {
            filetype = context.filetype,
            modifiable = false,
            readonly = true,
        },
        border = {
            style = "single",
            text = {
                top = ctx_buf_label,
                top_align = "left",
            },
        },
    })

    -- Set context content in the context buffer
    vim.api.nvim_buf_set_option(ctx_buf.bufnr, "modifiable", true)
    vim.api.nvim_buf_set_lines(ctx_buf.bufnr, 0, -1, false, context.content)
    vim.api.nvim_buf_set_option(ctx_buf.bufnr, "modifiable", false)

    -- Create the input prompt
    local prompt_buf = Input({
        enter = true,
        focusable = true,
        buf_options = {
            modifiable = true,
            readonly = false,
        },
        border = {
            style = "single",
            text = {
                top = "[Prompt]",
                top_align = "left",
            },
        },
    }, {
        on_submit = function(value)
            -- Close the prompt buffer
            callback(value)
        end,
        on_close = function()
            -- Restore focus to the original window and buffer.
            vim.api.nvim_set_current_win(llm.window)
        end,
    })

    -- Create the layout
    local layout_opts = {
        relative = "editor",
        position = "50%",
        size = {
            width = math.floor(vim.o.columns * 0.8),
            height = math.floor(vim.o.lines * 0.6),
        },
    }

    local layout_components = Layout.Box({
        Layout.Box(ctx_buf, { size = "90%" }),
        Layout.Box(prompt_buf, { size = "10%" }),
    }, { dir = "col" })

    local layout = Layout(layout_opts, layout_components)

    -- Mount the layout
    layout:mount()
end

function llm.decode_response(json_response)
    local ok, decoded = pcall(vim.json.decode, json_response)
    if not ok then
        vim.notify("llm: error decoding response: " .. json_response, vim.log.levels.ERROR)
        return nil
    end

    local content = decoded.choices and decoded.choices[1] and decoded.choices[1].message.content
    if not content then
        vim.notify("llm: response does not contain valid content", vim.log.levels.ERROR)
        return nil
    end

    return content
end

function llm.show_diff(context, modified_content)
    vim.notify("llm: showing unified diff", vim.log.levels.INFO)

    if not context or not context.content or #context.content == 0 then
        vim.notify("llm: context is empty", vim.log.levels.ERROR)
        return
    end

    if not modified_content or modified_content == "" then
        vim.notify("llm: response is empty", vim.log.levels.ERROR)
        return
    end

    local curr_lines = vim.api.nvim_buf_get_lines(llm.buffer, 0, -1, false)
    if not curr_lines or #curr_lines == 0 then
        vim.notify("llm: current buffer is empty", vim.log.levels.ERROR)
        return
    end

    -- Create a new buffer, and copy the current content across.
    local diff_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(diff_buf, "filetype", vim.bo.filetype)
    vim.api.nvim_buf_set_option(diff_buf, "buftype", "nofile")

    -- Apply the changes to the diff buffer.
    local modified_lines = vim.split(modified_content, "\n")
    vim.api.nvim_buf_set_lines(diff_buf, 0, -1, false, curr_lines)
    vim.api.nvim_buf_set_lines(diff_buf, context.selection[1] - 1, context.selection[2], false, modified_lines)

    -- Switch focus.
    vim.api.nvim_set_current_win(llm.window)
    vim.api.nvim_set_current_buf(diff_buf)

    -- Remove all existing diffs.
    vim.cmd("diffoff!")

    -- Enable diff mode.
    vim.api.nvim_buf_call(llm.buffer, function()
        vim.cmd("diffthis")
    end)
    vim.api.nvim_buf_call(diff_buf, function()
        vim.cmd("diffthis")
    end)

    vim.api.nvim_buf_create_user_command(diff_buf, "LLMApplyDiff", function()
        vim.api.nvim_buf_call(llm.buffer, function()
            vim.cmd("diffoff")
        end)

        vim.api.nvim_buf_call(diff_buf, function()
            vim.cmd("diffoff")
        end)

        vim.api.nvim_set_current_win(llm.window)
        vim.api.nvim_set_current_buf(llm.buffer)

        local ns_id = vim.api.nvim_create_namespace("llm")

        local function update_line(index)
            if index > #modified_lines or #modified_lines == 0 then
                vim.notify("llm: all changes applied", vim.log.levels.INFO)
                return
            end

            local line_index = context.selection[1] + index - 1
            vim.api.nvim_win_set_cursor(0, { line_index + 1, 0 })
            vim.api.nvim_buf_add_highlight(llm.buffer, ns_id, "DiffChange", line_index, 0, -1)

            -- wait a small delay before applying the change.
            vim.defer_fn(function()
                vim.api.nvim_buf_set_lines(llm.buffer, line_index, line_index + 1, false, { modified_lines[index] })

                -- clear the diff highlights after a small delay.
                vim.defer_fn(function()
                    vim.api.nvim_buf_clear_namespace(llm.buffer, ns_id, line_index, line_index + 1)
                end, 500)

                vim.defer_fn(function()
                    -- apply the next line.
                    update_line(index + 1)
                end, 100)
            end, 200)
        end

        update_line(1)
        vim.api.nvim_buf_delete(diff_buf, { force = true })
        vim.notify("llm: changes applied", vim.log.levels.INFO)
    end, {})

    vim.api.nvim_buf_create_user_command(diff_buf, "LLMDiscardDiff", function()
        vim.api.nvim_buf_call(llm.buffer, function()
            vim.cmd("diffoff")
        end)

        vim.api.nvim_buf_call(diff_buf, function()
            vim.cmd("diffoff")
        end)

        vim.api.nvim_set_current_win(llm.window)
        vim.api.nvim_set_current_buf(llm.buffer)

        vim.api.nvim_buf_delete(diff_buf, { force = true })
        vim.notify("llm: changes discarded", vim.log.levels.INFO)
    end, {})

    vim.api.nvim_buf_set_keymap(diff_buf, "n", "w", ":LLMApplyDiff<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(diff_buf, "n", "q", ":LLMDiscardDiff<CR>", { noremap = true, silent = true })
end

function llm.write_json(path, json)
    local ok, completion = pcall(vim.json.decode, json)
    if not ok then
        llm.write(completion)
    else
        llm.write(path, json.choices[1].message.content)
    end

    vim.schedule(llm.refresh_output_buffer)
end

function llm.write(path, data)
    local file = io.open(path, "a")
    if not file then
        error("llm: could not open file.")
        return
    end

    file:write(data)
    file:write("\n")
    file:close()

    vim.schedule(llm.refresh_output_buffer)
end

function llm.refresh_output_buffer()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_name(buf) == llm.opts.output_file then
            vim.api.nvim_buf_call(buf, function()
                vim.cmd("edit!")
            end)
        end
    end
end

function llm.send_req(req)
    if not req.prompt or req.prompt == "" then
        vim.notify("llm: no prompt provided, cancelling request.", vim.log.levels.ERROR)
        return
    end

    if not req.context or req.context == "" then
        vim.notify("llm: no context provided, cancelling request.", vim.log.levels.ERROR)
        return
    end

    if llm.active_job then
        vim.notify("llm: request already in progress, killing it.", vim.log.levels.WARN)
        llm.active_job:shutdown()
        llm.active_job = nil
    end

    local req_payload = {
        model = llm.opts.model,
        temperature = llm.opts.temperature,
        messages = {
            {
                role = "developer",
                content = llm.opts.systemPrompt,
            },
            {
                role = "user",
                content = req.prompt,
            },
            {
                role = "user",
                content = req.context.filename,
            },
            {
                role = "user",
                content = table.concat(req.context.content, "\n"),
            },
        },
        prediction = {
            type = "content",
            content = table.concat(req.context.content, "\n"),
        },
    }

    local req_args = {
        "-s", -- suppress progress logs being sent to stderr.
        "-N", -- disable buffering.
        "-X", "POST",
        "-H", "Content-Type: application/json",
        "-H", "Authorization: Bearer " .. llm.opts.api_key,
        "-d", vim.json.encode(req_payload),
        "https://api.openai.com/v1/chat/completions",
    }

    local response_chunks = {}
    llm.active_job = Job:new({
        command = "curl",
        args = req_args,
        on_stderr = function(_, err)
            vim.schedule(function()
                vim.notify("llm: request failed with error: " .. err, vim.log.levels.ERROR)
            end)
        end,
        on_exit = function(_, exit_code)
            vim.schedule(function()
                vim.notify("llm: request completed with exit code: " .. exit_code, vim.log.levels.INFO)
            end)
            llm.active_job = nil
        end,
        on_stdout = function(_, data)
            table.insert(response_chunks, data)
        end,
    }):sync()

    return table.concat(response_chunks)
end

return llm
