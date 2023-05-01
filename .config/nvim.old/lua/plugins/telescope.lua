local keys = {
	{"<leader>b", "<cmd>lua require(\"telescope.builtin\").buffers()<CR>"},
	{"<leader>f", "<cmd>lua require(\"telescope.builtin\").live_grep()<CR>"},
	{"<leader>g", "<cmd>lua require(\"telescope.builtin\").git_files()<CR>"},
	{"<leader>h", "<cmd>lua require(\"telescope.builtin\").help_tags()<CR>"},
}

for _, key in pairs(keys) do
	local default_opts = {noremap=true, silent=true}

	-- The unpack function has been replaced by table.unpack in Lua 5.2.
	-- Make sure to fix this once Neovim upgrades Lua.
	local prefix, cmd = unpack(key)
	vim.api.nvim_set_keymap("n", prefix, cmd, default_opts)
end

local actions = require"telescope.actions"

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "normal",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    path_display = {"smart"},
	preview = require('telescope.config').values.cat_previewer,
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_lastused = true,
			previewer = false,
			mappings = {
				["<C-d>"] = actions.delete_buffer,
			}
		}
	}
  }
}
