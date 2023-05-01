-- Set the leader key to <Space>. This must be set before any other keymaps that
-- use the <leader> key.
vim.g.mapleader = " "

local keys = {
    -- Insert mode.
    i = {},

    -- Normal mode.
    n = {
        -- Closes the quickfix window.
        { "<leader>a", ":cclose<CR>" },

        -- Keeps the cursor in the middle of the screen when paging up or down.
        { "<C-d>",     "<C-d>zz" }, { "<C-u>", "<C-u>zz" },

        -- Duplicate lines down. Similar to Ctrl-D in other code editors.
        { "<leader>d", "yyp" },

        -- Opens a project in a new tmux session.
        { "<C-f>",     "<cmd>silent !tmux neww tmux-sessionizer<CR>" },

        -- Place all search results in the center of the screen.
        { "n",         "nzz" }, { "N", "Nzz" }, { "*", "*zz" }, { "#", "#zz" }, { "g*", "g*zz" },

        -- Opens a new file for editing adjacent to the current open file.
        { "<leader>n",  ":e <C-R>=expand(\"%:p:h\") . \"/\" <CR>" },

        -- Opens netrw.
        { "<leader>pv", ":Ex<CR>" },

        -- Restarts the LSP, useful after adding new dependencies to the package.
        { "<leader>r",  ":LspRestart<CR>" },

        -- Start a string replace for the word under your cursor.
        { "<leader>s",  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]] },

        -- Fast quit.
        { "<leader>q",  ":q!<CR>" },

        -- Fast save.
        { "<leader>w",  ":w!<CR>" },

        -- Fast save and quit. Only saves if the file has been changed.
        { "<leader>x",  ":x!<CR>" },

        -- Set the cursor to move by line in the editor rather than by line in the file. This means that multi-line
        -- rows won't be treated as a single line.
        { "j",          "gj" }, { "k", "gk" },

        -- Disable the use of the arrow keys. Rather use the home row.
        { "<Up>", "<nop>" }, { "<Down>", "<nop>", }, { "<Left>", "<nop>" }, { "<Right>", "<nop>" },

    },
    -- Visual / select mode.
    v = {
        -- Duplicate lines down. Similar to Ctrl-D in other code editors.
        { "<leader>d", "yyp" },

        -- Preserves your copied content when pasting.
        { "p",         "\"_dP" },

        -- Shift complete lines up and down.
        { "<S-j>",     ":m'>+1<CR>gv=gv" }, { "<S-k>", ":m'<-2<CR>gv=gv" },

        -- After indenting a line, keep it selected so that you can do it again.
        { ">", ">gv" }, { "<", "<gv" },
    },
    -- Visual mode.
    x = {
        -- Preserves your copied content when pasting.
        { "p", "\"_dP" },
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