return {
    name = "prompt",
    dev = true,
    dir = "~/dotfiles/.config/nvim/lua/prompt",
    dependencies = {
        "grapp-dev/nui-components.nvim",
    },
    opts = {
        assistant_opts = {
            show_diffs = true,
        },
        provider = "openai",
        provider_opts = {
            api_key_var = "OPENAI_API_KEY",
            system_prompt = [[
        You are an expert in the field of computer science, and a helpful assistant.
        Do not respond with anything other than code.
        Do not wrap your response in any code blocks or backticks like ```.
        If you are sent code then you should modify it.
        If you are tasked with writing new code, then you should add it to the existing code and return all of it together.
        The code should be correct.
        If you are unable to complete the task, or you think something is wrong, you should say so in the form of code
        comments at the start of the new code. Only do this if it's absolutely necessary.
        Use the initial prompt to guide your actions.
        ]],
        },
    },
    config = function(_, opts)
        require("prompt").setup(opts)
    end,
}
