return {
	settings = {
		pylsp = {
			plugins = {
				mypy = {
					enabled = true,
					live_mode = true,
					strict = true,
					plugins = { "pydantic.mypy" },
					show_error_codes = true,
					check_untyped_defs = true,
					disallow_any_generics = true,
					disallow_untyped_defs = true,
					no_implicit_optional = true,
					warn_return_any = true,
					warn_unreachable = true,
				},
				ruff = {
					enabled = true,
					config = "pyproject.toml",
					format = { enabled = false }, -- Black handles formatting.
					lint = { enabled = true },
					organizeImports = true,
				},
				pycodestyle = { enabled = false }, -- Redundant with ruff.
			},
		},
	},
}
