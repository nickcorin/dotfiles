return {
   "github/copilot.vim",
   cmd = "Copilot",
   lazy = false,
   build = ":Copilot setup",
   event = "InsertEnter",
   disable = false,
   config = function()
       require("copilot").setup({})
   end,
}
