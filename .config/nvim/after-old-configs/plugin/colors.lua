require("everforest").setup({
    background = "hard",
    transparent_background_level = 2,
    italics = true,
    ui_contrast = "high",

    require("everforest").setup({
        on_highlights = function(hl, palette)
            hl.DiagnosticError = { fg = palette.red, bg = palette.none, sp = palette.none }
            hl.DiagnosticWarn = { fg = palette.yellow, bg = palette.none, sp = palette.none }
            hl.DiagnosticInfo = { fg = palette.blue, bg = palette.none, sp = palette.none }
            hl.DiagnosticHint = { fg = palette.green, bg = palette.none, sp = palette.none }
        end,
    })
})

function ColorMyPencils(color)
    color = color or "everforest"
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
