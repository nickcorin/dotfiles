local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
end)

lsp.ensure_installed({
    'clangd',
    'gopls',
    'jdtls',
    'jedi_language_server',
    'lua_ls',
    'tsserver',
    'rust_analyzer'
})

-- Specific LSP configuration options.
require('lspconfig').gopls.setup({
    settings = {
        gopls = {
            gofumpt = true,
        },
    },
})

require('lspconfig').clangd.setup({
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol("") end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()
