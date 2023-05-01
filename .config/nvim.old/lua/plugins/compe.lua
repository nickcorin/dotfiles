local compe = require"compe"

local keys = {
	{"<C-Space>", "compe#complete()"},
	{"<CR>", "compe#confirm(\"<CR>\")"},
	{"<C-e>", "compe#close(\"<C-e>\")"},
	{"<C-f>", "compe#scroll({\"delta\": +4})"},
	{"<C-d>", "compe#scroll({\"delta\": -4})"},
}

for _, key in pairs(keys) do
	local default_opts = {noremap=true, silent=true, expr=true}

	-- The unpack function has been replaced by table.unpack in Lua 5.2.
	-- Make sure to fix this once Neovim upgrades Lua.
	local prefix, cmd = unpack(key)
	vim.api.nvim_set_keymap("i", prefix, cmd, default_opts)
end

compe.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	resolve_timeout = 800;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = {
		-- The border optino is the same as `|help nvim_open_win|`.
		border = { '', '' ,'', ' ', '', '', '', ' ' },
			winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
			max_width = 120,
			min_width = 60,
			max_height = math.floor(vim.o.lines * 0.3),
			min_height = 1,
	};

	source = {
		path = true;
		buffer = true;
		calc = true;
		nvim_lsp = true;
		nvim_lua = true;
		vsnip = true;
		ultisnips = true;
		luasnip = true;
	};
}
