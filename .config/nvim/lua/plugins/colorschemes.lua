local configs = {}

configs.everforest = function()
    require("everforest").setup({
        background = "hard",
        italics = true,
        on_highlights = function(hl, palette)
            hl.DiagnosticError = { fg = palette.red, bg = palette.none, sp = palette.none }
            hl.DiagnosticWarn = { fg = palette.yellow, bg = palette.none, sp = palette.none }
            hl.DiagnosticInfo = { fg = palette.blue, bg = palette.none, sp = palette.none }
            hl.DiagnosticHint = { fg = palette.green, bg = palette.none, sp = palette.none }
        end,
        transparent_background_level = 2,
        ui_contrast = "high",
    })

    vim.cmd [[ colorscheme everforest ]]
end

configs.gruvbox = function()
    require("gruvbox").setup({
        terminal_colors = false, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = true,
            emphasis = true,
            comments = true,
            operators = false,
            folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,    -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
    })

    vim.cmd [[
        hi! link LspDiagnosticsDefaultError GruvboxRed
        hi! link LspDiagnosticsDefaultWarning GruvboxYellow
        hi! link LspDiagnosticsDefaultInformation GruvboxBlue
        hi! link LspDiagnosticsDefaultHint GruvboxAqua
    ]]

    vim.cmd [[ colorscheme gruvbox ]]
end

configs.gruvboxMaterial = function()
    vim.opt.background = "dark"
    vim.g.gruvbox_material_foreground = "material"
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_better_performance = 1

    vim.cmd [[ colorscheme gruvbox-material ]]
end

configs.rosePine = function()
    require("rose-pine").setup({
        variant = "main", -- moon, dawn, main
        disable_background = false,
        enable_italics = false,
    })

    vim.cmd [[ colorscheme rose-pine ]]
end

return configs
