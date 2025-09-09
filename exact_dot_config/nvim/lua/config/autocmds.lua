-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local api = vim.api

local function set_root_dir()
	local open_target = vim.fn.argv(0) --[[@as string]]
	if not open_target or open_target == "" then
		return
	end

	if vim.fn.isdirectory(open_target) == 0 then
		open_target = vim.fn.fnamemodify(open_target, ":p:h")
	end

	if vim.fn.isdirectory(open_target) == 0 or open_target == vim.fn.getcwd() then
		return
	end

	vim.cmd("cd " .. open_target)
end

-- Set the root directory of the project to the current file's directory on startup.
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = set_root_dir,
})

-- Don't auto comment new line.
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight on yank.
api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 1000 })
	end,
})

-- Resize neovim split when terminal is resized.
vim.api.nvim_command("autocmd VimResized * wincmd =")

-- Quit Neovim if only Snacks windows are open.
vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local wins = vim.api.nvim_list_wins()
		if #wins ~= 1 then
			return
		end
		local buf = vim.api.nvim_win_get_buf(wins[1])
		local ft = vim.api.nvim_buf_get_option(buf, "filetype")
		if ft == "snacks_picker_list" then
			for _, b in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_get_option(b, "modified") then
					return
				end
			end
			vim.cmd("q")
		end
	end,
})

-- Apply changes to chezmoi managed dotfiles automatically.
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { os.getenv("DOTFILES_PATH") .. "/*" },
	callback = function(ev)
		local bufnr = ev.buf
		local edit_watch = function()
			require("chezmoi.commands.__edit").watch(bufnr)
		end
		vim.schedule(edit_watch)
	end,
})
