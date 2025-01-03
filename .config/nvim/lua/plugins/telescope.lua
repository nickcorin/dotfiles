return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope-frecency.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = {
        defaults = {
            layout_strategy = "bottom_pane",
            layout_config = {
                height = 15,
                prompt_position = "top",
            },
            mappings = {
                i = {
                    ["<esc>"] = require("telescope.actions").close,
                    ["<C-j>"] = require("telescope.actions").move_selection_next,
                    ["<C-k>"] = require("telescope.actions").move_selection_previous,
                },
            },
            prompt_prefix = "🔍 ",
        },
        pickers = {
            buffers = {
                sort_lastused = true,
                theme = "dropdown",
                layout_config = {
                    width = 0.5,
                },
            },
            find_files = {
                theme = "dropdown",
                layout_config = {
                    width = 0.5,
                },
            },
            live_grep = {
                theme = "dropdown",
                layout_config = {
                    width = 0.5,
                },
            },
            lsp_definitions = {
                theme = "dropdown",
                layout_config = {
                    width = 0.5,
                },
            },
            lsp_implementations = {
                theme = "dropdown",
                layout_config = {
                    width = 0.5,
                },
            },
            lsp_incoming_calls = {
                theme = "dropdown",
                layout_config = {
                    width = 0.5,
                },
            },
            lsp_outgoing_calls = {
                theme = "dropdown",
                layout_config = {
                    width = 0.5,
                },
            },
            lsp_references = {
                theme = "dropdown",
                layout_config = {
                    width = 0.5,
                },
            },
            diagnostics = {
                theme = "dropdown",
                layout_config = {
                    width = 0.5,
                },
            },
            frecency = {
                theme = "dropdown",
                layout_config = {
                    width = 0.5,
                },
            },
        },
        extensions = {
            frecency = {
                show_scores = true,
                show_unindexed = true,
                ignore_patterns = { "*.git/*", "*/tmp/*" }
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
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("frecency")
        require("telescope").load_extension("ui-select")
    end,
}
