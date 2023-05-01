-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Colorschemes & syntax highlighting.
    use({ "arcticicestudio/nord-vim", as = "nord" })
    use({ "catppuccin/nvim", as = "catppuccin" })
    use({ "morhetz/gruvbox", as = "gruvbox" })
    use({ "sainnhe/gruvbox-material", as = "gruvbox-material" })
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

        -- UI
        use({ "airblade/vim-gitgutter" }),
        use({ "lukas-reineke/indent-blankline.nvim" }),
        use({ "machakann/vim-highlightedyank" }),
        use({
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
        }),
    }
end)
