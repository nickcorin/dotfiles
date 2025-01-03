return {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = true,
    init = function()
        vim.cmd("colorscheme rose-pine")
    end,
    opts = {
        variant = "main",
        disable_background = false,
        styles = {
            bold = true,
            italic = false,
            transparency = false,
        }
    },
}
