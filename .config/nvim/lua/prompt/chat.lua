local api = vim.api

local n = require("nui-components")
local Renderer = require("nui.renderer")

local NuiSplit = require("nui.split")

---@class ChatUI
local ChatUI = {}

--- @class ChatUI
--- @field renderer Renderer
--- @field windows table<string, NuiSplit | nil>
---
--- @returns Chat
function ChatUI:new()
    local chat = setmetatable({
        renderer = n.create_renderer({}),
        windows = {
            chat = nil,
        },
        visible = false,
    }, { __index = self })

    return chat
end

function ChatUI:init_chat()
    if self.windows.chat ~= nil then
        return
    end

    vim.cmd.split(0, "", "vertical")
end

function ChatUI:show()
    if self.windows.chat == nil then
        self:init_chat()
    end

    self.renderer:render(self.windows.chat)
end

function ChatUI:hide()
    if self.windows.chat == nil then
        return
    end

    self.renderer:unmount(self.windows.chat)
    self.windows.chat = nil
end

function ChatUI:toggle()
end

local Split = n.Component:extend("Split")

function Split:init(props)
    Split.super.init(self, vim.tbl_extend("force", NuiSplit, props))
end
