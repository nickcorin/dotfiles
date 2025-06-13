local split = require("nui.split")
local event = require("nui.utils.autocmd").event

local default_config = require("prompt.config").defaults

---@class Sidebar
---@field chat table | nil
---@field prompt table | nil
---@field on_submit fun(prompt: string)
local Sidebar = {}

---@return Sidebar
function Sidebar:new(opts)
    opts = vim.tbl_deep_extend("force", default_config.sidebar, opts or {})

    local sidebar = setmetatable({
        chat = split({
            relative = "editor",
            position = opts.position,
            size = opts.size,
            enter = false,
            buf_options = vim.tbl_extend("force", opts.buf_opts, {}),
            win_options = vim.tbl_extend("force", opts.win_opts, {
                winbar = opts.chat.title,
            }),
        }),
        prompt = split({
            relative = {
                type = "win",
                winid = 0, -- this must be set after the chat container is created.
            },
            position = opts.prompt.position,
            size = opts.prompt.size,
            enter = false,
            buf_options = vim.tbl_extend("force", opts.buf_opts, {
                buftype = "prompt",
                modifiable = true,
            }),
            win_options = vim.tbl_extend("force", opts.win_opts, {
                winbar = opts.prompt.title,
            }),
        }),
        on_submit = opts.prompt.callback,
    }, { __index = self })

    return sidebar
end

-- Submit the prompt and clear the buffer.
function Sidebar:_submit_prompt(prompt)
    vim.api.nvim_buf_set_lines(self.prompt.bufnr, 0, -1, false, {})
    self.on_submit(prompt)
end

---@param partial string -- the partial to stream to the chat.
---@param hlgroup? string -- the highlight group to use for the partial.
function Sidebar:stream_to_chat(partial, hlgroup)
    assert(self.chat, "Chat container is not initialized.")
    if #partial == 0 then return end
    if not hlgroup or hlgroup == "" then hlgroup = "Normal" end

    local lines = vim.split(partial, "\n")

    self.chat:show()

    local line_count = vim.api.nvim_buf_line_count(self.chat.bufnr)
    local last_line = vim.api.nvim_buf_get_lines(self.chat.bufnr, -2, -1, false)

    local col = 0
    if #last_line > 0 then col = #last_line[1] end
    vim.api.nvim_win_set_cursor(self.chat.winid, { line_count, col })

    vim.api.nvim_set_option_value("modifiable", true, { buf = self.chat.bufnr })
    for i, line in ipairs(lines) do
        vim.api.nvim_buf_call(self.chat.bufnr, function()
            vim.api.nvim_put({ line }, "c", true, true)
        end)
        vim.api.nvim_buf_add_highlight(self.chat.bufnr, -1, hlgroup, line_count + i - 1, 0, -1)
    end
    vim.api.nvim_buf_set_lines(self.chat.bufnr, -1, -1, false, { "" })
    vim.api.nvim_set_option_value("modifiable", false, { buf = self.chat.bufnr })
end

function Sidebar:_init()
    self.chat:on(event.BufWinEnter, function(_)
        self.prompt:update_layout({ relative = { type = "win", winid = self.chat.winid } })
    end)

    self.chat:on(event.BufWinLeave, function(_)
        self.prompt:update_layout({ relative = "editor" })
    end)
end

function Sidebar:show()
    self:_init()

    self.chat:show()
    self.prompt:show()

    vim.fn.prompt_setcallback(self.prompt.bufnr, function(prompt) self:_submit_prompt(prompt) end)
    vim.api.nvim_set_current_win(self.prompt.winid)
end

function Sidebar:hide()
    self.chat:hide()
    self.prompt:hide()
end

-- Toggles the visibility of the sidebar.
function Sidebar:toggle()
    if self.chat.winid and vim.api.nvim_win_is_valid(self.chat.winid) then
        self:hide()
    else
        self:show()
    end
end

return Sidebar
