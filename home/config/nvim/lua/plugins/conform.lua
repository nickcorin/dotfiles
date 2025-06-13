return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	opts = {
		default_format_opts = {
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
			lua = { "stylua" },
			markdown = { "prettier" },
			python = { "ruff" },
			typescript = { "prettier" },
			yaml = { "prettier" },
			["_"] = { "trim_whitespace" },
		},
		notify_on_error = true,
		notify_no_formatters = true,
	},
}
