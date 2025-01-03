return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    opts = {
        bashls = {
            filetypes = { "sh", "zsh" },
        },
        clangd = {
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
        gopls = {
            settings = {
                gopls = {
                    ["local"] = "github.com/smartcontractkit/chainlink,github.com/nickcorin/betterpadel",
                    gofumpt = true,
                },
            },
        },
        jdtls = {},
        jsonls = {},
        lua_ls = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "vim.g" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                        },
                    },
                },
            },
        },
        pbls = {},
        pyright = {},
        rust_analyzer = {},
        ts_ls = {},
        yamlls = {
            cmd = { "yaml-language-server", "--stdio" },
            filetypes = { "yaml" },
        },
    },
    config = function(_, opts)
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(opts),
        })

        for server_name, config in pairs(opts) do
            require("lspconfig")[server_name].setup(config)
        end
    end,
}
