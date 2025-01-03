local keys = {
    -- Insert mode.
    i = {},

    -- Normal mode.
    n = {
        -- Selects the entire buffer.
        { "<leader>a",  "ggVG" },

        -- Uses Telescope to view open buffers.
        { "<leader>b",  ":Telescope buffers<CR>" },

        -- Closes the quickfix window.
        { "<leader>c",  ":cclose<CR>" },

        -- Shows currently available code actions from the LSP.
        { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>" },

        -- Triggers the LSP to jump to the next or previous diagnostic.
        { "]d",         "<cmd>lua vim.diagnostic.goto_next()<CR>" },
        { "[d",         "<cmd>lua vim.diagnostic.goto_prev()<CR>" },

        -- Keeps the cursor in the middle of the screen when paging up or down.
        { "<C-d>",      "<C-d>zz" }, { "<C-u>", "<C-u>zz" },

        -- Duplicate lines down. Similar to Ctrl-D in other code editors.
        { "<leader>d", "yyp" },

        -- Toggles the neotree file explorer.
        { "<leader>e", ":Neotree toggle left<CR>" },

        -- Uses Telescope to search for text.
        { "<leader>f", ":Telescope live_grep<CR>" },

        -- Triggers the LSP to jump to the definition of the symbol under the cursor.
        { "gd",        ":Telescope lsp_definitions<CR>" },

        -- Opens the diagnostic float window.
        { "gf",        "<cmd>lua vim.diagnostic.open_float()<CR>" },

        -- Triggers the LSP to show signature help.
        { "gh",        "<cmd>lua vim.lsp.buf.signature_help()<CR>" },

        -- Triggers the LSP to jump to the implementation of the symbol under the cursor.
        { "gi",        ":Telescope lsp_implementations<CR>" },

        -- Triggers the LSP to show the diagnostics for the current buffer.
        { "gp",        ":Telescope diagnostics<CR>" },

        -- Triggers the LSP to show the references to the symbol under the cursor.
        { "gr",        ":Telescope lsp_references<CR>" },

        -- Triggers the LSP to rename the symbol under the cursor.
        { "gs",        "<cmd>lua vim.lsp.buf.rename()<CR>" },

        -- Toggles the neotree git explorer.
        { "<leader>g", ":Neotree toggle git_status left<CR>" },

        -- Finds files using Telescope frecency.
        { "<leader>h", ":Telescope frecency workspace=CWD<CR>" },

        -- Finds incoming calls using Telescope.
        { "<leader>i", ":Telescope lsp_incoming_calls<CR>" },

        -- Set the cursor to move by line in the editor rather than by line in the file. This means that multi-line
        -- rows won't be treated as a single line.
        { "j",         "gj" }, { "k", "gk" },

        -- Triggers the LSP to display the hover information for the symbol under the cursor.
        { "<leaner>K", "<cmd>lua vim.lsp.buf.hover()<CR>" },

        -- Place all search results in the center of the screen.
        { "n",         "nzz" }, { "N", "Nzz" }, { "*", "*zz" }, { "#", "#zz" }, { "g*", "g*zz" },

        -- Finds outgoing calls using Telescope.
        { "<leader>o", ":Telescope lsp_outgoing_calls<CR>" },

        -- Finds files using Telescope.
        { "<leader>p", ":Telescope find_files<CR>" },

        -- Finds projects using Telescope.
        { "<leader>P", ":Telescope projects<CR>" },

        -- Fast quit.
        { "<leader>q", ":q!<CR>" },

        -- Restarts the LSP, useful after adding new dependencies to the package.
        { "<leader>r", ":LspRestart<CR>" },

        -- Toggles the neotree document symbols explorer.
        { "<leader>s", ":Telescope lsp_workspace_symbols<CR>" },


        -- Fast save.
        { "<leader>w", ":w!<CR>" },

        -- Fast save and quit. Only saves if the file has been changed.
        { "<leader>x", ":x!<CR>" },

        -- Toggles the zen mode.
        { "<leader>z", ":ZenMode<CR>" },

        -- Disable the use of the arrow keys. Rather use the home row.
        { "<Up>",      "<nop>" }, { "<Down>", "<nop>", }, { "<Left>", "<nop>" }, { "<Right>", "<nop>" },

    },
    -- Visual / select mode.
    v = {
        -- Duplicate lines down. Similar to Ctrl-D in other code editors.
        { "<leader>d", "yyp" },

        -- Preserves your copied content when pasting.
        { "p",         "\"_dp" },
        { "P",         "\"_dP" },

        -- Shift complete lines up and down.
        { "<S-j>",     ":m'>+1<CR>gv=gv" }, { "<S-k>", ":m'<-2<CR>gv=gv" },

        -- After indenting a line, keep it selected so that you can do it again.
        { ">", ">gv" }, { "<", "<gv" },
    },
    -- Visual mode.
    x = {
        -- Preserves your copied content when pasting.
        { "p", "\"_dp" },
        { "P", "\"_dP" },
    },
    -- All modes.
    [""] = {
        -- Use the home row for Home / End.
        { "H",     "^" }, { "L", "$" },

        -- Easier split-pane switching using the home row.
        { "<C-j>", "<C-W>j" },
        { "<C-k>", "<C-W>k" },
        { "<C-h>", "<C-W>h" },
        { "<C-l>", "<C-W>l" },

        -- Pressing Q is the worst thing you can do in VIM.
        { "Q",     "<nop>" }
    },
}

local default_opts = { silent = true, noremap = true }

for mode, mode_map in pairs(keys) do
    for _, map in pairs(mode_map) do
        -- If the length of the table is 3, then we've got additional options.
        -- This removes the last element from the table, in this case isolating
        -- the options.
        local opts = #mode_map == 3 and table.remove(map) or default_opts

        -- After the options have been removed, we can unpack the first
        -- two elements in the table.
        --
        -- The unpack function has been replaced by table.unpack in Lua 5.2.
        -- Make sure to fix this once Neovim upgrades Lua.
        local prefix, cmd = unpack(map)
        vim.api.nvim_set_keymap(mode, prefix, cmd, opts)
    end
end
