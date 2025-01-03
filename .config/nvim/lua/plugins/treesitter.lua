return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        vim.cmd("TSUpdate")
    end,
    opts = {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed).
        ensure_installed = "all",
        -- Automatically install missing parsers when entering buffer.
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally.
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
