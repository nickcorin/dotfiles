local servers = {
    clangd = {
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    },
    jsonls = {},
    lua_ls = {},
    bashls = {
        filetypes = { "sh", "zsh" },
    },
    gopls = {
        settings = {
            gopls = {
                gofumpt = true,
            },
        },
    },
    jdtls = {},
    jedi_language_server = {},
    rust_analyzer = {},
    solidity_ls_nomicfoundation = {},
    tsserver = {},
    yamlls = {
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml" },
    },
}

return {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lsp = require("lspconfig")

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
            local config = {
                on_attach = function(_, bufnr)
                    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

                    local opts = { noremap = true, silent = true }
                    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
                    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
                    buf_set_keymap("n", "<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol('')<CR>", opts)
                    buf_set_keymap("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
                    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
                    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
                    buf_set_keymap("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
                    buf_set_keymap("n", "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
                    buf_set_keymap("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
                    buf_set_keymap("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
                end,
                settings = servers[server].settings,
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
}
