return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	opts = {
		format_on_save = {
			lsp_format = "fallback",
		},
		formatters = {
			gofumpt = {
				command = "gofumpt",
				args = { "--extra" },
			},
		},
		formatters_by_ft = {
			css = { "prettier" },
			go = { "gofumpt", "goimports" },
			html = { "prettier" },
			javascript = { "prettier" },
			json = { "jq" },
			jsonc = { "jq" },
			lua = { "stylua" },
			markdown = { "prettier" },
			python = { "ruff_fix", "ruff_format" },
			rust = { "rustfmt" },
			typescript = { "prettier" },
			yaml = { "prettier" },
			["_"] = { "trim_whitespace" },
		},
		log_level = vim.log.levels.TRACE,
		notify_on_error = true,
		notify_no_formatters = true,
	},
}
