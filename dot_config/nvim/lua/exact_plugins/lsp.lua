return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufNewFile", "BufReadPost" },
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
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
			table.sort(servers)

			------------------------------------------------------------------------------------------------------------
			-- Install and enable LSP servers.
			------------------------------------------------------------------------------------------------------------
			require("mason-lspconfig").setup({
				automatic_enable = servers,
				ensure_installed = servers,
			})

			------------------------------------------------------------------------------------------------------------
			-- Configure LSP diagnostics.
			------------------------------------------------------------------------------------------------------------
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			vim.diagnostic.config({
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
