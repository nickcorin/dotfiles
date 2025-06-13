return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {
			PATH = "prepend",
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPost",
		dependencies = {
			-- "saghen/blink.cmp",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			------------------------------------------------------------------------------------------------------------
			-- Enable global defaults.
			------------------------------------------------------------------------------------------------------------
			-- vim.lsp.config("*", {
			-- 	capabilities = require("blink.cmp").get_lsp_capabilities(),
			-- })

			------------------------------------------------------------------------------------------------------------
			-- Load LSP servers.
			------------------------------------------------------------------------------------------------------------
			local servers = {}
			local config_dir = vim.fs.normalize(vim.fn.stdpath("config") .. "/after/lsp")

			for file in vim.fs.dir(config_dir) do
				local server_name = file:match("(.+)%.lua$")
				if server_name then
					servers[#servers + 1] = server_name
				end
			end

			------------------------------------------------------------------------------------------------------------
			-- Hand off servers to Mason. Config will be applied automatically by neovim.
			------------------------------------------------------------------------------------------------------------
			require("mason-lspconfig").setup({
				automatic_enable = false,
				ensure_installed = servers,
			})

			------------------------------------------------------------------------------------------------------------
			-- Enable LSP servers.
			------------------------------------------------------------------------------------------------------------
			vim.lsp.enable(servers)

			------------------------------------------------------------------------------------------------------------
			-- Configure LSP diagnostics.
			------------------------------------------------------------------------------------------------------------
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			vim.diagnostic.config({
				document_highlight = true,
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = signs.Error,
						[vim.diagnostic.severity.HINT] = signs.Hint,
						[vim.diagnostic.severity.INFO] = signs.Info,
						[vim.diagnostic.severity.WARN] = signs.Warn,
					},
				},
				underline = true,
				virtual_lines = false,
				virtual_text = false,
			})
		end,
	},
}
