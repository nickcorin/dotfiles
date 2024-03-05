return function()
    require("lualine").setup({
        options = {
            theme = "auto",
            globalstatus = false,
            section_separators = { "", "" },
            component_separators = { "|", "|" },
        },
        sections = {
            lualine_a = {
                {
                    'fancy_mode',
                    width = 3
                },
            },
            lualine_b = { 'fancy_branch' },
            lualine_c = {
                {
                    'fancy_cwd',
                    substitute_home = true,
                },
                {
                    'filename',
                    file_status = true,
                    newfile_status = true,
                    path = 1
                },
                {
                    'fancy_diagnostics',
                    always_visible = true,
                    sources = { 'nvim_lsp' },
                },
                { "fancy_searchcount" },
            },
            lualine_x = {"fancy_filetype"},
            lualine_y = { "fancy_lsp_servers", "fancy_diff", "progress"},
            lualine_z = {}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        extensions = { "neo-tree", "lazy" },
    })
end
