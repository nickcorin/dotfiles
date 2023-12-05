function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { ctermbg = NONE, guibg = NONE })
end

ColorMyPencils()
