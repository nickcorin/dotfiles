return {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    init = function()
        vim.cmd("colorscheme gruvbox")
    end,
    opts = {
        contrast = "hard",
    },
}
