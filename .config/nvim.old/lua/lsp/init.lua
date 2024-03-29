local lsp = require"lspconfig"

-- This function will be run once an LSP is attached to an active buffer.
local on_attach = function(client, bufnr)
	local keys = {
		{"gd", "<cmd>lua vim.lsp.buf.definition()<CR>"},
		{"gD", "<cmd>lua vim.lsp.buf.declaration()<CR>"},
		{"gr", "<cmd>lua vim.lsp.buf.references()<CR>"},
		{"gi", "<cmd>lua vim.lsp.buf.implementation()<CR>"},
		{"K", "<cmd>lua vim.lsp.buf.hover()<CR>"},

		{"dn", "<cmd>lua vim.diagnostic.goto_next()<CR>"},
		{"dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>"},
		{"df", "<cmd>lua vim.diagnostic.open_float()<CR>"},
	}

	for _, key in pairs(keys) do
		local default_opts = {noremap=false, silent=false}

		-- The unpack function has been replaced by table.unpack in Lua 5.2.
		-- Make sure to fix this once Neovim upgrades Lua.
		local prefix, cmd = unpack(key)
		vim.api.nvim_buf_set_keymap(bufnr, "n", prefix, cmd, default_opts)
	end

	local go = require"lsp/go"

	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_exec("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()", false)
		vim.api.nvim_exec("autocmd BufWritePre *.go lua OrgImports(1000)", false)
 	end
end

local servers = {
	gopls = {
		cmd = {"gopls"},
		filetypes = {"go", "gomod"},
		on_attach = on_attach,
		root_dir = lsp.util.root_pattern("go.mod", ".git"),
		settings = {
			gopls = {
				analyses = {
					fieldalignment = true,
					nilness = true,
					unusedparams = true,
					unusedwrite = true,
				},
				buildFlags = {"-tags=wireinject"},
				gofumpt = true,
				["local"] = "github.com/nickcorin,adventech",
				usePlaceholders = true,
			}
		}
	},

	pyright = {},

	rust_analyzer = {
		assist = {
			importGranularity = "module",
			importPrefix = "by_self",
		},
		cargo = {
			loadOutDirsFromCheck = true
		},
		procMacro = {
			enable = true
		},
	},

	solc = {
		cmd = {"solc", "--lsp"},
		filetypes = {"solidity"},
	},

	tsserver = {}
}

for server, config in pairs(servers) do
	lsp[server].setup(config)
end
