-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local keys = {
	{
		"<leader>a",
		"ggVG",
		mode = { "n" },
		desc = "Select entire buffer",
	},
	{
		"<leader>c",
		":cclose<CR>",
		mode = { "n" },
		desc = "Close quickfix window",
	},
	{
		"<C-d>",
		"<C-d>zz",
		mode = { "n" },
		desc = "Page down and center",
	},
	{
		"<C-u>",
		"<C-u>zz",
		mode = { "n" },
		desc = "Page up and center",
	},
	{
		"<leader>d",
		"yyp",
		mode = { "n", "v" },
		desc = "Duplicate lines down",
	},
	{
		"<leader>e",
		"<cmd>lua Snacks.explorer()<CR>",
		mode = { "n" },
		desc = "Toggle file explorer",
	},
	{
		"gd",
		"<cmd>lua Snacks.picker.lsp_definitions()<CR>",
		mode = { "n" },
		desc = "Go to definition",
	},
	{
		"gf",
		"<cmd>lua vim.diagnostic.open_float()<CR>",
		mode = { "n" },
		desc = "Open diagnostic float",
	},
	{
		"gto",
		"<cmd>lua MiniDiff.toggle_overlay()<CR>",
		mode = { "n" },
		desc = "Toggle the mini.diff overlay.",
	},
	{
		"j",
		"gj",
		mode = { "n" },
		desc = "Move cursor by line",
	},
	{
		"k",
		"gk",
		mode = { "n" },
		desc = "Move cursor by line",
	},
	{
		"n",
		"nzz",
		mode = { "n" },
		desc = "Center search results",
	},
	{
		"N",
		"Nzz",
		mode = { "n" },
		desc = "Center search results",
	},
	{
		"*",
		"*zz",
		mode = { "n" },
		desc = "Center search results",
	},
	{
		"#",
		"#zz",
		mode = { "n" },
		desc = "Center search results",
	},
	{
		"g*",
		"g*zz",
		mode = { "n" },
		desc = "Center search results",
	},
	{
		"<leader>p",
		"<cmd>AgentToggle<CR>",
		mode = { "n", "v" },
		desc = "Toggles the Agent's sidebar.",
	},
	{ "<leader>q", ":q!<CR>", mode = { "n" }, desc = "Fast quit" },
	{ "<leader>r", ":LspRestart<CR>", mode = { "n" }, desc = "Restart LSP" },
	{ "<leader>w", ":w!<CR>", mode = { "n" }, desc = "Fast save" },
	{
		"<leader>x",
		":x!<CR>",
		mode = { "n" },
		desc = "Fast save and quit",
	},
	{
		"<Up>",
		"<nop>",
		mode = { "n" },
		desc = "Disable arrow keys",
	},
	{
		"<Down>",
		"<nop>",
		mode = { "n" },
		desc = "Disable arrow keys",
	},
	{
		"<Left>",
		"<nop>",
		mode = { "n" },
		desc = "Disable arrow keys",
	},
	{
		"<Right>",
		"<nop>",
		mode = { "n" },
		desc = "Disable arrow keys",
	},
	{
		"p",
		'"_dp',
		mode = { "v", "x" },
		desc = "Preserve copied content when pasting",
	},
	{
		"P",
		'"_dP',
		mode = { "v", "x" },
		desc = "Preserve copied content when pasting",
	},
	{
		"<S-j>",
		":m'>+1<CR>gv=gv",
		mode = { "v" },
		desc = "Shift lines down",
	},
	{ "<S-k>", ":m'<-2<CR>gv=gv", mode = { "v" }, desc = "Shift lines up" },
	{
		">",
		">gv",
		mode = { "v" },
		desc = "Keep line selected after indenting",
	},
	{
		"<",
		"<gv",
		mode = { "v" },
		desc = "Keep line selected after indenting",
	},
	{
		"H",
		"^",
		mode = { "" },
		desc = "Use home row for Home",
	},
	{
		"L",
		"$",
		mode = { "" },
		desc = "Use home row for End",
	},
	{ "Q", "<nop>", mode = { "" }, desc = "Disable Q" },
}

local default_opts = { silent = true, noremap = true }

for _, map in pairs(keys) do
	local opts = {
		silent = map.silent or default_opts.silent,
		noremap = map.noremap or default_opts.noremap,
		desc = map.desc,
	}
	for _, m in pairs(map.mode) do
		vim.keymap.set(m, map[1], map[2], opts)
	end
end
