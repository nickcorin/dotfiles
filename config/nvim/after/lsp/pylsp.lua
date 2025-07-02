return {
	settings = {
		pylsp = {
			configurationSources = { "flake8" },
			plugins = {
				pycodestyle = {
					ignore = { "E501" }, -- Ignore line length errors
					maxLineLength = 120, -- Set max line length to 120 characters
				},
			},
		},
	},
}
