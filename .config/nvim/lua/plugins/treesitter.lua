
require('nvim-treesitter.configs').setup{
	ensure_installer = "maintained",
	matchup = {
		enable = true,
		include_match_words = true
	},
	highlight = {
		enable = true,
		disable = {""}
	},
	indent = {
		enable = false,
	}
}
