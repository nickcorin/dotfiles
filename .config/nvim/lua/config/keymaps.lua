local keys = {
    { "<leader>a",  "ggVG",                                      mode = { "n" },      desc = "Select entire buffer" },
    { "<leader>b",  ":Telescope buffers<CR>",                    mode = { "n" },      desc = "View open buffers" },
    { "<leader>c",  ":cclose<CR>",                               mode = { "n" },      desc = "Close quickfix window" },
    { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",    mode = { "n" },      desc = "Show code actions" },
    { "]d",         "<cmd>lua vim.diagnostic.goto_next()<CR>",   mode = { "n" },      desc = "Next diagnostic" },
    { "[d",         "<cmd>lua vim.diagnostic.goto_prev()<CR>",   mode = { "n" },      desc = "Previous diagnostic" },
    { "<C-d>",      "<C-d>zz",                                   mode = { "n" },      desc = "Page down and center" },
    { "<C-u>",      "<C-u>zz",                                   mode = { "n" },      desc = "Page up and center" },
    { "<leader>d",  "yyp",                                       mode = { "n", "v" }, desc = "Duplicate lines down" },
    { "<leader>e",  ":Neotree toggle left<CR>",                  mode = { "n" },      desc = "Toggle file explorer" },
    { "<leader>f",  ":Telescope live_grep<CR>",                  mode = { "n" },      desc = "Search text" },
    { "gd",         ":Telescope lsp_definitions<CR>",            mode = { "n" },      desc = "Go to definition" },
    { "gf",         "<cmd>lua vim.diagnostic.open_float()<CR>",  mode = { "n" },      desc = "Open diagnostic float" },
    { "gh",         "<cmd>lua vim.lsp.buf.signature_help()<CR>", mode = { "n" },      desc = "Show signature help" },
    { "gi",         ":Telescope lsp_implementations<CR>",        mode = { "n" },      desc = "Go to implementation" },
    { "gp",         ":Telescope diagnostics<CR>",                mode = { "n" },      desc = "Show diagnostics" },
    { "gr",         ":Telescope lsp_references<CR>",             mode = { "n" },      desc = "Show references" },
    { "gs",         "<cmd>lua vim.lsp.buf.rename()<CR>",         mode = { "n" },      desc = "Rename symbol" },
    { "<leader>g",  ":Telescope git_status<CR>",                 mode = { "n" },      desc = "Show git status." },
    { "<leader>G",  ":Telescope git_commits<CR>",                mode = { "n" },      desc = "Show git commits." },
    { "<leader>h",  ":Telescope oldfiles<CR>",                   mode = { "n" },      desc = "Find files with frecency" },
    { "<leader>i",  ":Telescope lsp_incoming_calls<CR>",         mode = { "n" },      desc = "Find incoming calls" },
    { "j",          "gj",                                        mode = { "n" },      desc = "Move cursor by line" },
    { "k",          "gk",                                        mode = { "n" },      desc = "Move cursor by line" },
    { "<leader>K",  "<cmd>lua vim.lsp.buf.hover()<CR>",          mode = { "n" },      desc = "Display hover information" },
    { "n",          "nzz",                                       mode = { "n" },      desc = "Center search results" },
    { "N",          "Nzz",                                       mode = { "n" },      desc = "Center search results" },
    { "*",          "*zz",                                       mode = { "n" },      desc = "Center search results" },
    { "#",          "#zz",                                       mode = { "n" },      desc = "Center search results" },
    { "g*",         "g*zz",                                      mode = { "n" },      desc = "Center search results" },
    { "<leader>o",  ":Telescope find_files<CR>",                 mode = { "n" },      desc = "Find files" },
    { "<leader>O",  ":Telescope projects<CR>",                   mode = { "n" },      desc = "Find projects" },
    { "<leader>p",  "<cmd>Ass<CR>",                              mode = { "n", "v" }, desc = "Prompts the LLM." },
    { "<leader>q",  ":q!<CR>",                                   mode = { "n" },      desc = "Fast quit" },
    { "<leader>r",  ":LspRestart<CR>",                           mode = { "n" },      desc = "Restart LSP" },
    { "<leader>s",  ":Telescope lsp_workspace_symbols<CR>",      mode = { "n" },      desc = "Toggle document symbols explorer" },
    { "<leader>w",  ":w!<CR>",                                   mode = { "n" },      desc = "Fast save" },
    { "<leader>x",  ":x!<CR>",                                   mode = { "n" },      desc = "Fast save and quit" },
    { "<leader>y",  "<cmd>Trouble diagnostics toggle<CR>",       mode = { "n" },      desc = "Toggle diagnostics (Trouble)" },
    { "<leader>z",  ":ZenMode<CR>",                              mode = { "n" },      desc = "Toggle Zen mode" },
    { "<Up>",       "<nop>",                                     mode = { "n" },      desc = "Disable arrow keys" },
    { "<Down>",     "<nop>",                                     mode = { "n" },      desc = "Disable arrow keys" },
    { "<Left>",     "<nop>",                                     mode = { "n" },      desc = "Disable arrow keys" },
    { "<Right>",    "<nop>",                                     mode = { "n" },      desc = "Disable arrow keys" },
    { "p",          "\"_dp",                                     mode = { "v", "x" }, desc = "Preserve copied content when pasting" },
    { "P",          "\"_dP",                                     mode = { "v", "x" }, desc = "Preserve copied content when pasting" },
    { "<S-j>",      ":m'>+1<CR>gv=gv",                           mode = { "v" },      desc = "Shift lines down" },
    { "<S-k>",      ":m'<-2<CR>gv=gv",                           mode = { "v" },      desc = "Shift lines up" },
    { ">",          ">gv",                                       mode = { "v" },      desc = "Keep line selected after indenting" },
    { "<",          "<gv",                                       mode = { "v" },      desc = "Keep line selected after indenting" },
    { "H",          "^",                                         mode = { "" },       desc = "Use home row for Home" },
    { "L",          "$",                                         mode = { "" },       desc = "Use home row for End" },
    { "<C-j>",      "<C-W>j",                                    mode = { "" },       desc = "Split-pane switch down" },
    { "<C-k>",      "<C-W>k",                                    mode = { "" },       desc = "Split-pane switch up" },
    { "<C-h>",      "<C-W>h",                                    mode = { "" },       desc = "Split-pane switch left" },
    { "<C-l>",      "<C-W>l",                                    mode = { "" },       desc = "Split-pane switch right" },
    { "Q",          "<nop>",                                     mode = { "" },       desc = "Disable Q" },
}

local default_opts = { silent = true, noremap = true }

for _, map in pairs(keys) do
    local opts = {
        silent = map.silent or default_opts.silent,
        noremap = map.noremap or default_opts.noremap,
        desc = map
            .desc
    }
    for _, m in pairs(map.mode) do
        vim.keymap.set(m, map[1], map[2], opts)
    end
end
