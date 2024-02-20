local api = vim.api

-- Highlight on yank.
api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
       vim.highlight.on_yank({higroup = 'IncSearch', timeout = 1000})
    end
})

