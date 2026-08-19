local local_themes = {
	alacritty = true,
}

local M = {
	name = "alacritty",
}

function M.apply_local()
	if local_themes[M.name] then
		vim.cmd.colorscheme(M.name)
	end
end

return M
