-- Installs packer on new machines which don't have packer installed.
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
local packer = require("packer")

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        "neanias/everforest-nvim",
        disable = true,
        config = require("plugins.colorschemes").everforest,
    }

    use {
        "ellisonleao/gruvbox.nvim",
        disable = true,
        config = require("plugins.colorschemes").gruvbox,
    }

    use {
        "sainnhe/gruvbox-material",
        disable = true,
        config = require("plugins.colorschemes").gruvboxMaterial,
    }

    use {
        "rose-pine/neovim",
        disable = false,
        config = require("plugins.colorschemes").rosePine,
    }

    use {
        "nvim-lualine/lualine.nvim",
        requires = {
            "meuter/lualine-so-fancy.nvim",
        },
        config = require("plugins.lualine"),
    }

    use {
        'goolord/alpha-nvim',
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        config = require("plugins.alpha"),
    }

    use {
        "christoomey/vim-tmux-navigator"
    }

    use {
        "airblade/vim-gitgutter"
    }

    use {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                width = 0.8,
                height = 1,
            },
        },
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = require("plugins.indentline"),
    }

    use {
        "github/copilot.vim",
        config = require("plugins.copilot"),
    }

    use {
        "ahmedkhalf/project.nvim",
        config = require("plugins.project"),
    }

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = require("plugins.neotree"),
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-frecency.nvim",
            "nvim-telescope/telescope-project.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = require("plugins.telescope"),
    }

    use {
        "williamboman/mason-lspconfig",
        requires = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        config = require("plugins.lsp"),
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        disable = false,
        run = ":TSUpdate",
        config = require("plugins.treesitter")
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        packer.sync()
    end
end)
