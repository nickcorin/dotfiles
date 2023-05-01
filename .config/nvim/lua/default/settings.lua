local globals = {
    -- Disable showing the information banner on the top of netrw.
    netrw_banner = 0,

    -- Sets the behavior of pressing <CR> on a selected file in netrw.
    netrw_browse_split = 0,

    -- Sets the default list style in netrw.
    netrw_liststyle = 3,

    -- Sets the initial size of new netrw windows.
    netrw_winsize = 20,
}

for k, v in pairs(globals) do
    vim.g[k] = v
end

local settings = {
    -- Disable creating backup files.
    backup = false,

    -- Always access the system clipboard both ways. Yanking copies onto it
    -- and you can paste with P from it.
    clipboard = "unnamedplus",

    -- Show a visual ruler at 80 characters.
    colorcolumn = "120",

    -- Comma separated list for Insert mode completions.
    -- It's a requirement for nvim-compe to set this to "menuone,noselect".
    completeopt = "menuone,noselect",

    -- Enable highlighting of the line your cursor is on.
    cursorline = true,

    -- Disable the audible terminal bells.
    errorbells = false,

    -- Use spaces instead of <Tab>s.
    expandtab = true,

    -- Disable abandoning buffers if they are not active. VIM defaults to
    -- abandoning buffers which are not active. It can be hard to keep track
    -- of changes made to all buffers.
    hidden = true,

    -- Disable keeping search results highlighted.
    hlsearch = false,

    -- Find search results as the search query is typed.
    incsearch = true,

    -- Enable mouse mode. Only allows scrolling within the VIM buffer, and
    -- extends scrolling after EOF.
    mouse = "a",

    -- Show line numbers, as well as relative numbers from where you are in
    -- the buffer.
    number = true,
    relativenumber = true,

    -- Keep a minimum number of lines padding my cursor at the top or bottom
    -- of the buffer.
    scrolloff = 8,

    -- Number of spaces to use for each step of indenting.
    shiftwidth = 4,

    -- Always show currently open tabs.
    showtabline = 2,

    -- Always show the sign column, otherwise it shifts the text each time
    -- it's added and removed.
    signcolumn = "yes",

    -- Enable autoindenting when starting a new line.
    smartindent = true,

    -- The number of spaces that a <Tab> in the file counts for during editing cmds.
    softtabstop = 4,

    -- Split the pane below.
    splitbelow = true,

    -- Split the pane to the right.
    splitright = true,

    -- Disable creating swapfiles.
    swapfile = false,

    -- The number of spaces that a <Tab> in the file counts for.
    tabstop = 4,

    -- Better colors.
    termguicolors = true,

    -- Auto-wrap comments at 120 characters.
    textwidth = 120,

    -- Sets the directory to store undo operations.
    undodir = os.getenv("HOME") .. "/vim/undodir",

    -- Persist actions to enable undo even after restart.
    undofile = true,

    -- Faster update times.
    updatetime = 50,

    -- Disable the visual terminal bells.
    visualbell = false,

    -- Disable line wrapping.
    wrap = false,
}

for k, v in pairs(settings) do
    vim.opt[k] = v
end
