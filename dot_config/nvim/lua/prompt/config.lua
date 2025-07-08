local Config = {}

Config.defaults = {
    provider = "openai",

    providers = {
        ["*"] = {
            system_prompt = "help, i suck at programming. :(",
        },
        ---@type ProviderOptions
        openai = {
            api_key_var = "OPENAI_API_KEY",
            base_url = "https://api.openai.com/v1",
            max_completion_tokens = 4096,
            model = "gpt-4o",
            timeout = 30000,
            temperature = 0.7,
        },
    },

    history = {
        logfile = vim.fn.stdpath("data") .. "/history/{{provider}}.log",
    },


    -- Sidebar configuration.
    sidebar = {
        position = "right",
        size = {
            width = "35%",
        },
        buf_opts = {
            bufhidden = "hide",
            buflisted = false,
            buftype = "nofile",
            filetype = "markdown",
            modifiable = false,
        },
        win_opts = {
            cursorline = false,
            cursorcolumn = false,
            fillchars = "eob: ",
            linebreak = true,
            list = false,
            number = false,
            relativenumber = false,
            signcolumn = "no",
            statusline = "",
            winfixbuf = true,
            winfixwidth = true,
            wrap = true,
        },

        -- Chat configuration.
        chat = {
            title = "",
        },

        -- Prompt configuration.
        prompt = {
            callback = function(prompt) vim.notify("prompt: " .. prompt) end,
            title = "",
            prefix = "",

            position = "bottom",
            size = {
                height = 1,
            },
        },
    },
}

return Config
