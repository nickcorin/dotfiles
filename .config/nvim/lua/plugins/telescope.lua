return function()
    local actions = require("telescope.actions")

    require("telescope").setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
            },
        },
        extensions = {
            frecency = {
                show_scores = true,
                show_unindexed = true,
                ignore_patterns = {"*.git/*", "*/tmp/*"},
            },
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({
                    relative = "top",
                    winblend = 10,
                    border = "single",
                    previewer = false,
                    layout_config = {
                        width = 0.5,
                    },
                }),
            },
        },
    })

    require("telescope").load_extension("frecency")
    require("telescope").load_extension("ui-select")

end
