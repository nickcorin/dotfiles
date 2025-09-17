local api = vim.api

-- Display LSP progress in the snacks notifier.
vim.api.nvim_create_autocmd("LspProgress", {
	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
	callback = function(ev)
		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		vim.notify(vim.lsp.status(), "info", {
			id = "lsp_progress",
			title = "LSP Progress",
			opts = function(notif)
				notif.icon = ev.data.params.value.kind == "end" and " "
					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
			end,
		})
	end,
})

-- When opening Neovim with a path argument:
---- If the target is a directory then cd to that directory.
---- If the target is a file, then cd to the parent directory of that file.
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
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
	end,
})

-- Temporarily highlight yanked content.
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
		local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
		if ft == "snacks_picker_list" then
			for _, b in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_get_option_value("modified", { buf = b }) then
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
