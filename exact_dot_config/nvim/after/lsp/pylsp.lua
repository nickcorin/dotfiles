return {
	plugins = {
		-- Enable mypy with pydantic support
		mypy = {
			enabled = true,
			config_file = "pyproject.toml",
			live_mode = true,
			dmypy = false,
		},

		-- Disable conflicting linters (let ruff handle these)
		pycodestyle = { enabled = false },
		pyflakes = { enabled = false },
		mccabe = { enabled = false },
		pydocstyle = { enabled = false },
		autopep8 = { enabled = false },
		yapf = { enabled = false },

		-- Keep useful non-linting features
		jedi_completion = { enabled = true },
		jedi_hover = { enabled = true },
		jedi_references = { enabled = true },
		jedi_signature_help = { enabled = true },
		jedi_symbols = { enabled = true },
	},
}
