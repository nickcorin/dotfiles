return {
    "kawre/leetcode.nvim",
    dependencies = {
        "3rd/image.nvim",
        "nvim-telescope/telescope.nvim",
        -- Optional. Will default to telescope if not installed.
        -- "ibhagwan/fzf-lua",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    cmd = "Leet",
    opts = {
        lang = "python3",
        image_support = true,
    },
}
