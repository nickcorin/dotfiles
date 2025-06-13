return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    enabled = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
        sources = {
            "filesystem",
            "buffers",
            "git_status",
            "document_symbols",
        },
        close_if_last_window = true,
        enable_diagnostics = true,
        enable_git_status = true,
        enable_modified_markers = true,
        open_files_do_not_replace_types = { "terminal", "trouble" },
        sort_case_insensitive = true,
        -- popup_border_style = "none",
        title = "",
        use_popups_for_input = true,
        window = {
            title = "",
            position = "left",
            popup = {
                title = "",
                position = 0.5,
                size = {
                    width = 0.8,
                    height = 0.4,
                },
                border = {},
            },
        },
        filesystem = {
            popup = {
                title = "",
            },
            title = "",
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = false,
            },
            follow_current_file = {
                enabled = true,
                leave_dirs_open = false,
            },
            highjack_netrw_behavior = "open_default",
        },
        -- input = {
        --     border = {
        --         style = "single",
        --     },
        -- },
        -- window = {
        --     position = "float",
        --     popup = {
        --         position = 0.5,
        --         size = {
        --             width = 0.75,
        --             height = 0.35,
        --         },
        --         relative = "editor",
        --         border = {
        --             style = "double",
        --             highlight = "Normal:,FloatBorder:",
        --         },
        --         win_options = {
        --             winhighlight = "Normal:FloatBorder:",
        --         },
        --     },
        -- },
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
    },
}
