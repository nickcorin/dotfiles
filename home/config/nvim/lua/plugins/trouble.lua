return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
        auto_preview = true,
        auto_refresh = true,
        focus = true,
        follow = false,
        open_no_results = true,
        warn_no_results = false,
        modes = {
            diagnostics = {
                desc = "Project Diagnostics",
                mode = "diagnostics",
                focus = true,
                groups = {
                    { "filename", format = "{file_icon} {basename:Title} {count}" }
                },
                win = {
                    position = "bottom",
                    size = 15,
                    wo = {
                        winhighlight = "Normal:Normal",
                    },
                },
                preview = {
                    border = "single",
                    position = "right",
                    scratch = false,
                    relative = "win",
                    size = 0.4,
                    type = "split",
                    wo = {
                        winhighlight = "Normal:Normal",
                    },
                },
            },
        },
    }
}
