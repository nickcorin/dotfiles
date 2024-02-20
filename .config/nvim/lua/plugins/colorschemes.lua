return {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function() 
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
     
        vim.cmd("colorscheme everforest")
    end,
}
