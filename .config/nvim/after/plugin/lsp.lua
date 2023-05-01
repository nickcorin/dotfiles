local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	lsp.buffer_autoformat()
end)

lsp.ensure_installed({
	'bashls',
	'clangd',
	'dockerls',
	'eslint',
	'gopls',
	'html',
	'jsonls',
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

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
