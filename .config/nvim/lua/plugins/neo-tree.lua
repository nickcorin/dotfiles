return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "main",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    config = function()
        -- If you want icons for diagnostic errors, you'll need to define them somewhere:
        vim.fn.sign_define("DiagnosticSignError",
        {text = "E", texthl = "DiagnosticSignError"})

        vim.fn.sign_define("DiagnosticSignWarn",
        {text = "W", texthl = "DiagnosticSignWarn"})

        vim.fn.sign_define("DiagnosticSignInfo",
        {text = "I", texthl = "DiagnosticSignInfo"})

        vim.fn.sign_define("DiagnosticSignHint",
        {text = "H", texthl = "DiagnosticSignHint"})

        require("neo-tree").setup({
            close_if_last_window = true,
            enable_diagnostics = true,
            enable_git_status = true,
            enable_modified_markers = true,
            popup_border_style = "rounded",
            sources = {
                "filesystem",
                "buffers",
                "git_status",
                "document_symbols",
            },
            event_handlers = {
                {
                    event = "neo_tree_window_after_open",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd("wincmd =")
                        end
                    end,
                },
                {
                    event = "neo_tree_window_after_close",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd("wincmd =")
                        end
                    end,
                },
            },
        })
    end,
}

