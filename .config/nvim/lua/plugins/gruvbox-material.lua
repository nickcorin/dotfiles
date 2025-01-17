return {
    "sainnhe/gruvbox-material",
    lazy = false,
    enabled = true,
    config = function()
        vim.g.gruvbox_material_disable_italic_comment = 0
        vim.g.gruvbox_material_enable_bold = 1
        vim.g.gruvbox_material_enable_italic = 1
        vim.g.gruvbox_material_foreground = "original"
        vim.g.gruvbox_material_background = "hard"

        vim.cmd("colorscheme gruvbox-material")
    end,
}
