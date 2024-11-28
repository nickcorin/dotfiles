local api = vim.api

-- Don't auto comment new line.
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Format on save.
api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end
})

api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
    end
})

-- Highlight on yank.
api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 1000 })
    end
})

-- Resize neovim split when terminal is resized.
vim.api.nvim_command("autocmd VimResized * wincmd =")
