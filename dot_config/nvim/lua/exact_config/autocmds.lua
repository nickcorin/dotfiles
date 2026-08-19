local api = vim.api
local dotfiles_dir = assert(vim.env.DOTFILES_DIR, "DOTFILES_DIR must be set")

-- Enable Neovim's experimental message and command-line UI after startup.
api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		require("vim._core.ui2").enable()
	end,
})

-- Display LSP progress using Neovim's progress-message protocol.
vim.api.nvim_create_autocmd("LspProgress", {
	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local params = ev.data.params
		local value = params.value

		vim.api.nvim_echo({ { value.message or value.title or "done" } }, false, {
			id = ("lsp.%d.%s"):format(ev.data.client_id, params.token),
			kind = "progress",
			percent = value.percentage,
			source = client and client.name or "vim.lsp",
			status = value.kind == "end" and "success" or "running",
			title = value.title,
		})
	end,
})

-- Use Neovim's native LSP completion for attached clients.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
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
		vim.hl.on_yank({ higroup = "IncSearch", timeout = 1000 })
	end,
})

-- Resize neovim split when terminal is resized.
vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.cmd("wincmd =")
	end,
})

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
local chezmoi_group = api.nvim_create_augroup("chezmoi", { clear = true })
local chezmoi_ignored_files = {
	"run_onchange_.*",
	"run_once_.*",
	"%.chezmoiignore",
	"%.chezmoitemplate",
	"%.chezmoiexternal.*",
	"%.chezmoiroot",
	"%.chezmoiversion",
}

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = chezmoi_group,
	pattern = vim.fs.joinpath(dotfiles_dir, "*"),
	callback = function(ev)
		local source_path = api.nvim_buf_get_name(ev.buf)
		local filename = vim.fs.basename(source_path)
		for _, pattern in ipairs(chezmoi_ignored_files) do
			if filename:match(pattern) then
				return
			end
		end

		api.nvim_clear_autocmds({ event = "BufWritePost", group = chezmoi_group, buffer = ev.buf })
		api.nvim_create_autocmd("BufWritePost", {
			group = chezmoi_group,
			buffer = ev.buf,
			callback = function()
				vim.system({ "chezmoi", "apply", "--source-path", source_path }, { text = true }, function(result)
					vim.schedule(function()
						if result.code == 0 then
							vim.notify(("Applied %s"):format(filename), vim.log.levels.INFO)
							return
						end

						local error_message = vim.trim(result.stderr or "")
						if error_message == "" then
							error_message = ("chezmoi apply failed with exit code %d"):format(result.code)
						end
						vim.notify(error_message, vim.log.levels.ERROR)
					end)
				end)
			end,
		})
	end,
})
