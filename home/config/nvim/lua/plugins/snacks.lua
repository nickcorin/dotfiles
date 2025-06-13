return {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
        explorer = {
            replace_netrw = true,
        },
        indent = {
            enabled = true,
            animate = {
                enabled = false,
            },
        },
        notifier = {
            enabled = true,
            timeout = 5000,
            wo = {
                wrap = true,
            },
        },
        picker = {
            sources = {
                explorer = {
                    auto_close = false,
                    finder = "explorer",
                    focus = "list",
                    follow_file = true,
                    git_status = true,
                    hidden = true,
                    supports_live = true,
                    watch = true,
                },
            },
        },
        statuscolumn = {
            enabled = true,
        },
    },
}
