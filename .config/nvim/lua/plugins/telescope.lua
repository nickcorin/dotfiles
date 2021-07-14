
local keys = {
	{"<leader>b", "<cmd>lua require(\"telescope.builtin\").buffers()<CR>"},
	{"<leader>f", "<cmd>lua require(\"telescope.builtin\").live_grep()<CR>"},
	{"<leader>g", "<cmd>lua require(\"telescope.builtin\").git_files()<CR>"},
	{"<leader>h", "<cmd>lua require(\"telescope.builtin\").help_tags()<CR>"},
	{"<leader>z", "<cmd>lua require(\"telescope.builtin\").find_files()<CR>"},
}

for _, key in pairs(keys) do
	local default_opts = {noremap=true, silent=true}

	-- The unpack function has been replaced by table.unpack in Lua 5.2.
	-- Make sure to fix this once Neovim upgrades Lua.
	local prefix, cmd = unpack(key)
	vim.api.nvim_set_keymap("n", prefix, cmd, default_opts)
end

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
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
