-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local globals = {
	-- Map leader and local leader keys to space.
	mapleader = " ",
	maplocalleader = ",",

	-- Disable showing the information banner on the top of netrw.
	netrw_banner = 0,

	-- Sets the behavior of pressing <CR> on a selected file in netrw.
	netrw_browse_split = 0,

	-- Sets the default list style in netrw.
	netrw_liststyle = 3,

	-- Sets the initial size of new netrw windows.
	netrw_winsize = 20,
}

for k, v in pairs(globals) do
	vim.g[k] = v
end

local settings = {
	-- Disable creating backup files.
	backup = false,

	-- Set background to dark.
	background = "dark",

	-- Always access the system clipboard both ways. Yanking copies onto it
	-- and you can paste with P from it.
	clipboard = "unnamedplus",

	-- Set the visual ruler.
	colorcolumn = "120",

	-- Enable highlighting of the line your cursor is on.
	cursorline = false,

	-- Improve the diff view by matching lines within a window.
	diffopt = "internal,filler,closeoff,linematch:60",

	-- Disable the audible terminal bells.
	errorbells = false,

	-- Use spaces instead of <Tab>s.
	expandtab = true,

	-- Disable keeping search results highlighted.
	hlsearch = false,

	-- Find search results as the search query is typed.
	incsearch = true,

	-- Single status line for the whole instance.
	laststatus = 3,

	-- list = false, -- Disable showing whitespace characters like tabs and trailing spaces.

	-- Enable mouse mode. Only allows scrolling within the VIM buffer, and extends scrolling after EOF.
	mouse = "a",

	-- Show line numbers.
	number = true,

	-- Show true numbers, not relative.
	relativenumber = false,

	-- Keep a minimum number of lines padding my cursor at the top or bottom of the buffer.
	scrolloff = 8,

	-- Number of spaces to use for each step of indenting.
	shiftwidth = 4,

	-- Only show tabs when there are more than one tab open.
	showtabline = 1,

	-- Always show the sign column, otherwise it shifts the text each time it's added and removed.
	signcolumn = "yes",

	-- Enable autoindenting when starting a new line.
	smartindent = true,

	-- The number of spaces that a <Tab> in the file counts for during editing cmds.
	softtabstop = 4,

	-- Split the pane below.
	splitbelow = true,

	-- Split the pane to the right.
	splitright = true,

	-- Disable creating swapfiles.
	swapfile = false,

	-- The number of spaces that a <Tab> in the file counts for.
	tabstop = 4,

	-- Better colors.
	termguicolors = true,

	-- Auto-wrap comments at 120 characters.
	textwidth = 120,

	-- Sets the directory to store undo operations.
	undodir = os.getenv("HOME") .. "/nvim/undodir",

	-- Persist actions to enable undo even after restart.
	undofile = true,

	-- Faster update times.
	updatetime = 50,

	-- Disable the visual terminal bells.
	visualbell = false,

	-- Enable line wrapping.
	wrap = true,
}

for k, v in pairs(settings) do
	vim.opt[k] = v
end
