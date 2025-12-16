-----------------------------------------------------------------------------------------------------------------------
-- [[ Set globals. ]] --
-----------------------------------------------------------------------------------------------------------------------
local g = vim.g

g.mapleader = ","
g.maplocalleader = ","
g.netrw_banner = 0 -- Disable showing the information banner on the top of netrw.
g.netrw_browse_split = 0 -- Sets the behavior of pressing <CR> on a selected file in netrw.
g.netrw_liststyle = 3 -- Sets the default list style in netrw.
g.netrw_winsize = 20 -- Sets the initial size of new netrw windows.

-----------------------------------------------------------------------------------------------------------------------
-- [[ Set options. ]] --
-----------------------------------------------------------------------------------------------------------------------
local opt = vim.opt

opt.background = "dark" -- Use the dark variant of colorschemes.
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard.
opt.colorcolumn = "120"
opt.confirm = true -- Confirm to save changes when exiting a modified buffer.
opt.cursorline = false
opt.expandtab = true -- Use spaces instead of <Tab>s.
opt.hlsearch = false -- Disable keeping search results highlighted.
opt.inccommand = "nosplit" -- Incrementally show the effects of commands.
opt.incsearch = true -- Find search results as the search query is typed.
opt.laststatus = 0 -- Show a single status line for all splits.
opt.number = true
opt.shiftwidth = 4
opt.signcolumn = "yes" -- Always show the sign column to prevent the UI shifting.
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.textwidth = 120 -- Auto-wrap comments at 120 characters.
opt.undofile = true
opt.undolevels = 10000
opt.wrap = true

-----------------------------------------------------------------------------------------------------------------------
-- [[ Configuration commands. ]] --
-----------------------------------------------------------------------------------------------------------------------
local cmd = vim.cmd

cmd("filetype plugin indent on")
