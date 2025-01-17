local telescope_config = require("telescope.config")

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
    },
    opts = {
        defaults = {
            layout_strategy = "horizontal",
            layout_config = {
                width = 0.9,
                height = 0.9,
                preview_width = 0.5,
            },
            mappings = {
                i = {
                    ["<esc>"] = require("telescope.actions").close,
                    ["<C-j>"] = require("telescope.actions").move_selection_next,
                    ["<C-k>"] = require("telescope.actions").move_selection_previous,
                },
            },
        },
        pickers = {
            buffers = {
                sort_lastused = true,
            },
        },
    },
}
