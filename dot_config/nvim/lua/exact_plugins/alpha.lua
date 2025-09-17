return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	opts = function()
		return require("alpha.themes.startify").config
	end,
}
