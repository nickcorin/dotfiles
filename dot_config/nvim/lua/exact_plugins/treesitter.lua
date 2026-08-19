return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.setup({
			install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
		})

		local available_parsers = treesitter.get_available()
		local function highlighting_is_ready(language)
			if not vim.treesitter.language.add(language) then
				return false
			end

			return #vim.treesitter.query.get_files(language, "highlights") > 0
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				local filetype = vim.bo[ev.buf].filetype
				local language = vim.treesitter.language.get_lang(filetype)
				if not language then
					return
				end

				if highlighting_is_ready(language) then
					vim.treesitter.start(ev.buf, language)
					return
				end

				if not vim.list_contains(available_parsers, language) then
					return
				end

				treesitter.install(language):await(function(error, installed)
					if error or not installed then
						local reason = error and tostring(error) or "installation did not complete"
						vim.schedule(function()
							vim.notify(
								("Failed to install the Tree-sitter parser for %s:\n%s"):format(language, reason),
								vim.log.levels.ERROR,
								{ title = "Tree-sitter" }
							)
						end)
						return
					end

					vim.schedule(function()
						if
							vim.api.nvim_buf_is_valid(ev.buf)
							and vim.bo[ev.buf].filetype == filetype
							and highlighting_is_ready(language)
						then
							vim.treesitter.start(ev.buf, language)
						end
					end)
				end)
			end,
		})
	end,
}
