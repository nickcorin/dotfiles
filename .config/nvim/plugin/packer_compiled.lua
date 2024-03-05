-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/nick/.cache/nvim/packer_hererocks/2.1.1703358377/share/lua/5.1/?.lua;/Users/nick/.cache/nvim/packer_hererocks/2.1.1703358377/share/lua/5.1/?/init.lua;/Users/nick/.cache/nvim/packer_hererocks/2.1.1703358377/lib/luarocks/rocks-5.1/?.lua;/Users/nick/.cache/nvim/packer_hererocks/2.1.1703358377/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/nick/.cache/nvim/packer_hererocks/2.1.1703358377/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n^\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\topts\26alpha.themes.startify\nsetup\nalpha\frequire\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["copilot.vim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["gruvbox-material"] = {
    config = { "\27LJ\2\nÇ\2\0\0\3\0\f\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\1\6\0=\1\5\0006\0\0\0009\0\4\0'\1\b\0=\1\a\0006\0\0\0009\0\4\0)\1\1\0=\1\t\0006\0\0\0009\0\n\0'\2\v\0B\0\2\1K\0\1\0# colorscheme gruvbox-material \bcmd(gruvbox_material_better_performance\thard gruvbox_material_background\rmaterial gruvbox_material_foreground\6g\tdark\15background\bopt\bvim\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nv\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nscope\1\0\1\fenabled\1\vindent\1\0\1\tchar\b‚ñè\1\0\1\fenabled\2\nsetup\bibl\frequire\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine-so-fancy.nvim"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/lualine-so-fancy.nvim",
    url = "https://github.com/meuter/lualine-so-fancy.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n\5\0\0\a\0\"\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0004\4\3\0005\5\n\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0034\4\5\0005\5\15\0>\5\1\0045\5\16\0>\5\2\0045\5\17\0005\6\18\0=\6\19\5>\5\3\0045\5\20\0>\5\4\4=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0034\4\0\0=\4\26\3=\3\27\0025\3\28\0004\4\0\0=\4\f\0034\4\0\0=\4\14\0035\4\29\0=\4\21\0035\4\30\0=\4\23\0034\4\0\0=\4\25\0034\4\0\0=\4\26\3=\3\31\0025\3 \0=\3!\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\rneo-tree\tlazy\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\14lualine_y\1\4\0\0\22fancy_lsp_servers\15fancy_diff\rprogress\14lualine_x\1\2\0\0\19fancy_filetype\14lualine_c\1\2\0\0\22fancy_searchcount\fsources\1\2\0\0\rnvim_lsp\1\2\1\0\22fancy_diagnostics\19always_visible\2\1\2\3\0\rfilename\tpath\3\1\19newfile_status\2\16file_status\2\1\2\1\0\14fancy_cwd\20substitute_home\2\14lualine_b\1\2\0\0\17fancy_branch\14lualine_a\1\0\0\1\2\1\0\15fancy_mode\nwidth\3\3\foptions\1\0\0\25component_separators\1\3\0\0\6|\6|\23section_separators\1\3\0\0\5\5\1\0\2\ntheme\tauto\17globalstatus\1\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig"] = {
    config = { "\27LJ\2\n¨\b\0\0\14\0003\0e5\0\5\0005\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\1=\1\6\0004\1\0\0=\1\a\0004\1\0\0=\1\b\0005\1\n\0005\2\t\0=\2\4\1=\1\v\0005\1\15\0005\2\r\0005\3\f\0=\3\14\2=\2\16\1=\1\14\0004\1\0\0=\1\17\0004\1\0\0=\1\18\0004\1\0\0=\1\19\0004\1\0\0=\1\20\0004\1\0\0=\1\21\0005\1\23\0005\2\22\0=\2\2\0015\2\24\0=\2\4\1=\1\25\0006\1\26\0'\3\27\0B\1\2\0029\1\28\0014\3\0\0B\1\2\0016\1\26\0'\3\29\0B\1\2\0029\2\28\0015\4 \0006\5\30\0009\5\31\5\18\a\0\0B\5\2\2=\5!\4B\2\2\0016\2\26\0'\4\"\0B\2\2\0026\3#\0009\5$\1B\5\1\0A\3\0\4X\6\vÄ5\b%\0008\t\a\0\14\0\t\0X\n\1Ä4\t\0\0009\t\16\t=\t\16\b8\t\a\0029\t\28\t\18\v\b\0B\t\2\1E\6\3\3R\6Û\1276\3\30\0009\3&\0039\3'\0035\5(\0005\6)\0=\6*\5B\3\2\0015\3+\0006\4,\0\18\6\3\0B\4\2\4H\a\vÄ'\t-\0\18\n\a\0&\t\n\t6\n\30\0009\n.\n9\n/\n\18\f\t\0005\r0\0=\b1\r=\t2\rB\n\3\1F\a\3\3R\aÛ\127K\0\1\0\vtexthl\ttext\1\0\1\nnumhl\5\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tHint\nÛ∞†† \nError\tÔÅó \tInfo\tÔÅö \tWarn\tÔÅ± \nfloat\1\0\5\vsource\valways\nstyle\fminimal\vprefix\5\vborder\frounded\vheader\5\1\0\6\14underline\2\18severity_sort\2\21update_in_insert\1\nsigns\2\17virtual_text\2\ntitle\1\vconfig\15diagnostic\1\0\0\26get_installed_servers\vipairs\14lspconfig\21ensure_installed\1\0\0\rtbl_keys\bvim\20mason-lspconfig\nsetup\nmason\frequire\vyamlls\1\2\0\0\tyaml\1\0\0\1\3\0\0\25yaml-language-server\f--stdio\rtsserver solidity_ls_nomicfoundation\18rust_analyzer\25jedi_language_server\njdtls\rsettings\1\0\0\ngopls\1\0\0\1\0\1\fgofumpt\2\vbashls\1\0\0\1\3\0\0\ash\bzsh\vlua_ls\vjsonls\vclangd\1\0\0\14filetypes\1\6\0\0\6c\bcpp\tobjc\vobjcpp\tcuda\bcmd\1\0\0\1\3\0\0\vclangd\23--background-index\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/mason-lspconfig",
    url = "https://github.com/williamboman/mason-lspconfig"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\nX\0\1\4\0\6\0\v9\1\0\0\6\1\1\0X\1\3Ä9\1\0\0\a\1\2\0X\1\4Ä6\1\3\0009\1\4\1'\3\5\0B\1\2\1K\0\1\0\rwincmd =\bcmd\bvim\nright\tleft\rpositionX\0\1\4\0\6\0\v9\1\0\0\6\1\1\0X\1\3Ä9\1\0\0\a\1\2\0X\1\4Ä6\1\3\0009\1\4\1'\3\5\0B\1\2\1K\0\1\0\rwincmd =\bcmd\bvim\nright\tleft\rpositionÃ\5\1\0\6\0\23\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\3\0005\4\6\0003\5\a\0=\5\b\4>\4\1\0035\4\t\0003\5\n\0=\5\b\4>\4\2\3=\3\v\2B\0\2\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0005\3\16\0B\0\3\0016\0\f\0009\0\r\0009\0\14\0'\2\17\0005\3\18\0B\0\3\0016\0\f\0009\0\r\0009\0\14\0'\2\19\0005\3\20\0B\0\3\0016\0\f\0009\0\r\0009\0\14\0'\2\21\0005\3\22\0B\0\3\1K\0\1\0\1\0\2\ttext\6H\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\6I\vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\6W\vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\6E\vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn\bvim\19event_handlers\0\1\0\1\nevent neo_tree_window_after_close\fhandler\0\1\0\1\nevent\31neo_tree_window_after_open\fsources\1\5\0\0\15filesystem\fbuffers\15git_status\21document_symbols\1\0\5\23popup_border_style\frounded\28enable_modified_markers\2\22enable_git_status\2\23enable_diagnostics\2\25close_if_last_window\2\nsetup\rneo-tree\frequire\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n∆\5\0\0\6\0\28\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\0035\4\v\0005\5\f\0=\5\r\0045\5\14\0=\5\15\4=\4\16\0035\4\17\0005\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\4=\4\26\3=\3\27\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\venable\2\14set_jumps\2\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\aif\20@function.inner\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n¥\4\0\0\n\0\28\00116\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\r\0005\4\v\0005\5\t\0005\6\5\0009\a\4\0=\a\6\0069\a\a\0=\a\b\6=\6\n\5=\5\f\4=\4\14\0035\4\18\0005\5\15\0005\6\16\0=\6\17\5=\5\19\0044\5\3\0006\6\0\0'\b\20\0B\6\2\0029\6\21\0065\b\22\0005\t\23\0=\t\24\bB\6\2\0?\6\0\0=\5\25\4=\4\26\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\19\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\25\0B\1\2\1K\0\1\0\19load_extension\15extensions\14ui-select\18layout_config\1\0\1\nwidth\4\0ÄÄÄˇ\3\1\0\4\rrelative\vbuffer\vborder\2\14previewer\1\rwinblend\3\n\17get_dropdown\21telescope.themes\rfrecency\1\0\0\20ignore_patterns\1\3\0\0\f*.git/*\f*/tmp/*\1\0\2\16show_scores\2\19show_unindexed\2\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\nsetup\14telescope\22telescope.actions\frequire\3ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nX\0\1\4\0\6\0\v9\1\0\0\6\1\1\0X\1\3Ä9\1\0\0\a\1\2\0X\1\4Ä6\1\3\0009\1\4\1'\3\5\0B\1\2\1K\0\1\0\rwincmd =\bcmd\bvim\nright\tleft\rpositionX\0\1\4\0\6\0\v9\1\0\0\6\1\1\0X\1\3Ä9\1\0\0\a\1\2\0X\1\4Ä6\1\3\0009\1\4\1'\3\5\0B\1\2\1K\0\1\0\rwincmd =\bcmd\bvim\nright\tleft\rpositionÃ\5\1\0\6\0\23\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\3\0005\4\6\0003\5\a\0=\5\b\4>\4\1\0035\4\t\0003\5\n\0=\5\b\4>\4\2\3=\3\v\2B\0\2\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0005\3\16\0B\0\3\0016\0\f\0009\0\r\0009\0\14\0'\2\17\0005\3\18\0B\0\3\0016\0\f\0009\0\r\0009\0\14\0'\2\19\0005\3\20\0B\0\3\0016\0\f\0009\0\r\0009\0\14\0'\2\21\0005\3\22\0B\0\3\1K\0\1\0\1\0\2\ttext\6H\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\6I\vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\6W\vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\6E\vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn\bvim\19event_handlers\0\1\0\1\nevent neo_tree_window_after_close\fhandler\0\1\0\1\nevent\31neo_tree_window_after_open\fsources\1\5\0\0\15filesystem\fbuffers\15git_status\21document_symbols\1\0\5\23popup_border_style\frounded\28enable_modified_markers\2\22enable_git_status\2\23enable_diagnostics\2\25close_if_last_window\2\nsetup\rneo-tree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n¥\4\0\0\n\0\28\00116\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\r\0005\4\v\0005\5\t\0005\6\5\0009\a\4\0=\a\6\0069\a\a\0=\a\b\6=\6\n\5=\5\f\4=\4\14\0035\4\18\0005\5\15\0005\6\16\0=\6\17\5=\5\19\0044\5\3\0006\6\0\0'\b\20\0B\6\2\0029\6\21\0065\b\22\0005\t\23\0=\t\24\bB\6\2\0?\6\0\0=\5\25\4=\4\26\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\19\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\25\0B\1\2\1K\0\1\0\19load_extension\15extensions\14ui-select\18layout_config\1\0\1\nwidth\4\0ÄÄÄˇ\3\1\0\4\rrelative\vbuffer\vborder\2\14previewer\1\rwinblend\3\n\17get_dropdown\21telescope.themes\rfrecency\1\0\0\20ignore_patterns\1\3\0\0\f*.git/*\f*/tmp/*\1\0\2\16show_scores\2\19show_unindexed\2\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\nsetup\14telescope\22telescope.actions\frequire\3ÄÄ¿ô\4\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\topts\26alpha.themes.startify\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n\5\0\0\a\0\"\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0004\4\3\0005\5\n\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0034\4\5\0005\5\15\0>\5\1\0045\5\16\0>\5\2\0045\5\17\0005\6\18\0=\6\19\5>\5\3\0045\5\20\0>\5\4\4=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0034\4\0\0=\4\26\3=\3\27\0025\3\28\0004\4\0\0=\4\f\0034\4\0\0=\4\14\0035\4\29\0=\4\21\0035\4\30\0=\4\23\0034\4\0\0=\4\25\0034\4\0\0=\4\26\3=\3\31\0025\3 \0=\3!\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\rneo-tree\tlazy\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\14lualine_y\1\4\0\0\22fancy_lsp_servers\15fancy_diff\rprogress\14lualine_x\1\2\0\0\19fancy_filetype\14lualine_c\1\2\0\0\22fancy_searchcount\fsources\1\2\0\0\rnvim_lsp\1\2\1\0\22fancy_diagnostics\19always_visible\2\1\2\3\0\rfilename\tpath\3\1\19newfile_status\2\16file_status\2\1\2\1\0\14fancy_cwd\20substitute_home\2\14lualine_b\1\2\0\0\17fancy_branch\14lualine_a\1\0\0\1\2\1\0\15fancy_mode\nwidth\3\3\foptions\1\0\0\25component_separators\1\3\0\0\6|\6|\23section_separators\1\3\0\0\5\5\1\0\2\ntheme\tauto\17globalstatus\1\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "copilot.vim")
time([[Config for copilot.vim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n∆\5\0\0\6\0\28\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\0035\4\v\0005\5\f\0=\5\r\0045\5\14\0=\5\15\4=\4\16\0035\4\17\0005\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\4=\4\26\3=\3\27\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\venable\2\14set_jumps\2\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\aif\20@function.inner\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gruvbox-material
time([[Config for gruvbox-material]], true)
try_loadstring("\27LJ\2\nÇ\2\0\0\3\0\f\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\1\6\0=\1\5\0006\0\0\0009\0\4\0'\1\b\0=\1\a\0006\0\0\0009\0\4\0)\1\1\0=\1\t\0006\0\0\0009\0\n\0'\2\v\0B\0\2\1K\0\1\0# colorscheme gruvbox-material \bcmd(gruvbox_material_better_performance\thard gruvbox_material_background\rmaterial gruvbox_material_foreground\6g\tdark\15background\bopt\bvim\0", "config", "gruvbox-material")
time([[Config for gruvbox-material]], false)
-- Config for: mason-lspconfig
time([[Config for mason-lspconfig]], true)
try_loadstring("\27LJ\2\n¨\b\0\0\14\0003\0e5\0\5\0005\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\1=\1\6\0004\1\0\0=\1\a\0004\1\0\0=\1\b\0005\1\n\0005\2\t\0=\2\4\1=\1\v\0005\1\15\0005\2\r\0005\3\f\0=\3\14\2=\2\16\1=\1\14\0004\1\0\0=\1\17\0004\1\0\0=\1\18\0004\1\0\0=\1\19\0004\1\0\0=\1\20\0004\1\0\0=\1\21\0005\1\23\0005\2\22\0=\2\2\0015\2\24\0=\2\4\1=\1\25\0006\1\26\0'\3\27\0B\1\2\0029\1\28\0014\3\0\0B\1\2\0016\1\26\0'\3\29\0B\1\2\0029\2\28\0015\4 \0006\5\30\0009\5\31\5\18\a\0\0B\5\2\2=\5!\4B\2\2\0016\2\26\0'\4\"\0B\2\2\0026\3#\0009\5$\1B\5\1\0A\3\0\4X\6\vÄ5\b%\0008\t\a\0\14\0\t\0X\n\1Ä4\t\0\0009\t\16\t=\t\16\b8\t\a\0029\t\28\t\18\v\b\0B\t\2\1E\6\3\3R\6Û\1276\3\30\0009\3&\0039\3'\0035\5(\0005\6)\0=\6*\5B\3\2\0015\3+\0006\4,\0\18\6\3\0B\4\2\4H\a\vÄ'\t-\0\18\n\a\0&\t\n\t6\n\30\0009\n.\n9\n/\n\18\f\t\0005\r0\0=\b1\r=\t2\rB\n\3\1F\a\3\3R\aÛ\127K\0\1\0\vtexthl\ttext\1\0\1\nnumhl\5\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tHint\nÛ∞†† \nError\tÔÅó \tInfo\tÔÅö \tWarn\tÔÅ± \nfloat\1\0\5\vsource\valways\nstyle\fminimal\vprefix\5\vborder\frounded\vheader\5\1\0\6\14underline\2\18severity_sort\2\21update_in_insert\1\nsigns\2\17virtual_text\2\ntitle\1\vconfig\15diagnostic\1\0\0\26get_installed_servers\vipairs\14lspconfig\21ensure_installed\1\0\0\rtbl_keys\bvim\20mason-lspconfig\nsetup\nmason\frequire\vyamlls\1\2\0\0\tyaml\1\0\0\1\3\0\0\25yaml-language-server\f--stdio\rtsserver solidity_ls_nomicfoundation\18rust_analyzer\25jedi_language_server\njdtls\rsettings\1\0\0\ngopls\1\0\0\1\0\1\fgofumpt\2\vbashls\1\0\0\1\3\0\0\ash\bzsh\vlua_ls\vjsonls\vclangd\1\0\0\14filetypes\1\6\0\0\6c\bcpp\tobjc\vobjcpp\tcuda\bcmd\1\0\0\1\3\0\0\vclangd\23--background-index\0", "config", "mason-lspconfig")
time([[Config for mason-lspconfig]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nv\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nscope\1\0\1\fenabled\1\vindent\1\0\1\tchar\b‚ñè\1\0\1\fenabled\2\nsetup\bibl\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
