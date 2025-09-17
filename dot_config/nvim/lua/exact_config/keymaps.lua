local keys = {
	{
		key = "<leader>a",
		action = "ggVG",
		modes = { "n" },
		desc = "Select entire buffer",
	},
	{
		key = "<leader>c",
		action = ":cclose<CR>",
		modes = { "n" },
		desc = "Close quickfix window",
	},
	{
		key = "<C-d>",
		action = "<C-d>zz",
		modes = { "n" },
		desc = "Page down and center",
	},
	{
		key = "<C-u>",
		action = "<C-u>zz",
		modes = { "n" },
		desc = "Page up and center",
	},
	{
		key = "<leader>d",
		action = "yyp",
		modes = { "n", "v" },
		desc = "Duplicate lines down",
	},
	{
		key = "j",
		action = "v:count == 0 ? 'gj' : 'j'",
		modes = { "n", "x" },
		desc = "Move cursor by line",
		expr = true,
	},
	{
		key = "k",
		action = "v:count == 0 ? 'gk' : 'k'",
		modes = { "n", "x" },
		desc = "Move cursor by line",
		expr = true,
	},
	{
		key = "n",
		action = "nzz",
		modes = { "n" },
		desc = "Next search result and center screen",
	},
	{
		key = "N",
		action = "Nzz",
		modes = { "n" },
		desc = "Previous search result and center screen",
	},
	{
		key = "*",
		action = "*zz",
		modes = { "n" },
		desc = "Search word under cursor forward and center",
	},
	{
		key = "#",
		action = "#zz",
		modes = { "n" },
		desc = "Search word under cursor backward and center",
	},
	{
		key = "g*",
		action = "g*zz",
		modes = { "n" },
		desc = "Search partial word under cursor forward and center",
	},
	{
		key = "<leader>q",
		action = ":quit<CR>",
		modes = { "n" },
		desc = "Quit",
	},
	{
		key = "<leader>w",
		action = ":write<CR>",
		modes = { "n" },
		desc = "Save",
	},
	{
		key = "<leader>x",
		action = ":xit<CR>",
		modes = { "n" },
		desc = "Save if necessary, and quit",
	},
	{
		key = "<Up>",
		action = "<nop>",
		modes = { "n" },
		desc = "Disable arrow keys",
	},
	{
		key = "<Down>",
		action = "<nop>",
		modes = { "n" },
		desc = "Disable arrow keys",
	},
	{
		key = "<Left>",
		action = "<nop>",
		modes = { "n" },
		desc = "Disable arrow keys",
	},
	{
		key = "<Right>",
		action = "<nop>",
		modes = { "n" },
		desc = "Disable arrow keys",
	},
	{
		key = "p",
		action = '"_dp',
		modes = { "v", "x" },
		desc = "Preserve copied content when pasting",
	},
	{
		key = "P",
		action = '"_dP',
		modes = { "v", "x" },
		desc = "Preserve copied content when pasting",
	},
	{
		key = "J",
		action = ":m'>+1<CR>gv=gv",
		modes = { "v" },
		desc = "Shift lines down",
	},
	{
		key = "K",
		action = ":m'<-2<CR>gv=gv",
		modes = { "v" },
		desc = "Shift lines up",
	},
	{
		key = ">",
		action = ">gv",
		modes = { "v" },
		desc = "Keep line selected after indenting",
	},
	{
		key = "<",
		action = "<gv",
		modes = { "v" },
		desc = "Keep line selected after indenting",
	},
	{
		key = "H",
		action = "^",
		modes = { "" },
		desc = "Use home row for Home",
	},
	{
		key = "L",
		action = "$",
		modes = { "" },
		desc = "Use home row for End",
	},
	{
		key = "Q",
		action = "<nop>",
		modes = { "" },
		desc = "Disable Q",
	},
	{
		key = "<esc>",
		action = function()
			vim.cmd("noh")
			return "<esc>"
		end,
		modes = { "i", "n", "s" },
		desc = "Escape and Clear hlsearch",
		expr = true,
	},
}

local default_opts = { silent = true, noremap = true }
local default_modes = { "" }

for _, map in pairs(keys) do
	local opts = vim.tbl_extend("force", default_opts, { desc = map.desc, expr = map.expr })
	for _, m in pairs(map.modes or default_modes) do
		vim.keymap.set(m, map.key, map.action, opts)
	end
end
