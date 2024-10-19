return function()
    local servers = {
        clangd = {
            cmd = { "clangd", "--background-index" },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
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
        bashls = {
            filetypes = { "sh", "zsh" },
        },
        gopls = {
            settings = {
                gopls = {
                    ["local"] = "github.com/smartcontractkit/chainlink",
                    gofumpt = true,
                },
            },
        },
        jdtls = {},
        jedi_language_server = {},
        rust_analyzer = {},
        solidity_ls_nomicfoundation = {},
        ts_ls = {},
        yamlls = {
            cmd = { "yaml-language-server", "--stdio" },
            filetypes = { "yaml" },
        },
    }

    require("mason").setup({})

    local mason = require("mason-lspconfig")
    mason.setup({
        ensure_installed = vim.tbl_keys(servers),
    })

    local lsp = require("lspconfig")

    for _, server in ipairs(mason.get_installed_servers()) do
        local config = {
            settings = (servers[server] or {}).settings,
        }

        lsp[server].setup(config)
    end

    vim.diagnostic.config({
        title = false,
        underline = true,
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
            source = "always",
            style = "minimal",
            border = "rounded",
            header = "",
            prefix = "",
        },
    })

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
end
