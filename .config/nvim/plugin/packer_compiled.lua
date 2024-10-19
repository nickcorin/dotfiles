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
local package_path_str = "/Users/nick/.cache/nvim/packer_hererocks/2.1.1727870382/share/lua/5.1/?.lua;/Users/nick/.cache/nvim/packer_hererocks/2.1.1727870382/share/lua/5.1/?/init.lua;/Users/nick/.cache/nvim/packer_hererocks/2.1.1727870382/lib/luarocks/rocks-5.1/?.lua;/Users/nick/.cache/nvim/packer_hererocks/2.1.1727870382/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/nick/.cache/nvim/packer_hererocks/2.1.1727870382/lib/lua/5.1/?.so"
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
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÖ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nscope\1\0\1\fenabled\1\vindent\1\0\1\tchar\b‚ñè\1\0\3\fenabled\2\nscope\0\vindent\0\nsetup\bibl\frequire\0" },
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
    config = { "\27LJ\2\nŸ\a\0\0\a\0\"\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0004\4\3\0005\5\n\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0034\4\5\0005\5\15\0>\5\1\0045\5\16\0>\5\2\0045\5\17\0005\6\18\0=\6\19\5>\5\3\0045\5\20\0>\5\4\4=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0034\4\0\0=\4\26\3=\3\27\0025\3\28\0004\4\0\0=\4\f\0034\4\0\0=\4\14\0035\4\29\0=\4\21\0035\4\30\0=\4\23\0034\4\0\0=\4\25\0034\4\0\0=\4\26\3=\3\31\0025\3 \0=\3!\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\rneo-tree\tlazy\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\6\14lualine_b\0\14lualine_y\0\14lualine_a\0\14lualine_x\0\14lualine_z\0\14lualine_c\0\rsections\14lualine_z\14lualine_y\1\4\0\0\22fancy_lsp_servers\15fancy_diff\rprogress\14lualine_x\1\2\0\0\19fancy_filetype\14lualine_c\1\2\0\0\22fancy_searchcount\fsources\1\2\0\0\rnvim_lsp\1\2\2\0\22fancy_diagnostics\fsources\0\19always_visible\2\1\2\3\0\rfilename\tpath\3\1\19newfile_status\2\16file_status\2\1\2\1\0\14fancy_cwd\20substitute_home\2\14lualine_b\1\2\0\0\17fancy_branch\14lualine_a\1\0\6\14lualine_b\0\14lualine_y\0\14lualine_a\0\14lualine_x\0\14lualine_z\0\14lualine_c\0\1\2\1\0\15fancy_mode\nwidth\3\3\foptions\1\0\4\foptions\0\22inactive_sections\0\15extensions\0\rsections\0\25component_separators\1\3\0\0\6|\6|\23section_separators\1\3\0\0\5\5\1\0\4\ntheme\tauto\23section_separators\0\17globalstatus\1\25component_separators\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig"] = {
    config = { "\27LJ\2\n“\f\0\0\14\0A\0\1275\0\5\0005\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\1=\1\6\0004\1\0\0=\1\a\0005\1\23\0005\2\21\0005\3\v\0005\4\t\0005\5\b\0=\5\n\4=\4\f\0035\4\18\0004\5\0\b6\6\r\0009\6\14\0069\6\15\6'\b\16\0B\6\2\2+\a\2\0<\a\6\0056\6\r\0009\6\14\0069\6\15\6'\b\17\0B\6\2\2+\a\2\0<\a\6\5=\5\19\4=\4\20\3=\3\22\2=\2\24\1=\1\25\0005\1\27\0005\2\26\0=\2\4\1=\1\28\0005\1 \0005\2\30\0005\3\29\0=\3\31\2=\2\24\1=\1\31\0004\1\0\0=\1!\0004\1\0\0=\1\"\0004\1\0\0=\1#\0004\1\0\0=\1$\0004\1\0\0=\1%\0005\1'\0005\2&\0=\2\2\0015\2(\0=\2\4\1=\1)\0006\1*\0'\3+\0B\1\2\0029\1,\0014\3\0\0B\1\2\0016\1*\0'\3-\0B\1\2\0029\2,\0015\4/\0006\5\r\0009\5.\5\18\a\0\0B\5\2\2=\0050\4B\2\2\0016\2*\0'\0041\0B\2\2\0026\0032\0009\0053\1B\5\1\0A\3\0\4X\6\vÄ5\b4\0008\t\a\0\14\0\t\0X\n\1Ä4\t\0\0009\t\24\t=\t\24\b8\t\a\0029\t,\t\18\v\b\0B\t\2\1E\6\3\3R\6Û\1276\3\r\0009\0035\0039\0036\0035\0057\0005\0068\0=\0069\5B\3\2\0015\3:\0006\4;\0\18\6\3\0B\4\2\4H\a\vÄ'\t<\0\18\n\a\0&\t\n\t6\n\r\0009\n\14\n9\n=\n\18\f\t\0005\r>\0=\b?\r=\t@\rB\n\3\1F\a\3\3R\aÛ\127K\0\1\0\vtexthl\ttext\1\0\3\nnumhl\5\ttext\0\vtexthl\0\16sign_define\19DiagnosticSign\npairs\1\0\4\tWarn\tÔÅ± \tHint\nÛ∞†† \nError\tÔÅó \tInfo\tÔÅö \nfloat\1\0\5\vprefix\5\nstyle\fminimal\vheader\5\vsource\valways\vborder\frounded\1\0\a\nsigns\2\17virtual_text\2\14underline\2\18severity_sort\2\nfloat\0\ntitle\1\21update_in_insert\1\vconfig\15diagnostic\1\0\1\rsettings\0\26get_installed_servers\vipairs\14lspconfig\21ensure_installed\1\0\1\21ensure_installed\0\rtbl_keys\20mason-lspconfig\nsetup\nmason\frequire\vyamlls\1\2\0\0\tyaml\1\0\2\bcmd\0\14filetypes\0\1\3\0\0\25yaml-language-server\f--stdio\nts_ls solidity_ls_nomicfoundation\18rust_analyzer\25jedi_language_server\njdtls\1\0\1\rsettings\0\ngopls\1\0\1\ngopls\0\1\0\2\nlocal*github.com/smartcontractkit/chainlink\fgofumpt\2\vbashls\1\0\1\14filetypes\0\1\3\0\0\ash\bzsh\vlua_ls\rsettings\1\0\1\rsettings\0\bLua\1\0\1\bLua\0\14workspace\flibrary\1\0\1\flibrary\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\bvim\16diagnostics\1\0\2\16diagnostics\0\14workspace\0\fglobals\1\0\1\fglobals\0\1\2\0\0\bvim\vjsonls\vclangd\1\0\v\njdtls\0\vlua_ls\0\vjsonls\0\ngopls\0\vbashls\0\vclangd\0\vyamlls\0\nts_ls\0 solidity_ls_nomicfoundation\0\18rust_analyzer\0\25jedi_language_server\0\14filetypes\1\6\0\0\6c\bcpp\tobjc\vobjcpp\tcuda\bcmd\1\0\2\bcmd\0\14filetypes\0\1\3\0\0\vclangd\23--background-index\0" },
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
    config = { "\27LJ\2\nX\0\1\4\0\6\0\v9\1\0\0\6\1\1\0X\1\3Ä9\1\0\0\a\1\2\0X\1\4Ä6\1\3\0009\1\4\1'\3\5\0B\1\2\1K\0\1\0\rwincmd =\bcmd\bvim\nright\tleft\rpositionX\0\1\4\0\6\0\v9\1\0\0\6\1\1\0X\1\3Ä9\1\0\0\a\1\2\0X\1\4Ä6\1\3\0009\1\4\1'\3\5\0B\1\2\1K\0\1\0\rwincmd =\bcmd\bvim\nright\tleft\rposition˜\5\1\0\6\0\23\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\3\0005\4\6\0003\5\a\0=\5\b\4>\4\1\0035\4\t\0003\5\n\0=\5\b\4>\4\2\3=\3\v\2B\0\2\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0005\3\16\0B\0\3\0016\0\f\0009\0\r\0009\0\14\0'\2\17\0005\3\18\0B\0\3\0016\0\f\0009\0\r\0009\0\14\0'\2\19\0005\3\20\0B\0\3\0016\0\f\0009\0\r\0009\0\14\0'\2\21\0005\3\22\0B\0\3\1K\0\1\0\1\0\2\vtexthl\23DiagnosticSignHint\ttext\6H\23DiagnosticSignHint\1\0\2\vtexthl\23DiagnosticSignInfo\ttext\6I\23DiagnosticSignInfo\1\0\2\vtexthl\23DiagnosticSignWarn\ttext\6W\23DiagnosticSignWarn\1\0\2\vtexthl\24DiagnosticSignError\ttext\6E\24DiagnosticSignError\16sign_define\afn\bvim\19event_handlers\0\1\0\2\nevent neo_tree_window_after_close\fhandler\0\fhandler\0\1\0\2\nevent\31neo_tree_window_after_open\fhandler\0\fsources\1\5\0\0\15filesystem\fbuffers\15git_status\21document_symbols\1\0\a\23enable_diagnostics\2\25close_if_last_window\2\fsources\0\19event_handlers\0\23popup_border_style\frounded\28enable_modified_markers\2\22enable_git_status\2\nsetup\rneo-tree\frequire\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neovim = {
    config = { "\27LJ\2\nü\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\28 colorscheme rose-pine \bcmd\bvim\1\0\3\23disable_background\1\fvariant\tmoon\19enable_italics\1\nsetup\14rose-pine\frequire\0" },
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/neovim",
    url = "https://github.com/rose-pine/neovim"
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
    config = { "\27LJ\2\n›\6\0\0\6\0\28\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\0035\4\v\0005\5\f\0=\5\r\0045\5\14\0=\5\15\4=\4\16\0035\4\17\0005\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\4=\4\26\3=\3\27\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\6\venable\2\18goto_next_end\0\22goto_previous_end\0\20goto_next_start\0\14set_jumps\2\24goto_previous_start\0\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\3\18swap_previous\0\venable\2\14swap_next\0\vselect\1\0\3\vselect\0\tmove\0\tswap\0\fkeymaps\1\0\4\aaf\20@function.outer\aic\17@class.inner\aif\20@function.inner\aac\17@class.outer\1\0\2\fkeymaps\0\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\1\0\3\16textobjects\0\21ensure_installed\ball\14highlight\0\nsetup\28nvim-treesitter.configs\frequire\0" },
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
    config = { "\27LJ\2\n“\4\0\0\b\0\25\0*6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\4\0005\5\5\0=\5\6\0045\5\f\0005\6\b\0009\a\a\0=\a\t\0069\a\n\0=\a\v\6=\6\r\5=\5\14\4=\4\16\0035\4\20\0005\5\17\0005\6\18\0=\6\19\5=\5\21\0044\5\0\0=\5\22\4=\4\23\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\24\1'\3\21\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\24\1'\3\22\0B\1\2\1K\0\1\0\19load_extension\15extensions\14ui-select\rfrecency\1\0\2\rfrecency\0\14ui-select\0\20ignore_patterns\1\3\0\0\f*.git/*\f*/tmp/*\1\0\3\20ignore_patterns\0\19show_unindexed\2\16show_scores\2\rdefaults\1\0\2\rdefaults\0\15extensions\0\rmappings\6i\1\0\1\6i\0\n<C-k>\28move_selection_previous\n<C-j>\1\0\2\n<C-k>\0\n<C-j>\0\24move_selection_next\18layout_config\1\0\2\vanchor\6N\20prompt_position\btop\1\0\3\18layout_config\0\rmappings\0\20layout_strategy\rvertical\nsetup\14telescope\22telescope.actions\frequire\0" },
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
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n›\6\0\0\6\0\28\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\0035\4\v\0005\5\f\0=\5\r\0045\5\14\0=\5\15\4=\4\16\0035\4\17\0005\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\4=\4\26\3=\3\27\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\6\venable\2\18goto_next_end\0\22goto_previous_end\0\20goto_next_start\0\14set_jumps\2\24goto_previous_start\0\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\3\18swap_previous\0\venable\2\14swap_next\0\vselect\1\0\3\vselect\0\tmove\0\tswap\0\fkeymaps\1\0\4\aaf\20@function.outer\aic\17@class.inner\aif\20@function.inner\aac\17@class.outer\1\0\2\fkeymaps\0\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\1\0\3\16textobjects\0\21ensure_installed\ball\14highlight\0\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nÖ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nscope\1\0\1\fenabled\1\vindent\1\0\1\tchar\b‚ñè\1\0\3\fenabled\2\nscope\0\vindent\0\nsetup\bibl\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nX\0\1\4\0\6\0\v9\1\0\0\6\1\1\0X\1\3Ä9\1\0\0\a\1\2\0X\1\4Ä6\1\3\0009\1\4\1'\3\5\0B\1\2\1K\0\1\0\rwincmd =\bcmd\bvim\nright\tleft\rpositionX\0\1\4\0\6\0\v9\1\0\0\6\1\1\0X\1\3Ä9\1\0\0\a\1\2\0X\1\4Ä6\1\3\0009\1\4\1'\3\5\0B\1\2\1K\0\1\0\rwincmd =\bcmd\bvim\nright\tleft\rposition˜\5\1\0\6\0\23\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\3\0005\4\6\0003\5\a\0=\5\b\4>\4\1\0035\4\t\0003\5\n\0=\5\b\4>\4\2\3=\3\v\2B\0\2\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0005\3\16\0B\0\3\0016\0\f\0009\0\r\0009\0\14\0'\2\17\0005\3\18\0B\0\3\0016\0\f\0009\0\r\0009\0\14\0'\2\19\0005\3\20\0B\0\3\0016\0\f\0009\0\r\0009\0\14\0'\2\21\0005\3\22\0B\0\3\1K\0\1\0\1\0\2\vtexthl\23DiagnosticSignHint\ttext\6H\23DiagnosticSignHint\1\0\2\vtexthl\23DiagnosticSignInfo\ttext\6I\23DiagnosticSignInfo\1\0\2\vtexthl\23DiagnosticSignWarn\ttext\6W\23DiagnosticSignWarn\1\0\2\vtexthl\24DiagnosticSignError\ttext\6E\24DiagnosticSignError\16sign_define\afn\bvim\19event_handlers\0\1\0\2\nevent neo_tree_window_after_close\fhandler\0\fhandler\0\1\0\2\nevent\31neo_tree_window_after_open\fhandler\0\fsources\1\5\0\0\15filesystem\fbuffers\15git_status\21document_symbols\1\0\a\23enable_diagnostics\2\25close_if_last_window\2\fsources\0\19event_handlers\0\23popup_border_style\frounded\28enable_modified_markers\2\22enable_git_status\2\nsetup\rneo-tree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: neovim
time([[Config for neovim]], true)
try_loadstring("\27LJ\2\nü\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\28 colorscheme rose-pine \bcmd\bvim\1\0\3\23disable_background\1\fvariant\tmoon\19enable_italics\1\nsetup\14rose-pine\frequire\0", "config", "neovim")
time([[Config for neovim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nŸ\a\0\0\a\0\"\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0004\4\3\0005\5\n\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0034\4\5\0005\5\15\0>\5\1\0045\5\16\0>\5\2\0045\5\17\0005\6\18\0=\6\19\5>\5\3\0045\5\20\0>\5\4\4=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0034\4\0\0=\4\26\3=\3\27\0025\3\28\0004\4\0\0=\4\f\0034\4\0\0=\4\14\0035\4\29\0=\4\21\0035\4\30\0=\4\23\0034\4\0\0=\4\25\0034\4\0\0=\4\26\3=\3\31\0025\3 \0=\3!\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\rneo-tree\tlazy\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\6\14lualine_b\0\14lualine_y\0\14lualine_a\0\14lualine_x\0\14lualine_z\0\14lualine_c\0\rsections\14lualine_z\14lualine_y\1\4\0\0\22fancy_lsp_servers\15fancy_diff\rprogress\14lualine_x\1\2\0\0\19fancy_filetype\14lualine_c\1\2\0\0\22fancy_searchcount\fsources\1\2\0\0\rnvim_lsp\1\2\2\0\22fancy_diagnostics\fsources\0\19always_visible\2\1\2\3\0\rfilename\tpath\3\1\19newfile_status\2\16file_status\2\1\2\1\0\14fancy_cwd\20substitute_home\2\14lualine_b\1\2\0\0\17fancy_branch\14lualine_a\1\0\6\14lualine_b\0\14lualine_y\0\14lualine_a\0\14lualine_x\0\14lualine_z\0\14lualine_c\0\1\2\1\0\15fancy_mode\nwidth\3\3\foptions\1\0\4\foptions\0\22inactive_sections\0\15extensions\0\rsections\0\25component_separators\1\3\0\0\6|\6|\23section_separators\1\3\0\0\5\5\1\0\4\ntheme\tauto\23section_separators\0\17globalstatus\1\25component_separators\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n“\4\0\0\b\0\25\0*6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\4\0005\5\5\0=\5\6\0045\5\f\0005\6\b\0009\a\a\0=\a\t\0069\a\n\0=\a\v\6=\6\r\5=\5\14\4=\4\16\0035\4\20\0005\5\17\0005\6\18\0=\6\19\5=\5\21\0044\5\0\0=\5\22\4=\4\23\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\24\1'\3\21\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\24\1'\3\22\0B\1\2\1K\0\1\0\19load_extension\15extensions\14ui-select\rfrecency\1\0\2\rfrecency\0\14ui-select\0\20ignore_patterns\1\3\0\0\f*.git/*\f*/tmp/*\1\0\3\20ignore_patterns\0\19show_unindexed\2\16show_scores\2\rdefaults\1\0\2\rdefaults\0\15extensions\0\rmappings\6i\1\0\1\6i\0\n<C-k>\28move_selection_previous\n<C-j>\1\0\2\n<C-k>\0\n<C-j>\0\24move_selection_next\18layout_config\1\0\2\vanchor\6N\20prompt_position\btop\1\0\3\18layout_config\0\rmappings\0\20layout_strategy\rvertical\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: mason-lspconfig
time([[Config for mason-lspconfig]], true)
try_loadstring("\27LJ\2\n“\f\0\0\14\0A\0\1275\0\5\0005\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\1=\1\6\0004\1\0\0=\1\a\0005\1\23\0005\2\21\0005\3\v\0005\4\t\0005\5\b\0=\5\n\4=\4\f\0035\4\18\0004\5\0\b6\6\r\0009\6\14\0069\6\15\6'\b\16\0B\6\2\2+\a\2\0<\a\6\0056\6\r\0009\6\14\0069\6\15\6'\b\17\0B\6\2\2+\a\2\0<\a\6\5=\5\19\4=\4\20\3=\3\22\2=\2\24\1=\1\25\0005\1\27\0005\2\26\0=\2\4\1=\1\28\0005\1 \0005\2\30\0005\3\29\0=\3\31\2=\2\24\1=\1\31\0004\1\0\0=\1!\0004\1\0\0=\1\"\0004\1\0\0=\1#\0004\1\0\0=\1$\0004\1\0\0=\1%\0005\1'\0005\2&\0=\2\2\0015\2(\0=\2\4\1=\1)\0006\1*\0'\3+\0B\1\2\0029\1,\0014\3\0\0B\1\2\0016\1*\0'\3-\0B\1\2\0029\2,\0015\4/\0006\5\r\0009\5.\5\18\a\0\0B\5\2\2=\0050\4B\2\2\0016\2*\0'\0041\0B\2\2\0026\0032\0009\0053\1B\5\1\0A\3\0\4X\6\vÄ5\b4\0008\t\a\0\14\0\t\0X\n\1Ä4\t\0\0009\t\24\t=\t\24\b8\t\a\0029\t,\t\18\v\b\0B\t\2\1E\6\3\3R\6Û\1276\3\r\0009\0035\0039\0036\0035\0057\0005\0068\0=\0069\5B\3\2\0015\3:\0006\4;\0\18\6\3\0B\4\2\4H\a\vÄ'\t<\0\18\n\a\0&\t\n\t6\n\r\0009\n\14\n9\n=\n\18\f\t\0005\r>\0=\b?\r=\t@\rB\n\3\1F\a\3\3R\aÛ\127K\0\1\0\vtexthl\ttext\1\0\3\nnumhl\5\ttext\0\vtexthl\0\16sign_define\19DiagnosticSign\npairs\1\0\4\tWarn\tÔÅ± \tHint\nÛ∞†† \nError\tÔÅó \tInfo\tÔÅö \nfloat\1\0\5\vprefix\5\nstyle\fminimal\vheader\5\vsource\valways\vborder\frounded\1\0\a\nsigns\2\17virtual_text\2\14underline\2\18severity_sort\2\nfloat\0\ntitle\1\21update_in_insert\1\vconfig\15diagnostic\1\0\1\rsettings\0\26get_installed_servers\vipairs\14lspconfig\21ensure_installed\1\0\1\21ensure_installed\0\rtbl_keys\20mason-lspconfig\nsetup\nmason\frequire\vyamlls\1\2\0\0\tyaml\1\0\2\bcmd\0\14filetypes\0\1\3\0\0\25yaml-language-server\f--stdio\nts_ls solidity_ls_nomicfoundation\18rust_analyzer\25jedi_language_server\njdtls\1\0\1\rsettings\0\ngopls\1\0\1\ngopls\0\1\0\2\nlocal*github.com/smartcontractkit/chainlink\fgofumpt\2\vbashls\1\0\1\14filetypes\0\1\3\0\0\ash\bzsh\vlua_ls\rsettings\1\0\1\rsettings\0\bLua\1\0\1\bLua\0\14workspace\flibrary\1\0\1\flibrary\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\bvim\16diagnostics\1\0\2\16diagnostics\0\14workspace\0\fglobals\1\0\1\fglobals\0\1\2\0\0\bvim\vjsonls\vclangd\1\0\v\njdtls\0\vlua_ls\0\vjsonls\0\ngopls\0\vbashls\0\vclangd\0\vyamlls\0\nts_ls\0 solidity_ls_nomicfoundation\0\18rust_analyzer\0\25jedi_language_server\0\14filetypes\1\6\0\0\6c\bcpp\tobjc\vobjcpp\tcuda\bcmd\1\0\2\bcmd\0\14filetypes\0\1\3\0\0\vclangd\23--background-index\0", "config", "mason-lspconfig")
time([[Config for mason-lspconfig]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "copilot.vim")
time([[Config for copilot.vim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\topts\26alpha.themes.startify\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)

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
