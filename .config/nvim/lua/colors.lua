
vim.opt.background = 'dark'

-- Set the background color - medium / dark (default medium).
vim.cmd("set background=dark")

-- Enable termguicolors.
vim.cmd("set termguicolors")

-- Set the colorscheme's contrast settings - hard, medium (default), or soft.
vim.g.gruvbox_material_background = "hard"

-- Not sure what this does, but sure? ...it generated some files after I sourced this config. Hmm.
vim.g.gruvbox_material_better_performance = 1

-- Set the colorscheme.
-- vim.cmd("colorscheme tundra")
vim.cmd('colorscheme gruvbox-material')
