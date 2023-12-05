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

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({ "christoomey/vim-tmux-navigator" })

    -- Colorschemes & syntax highlighting.
    use({ "arcticicestudio/nord-vim", as = "nord" })
    use({ "catppuccin/nvim", as = "catppuccin" })
    use({ "morhetz/gruvbox", as = "gruvbox" })
    use({
        "neanias/everforest-nvim",
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup()
        end,
    })
    use({ "sainnhe/gruvbox-material", as = "gruvbox-material" })
    use({ "rebelot/kanagawa.nvim" })
    use({ "rose-pine/neovim", as = "rose-pine" })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use('mbbill/undotree')
    use("tpope/vim-fugitive")

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        },

    }

    -- Code Completion.
    use({ "github/copilot.vim" })

    -- UI
    use({ "airblade/vim-gitgutter" })
    use({ "lukas-reineke/indent-blankline.nvim" })
    use({ "machakann/vim-highlightedyank" })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
end)
