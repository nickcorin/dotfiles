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

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				local filetype = vim.bo[ev.buf].filetype
				local language = vim.treesitter.language.get_lang(filetype)
				if not language then
					return
				end

				if vim.treesitter.language.add(language) then
					vim.treesitter.start(ev.buf, language)
					return
				end

				if not vim.list_contains(available_parsers, language) then
					return
				end

				treesitter.install(language):await(function(error, installed)
					if error or not installed then
						return
					end

					vim.schedule(function()
						if vim.api.nvim_buf_is_valid(ev.buf) and vim.bo[ev.buf].filetype == filetype then
							vim.treesitter.start(ev.buf, language)
						end
					end)
				end)
			end,
		})
	end,
}
