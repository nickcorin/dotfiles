-- Set the leader key to <Space>. This must be set before any other keymaps that
-- use the <leader> key.
vim.g.mapleader = ","

local keys = {
	-- Insert mode.
	i = {},
	-- Normal mode.
	n = {
		-- Closes the quickfix window.
		{"<leader>a", ":cclose<CR>"},
		-- Duplicate lines down. Similar to Ctrl-D in other code editors.
		{"<leader>d", "yyp"},
		-- Opens a new file for editing adjacent to the current open file.
		{"<leader>e", ":e <C-R>=expand(\"%:p:h\") . \"/\" <CR>"},
		-- Fast quit.
		{"<leader>q", ":q!<CR>"},
		-- Fast save.
		{"<leader>w", ":w!<CR>"},
		-- Fast save and quit. Only saves if the file has been changed.
		{"<leader>x", ":x!<CR>"},
		-- Clear the current search, and remove highlights.
		{"<leader><space>", ":nohlsearch<CR>"},

		-- Set the cursor to move by line in the editor rather than by line in
		-- the file. This means that multi-line rows won't be treated as a
		-- single line.
		{"j", "gj"}, {"k", "gk"},

		-- Disable the use of the arrow keys. Rather use the home row.
		{"<Up>", ""}, {"<Down>", ""}, {"<Left>", ""}, {"<Right>", ""},

		-- Place all search results in the center of the screen.
		{"n", "nzz"}, {"N", "Nzz"}, {"*", "*zz"}, {"#", "#zz"}, {"g*", "g*zz"},
	},
	-- Visual / select mode.
	v = {
		-- Duplicate lines down. Similar to Ctrl-D in other code editors.
		{"<leader>d", "yyp"},

		-- After indenting a line, keep it selected so that you can do it again.
		{">", ">gv"}, {"<", "<gv"},

		-- Shift complete lines up and down.
		{"<S-j>", ":m'>+1<CR>gv=gv"}, {"<S-k>", ":m'<-2<CR>gv=gv"}, 
	},
	-- Visual mode.
	x = {},
	-- All modes.
	[""] = {
		-- Use the home row for Home / End.
		{"H", "^"}, {"L", "$"},

		-- Easier split-pane switching using the home row.
		{"<C-j>", "<C-W>j"},
		{"<C-k>", "<C-W>k"},
		{"<C-h>", "<C-W>h"},
		{"<C-l>", "<C-W>l"},
	},
}

local default_opts = {silent = true, noremap = true}

for mode, mode_map in pairs(keys) do
	for _, map in pairs(mode_map) do
		-- If the length of the table is 3, then we've got additional options.
		-- This removes the last element from the table, in this case isolating
		-- the options.
		local opts = #mode_map == 3 and table.remove(map) or default_opts

		-- After the options have been removed, we can unpack the first
		-- two elements in the table.
		--
		-- The unpack function has been replaced by table.unpack in Lua 5.2.
		-- Make sure to fix this once Neovim upgrades Lua.
		local prefix, cmd = unpack(map)
		vim.api.nvim_set_keymap(mode, prefix, cmd, opts)
	end
end
