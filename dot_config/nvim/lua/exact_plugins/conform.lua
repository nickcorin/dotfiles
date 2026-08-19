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
				append_args = { "--extra" },
			},
		},
		formatters_by_ft = {
			css = { "prettier" },
			go = { "gofumpt", "goimports" },
			html = { "prettier" },
			javascript = { "prettier" },
			json = { "jq" },
			jsonc = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			python = { "ruff_fix", "ruff_format" },
			rust = { "rustfmt" },
			typescript = { "prettier" },
			yaml = { "prettier" },
			["_"] = { "trim_whitespace" },
		},
	},
}
