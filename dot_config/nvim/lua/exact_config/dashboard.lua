local quotes = require("config.dashboard_quotes")

local fallback_art = [[
   _  __________ _   ________  ___
  / |/ / __/ __ \ | / /  _/  |/  /
 /    / _// /_/ / |/ // // /|_/ /
/_/|_/___/\____/|___/___/_/  /_/
]]
local cache_version = 3
local max_file_segments = 5

local status_categories = {
	{ key = "added", label = "added", hl = "DiagnosticOk", codes = { A = true } },
	{ key = "modified", label = "modified", hl = "DiagnosticWarn", codes = { M = true, T = true } },
	{ key = "deleted", label = "deleted", hl = "DiagnosticError", codes = { D = true } },
	{ key = "renamed", label = "renamed", hl = "DiagnosticInfo", codes = { R = true } },
	{ key = "copied", label = "copied", hl = "DiagnosticInfo", codes = { C = true } },
	{ key = "untracked", label = "untracked", hl = "DiagnosticInfo" },
	{ key = "conflicted", label = "conflicted", hl = "DiagnosticError" },
}

local conflict_statuses = {
	AA = true,
	AU = true,
	DD = true,
	DU = true,
	UA = true,
	UD = true,
	UU = true,
}

local action_keys = {
	{
		action = function()
			Snacks.lazygit()
		end,
		desc = "LazyGit",
		hidden = true,
		key = "l",
	},
	{
		action = function()
			Snacks.picker.zoxide()
		end,
		desc = "Projects",
		hidden = true,
		key = "p",
	},
	{ action = ":qa", desc = "Quit", hidden = true, key = "q" },
}

local function fallback(message)
	return fallback_art:gsub("%s+$", "") .. "\n\n" .. message
end

local function normalize_header(output)
	local lines = vim.split(output:gsub("%s+$", ""), "\n", { plain = true })
	local width = 0

	for index, line in ipairs(lines) do
		lines[index] = line:gsub("[ \t]+$", "")
		width = math.max(width, vim.fn.strdisplaywidth(lines[index]))
	end
	for index, line in ipairs(lines) do
		lines[index] = line .. string.rep(" ", width - vim.fn.strdisplaywidth(line))
	end

	return table.concat(lines, "\n")
end

local function header()
	local hostname = vim.uv.os_gethostname()
	if not hostname then
		return fallback("Could not determine this computer's name.")
	end
	hostname = (hostname:match("^[^%.]+") or hostname):upper()

	local font = vim.fs.joinpath(vim.fn.stdpath("config"), "assets", "figlet", "ANSI Shadow.flf")
	local font_stat = vim.uv.fs_stat(font)
	if not font_stat then
		return fallback("Apply dotfiles to install the dashboard font.")
	end

	local cache_identity = table.concat({
		tostring(cache_version),
		hostname,
		font,
		tostring(font_stat.size),
		tostring(font_stat.mtime.sec),
	}, ":")
	local cache_file = vim.fs.joinpath(
		vim.fn.stdpath("cache"),
		"dashboard-header-" .. vim.fn.sha256(cache_identity):sub(1, 16) .. ".txt"
	)
	if vim.fn.filereadable(cache_file) == 1 then
		return table.concat(vim.fn.readfile(cache_file), "\n")
	end

	if vim.fn.executable("figlet") == 0 then
		return fallback("Install figlet to show this computer's name.")
	end

	local result = vim.system({ "figlet", "-w", "1000", "-f", font, hostname }, { text = true }):wait()
	if result.code ~= 0 or result.stdout == "" then
		return fallback("FIGlet could not generate this computer's name.")
	end

	local rendered = normalize_header(result.stdout)
	pcall(function()
		vim.fn.mkdir(vim.fs.dirname(cache_file), "p")
		vim.fn.writefile(vim.split(rendered, "\n", { plain = true }), cache_file)
	end)
	return rendered
end

local function fit(text, width)
	if vim.fn.strdisplaywidth(text) <= width then
		return text
	end

	repeat
		text = vim.fn.strcharpart(text, 0, vim.fn.strchars(text) - 1)
	until vim.fn.strdisplaywidth(text) < width
	return text .. "…"
end

local function info_row(icon, label, value, highlight)
	return {
		text = {
			{ icon, hl = "icon", width = 3 },
			{ label, hl = "title", width = 10 },
			{ fit(value, 47), hl = highlight, width = 47 },
		},
	}
end

local function status_summary(output)
	local counts = {}
	for _, category in ipairs(status_categories) do
		counts[category.key] = 0
	end

	for line in output:gmatch("[^\r\n]+") do
		local status = line:sub(1, 2)
		local index = status:sub(1, 1)
		local worktree = status:sub(2, 2)

		if status == "??" then
			counts.untracked = counts.untracked + 1
		elseif conflict_statuses[status] then
			counts.conflicted = counts.conflicted + 1
		else
			for _, category in ipairs(status_categories) do
				if category.codes and (category.codes[index] or category.codes[worktree]) then
					counts[category.key] = counts[category.key] + 1
				end
			end
		end
	end

	local rows = { { width = 0 } }
	for _, category in ipairs(status_categories) do
		local count = counts[category.key]
		if count > 0 then
			local phrase = count .. " " .. category.label
			local row = rows[#rows]
			local prefix = row.width == 0 and "" or " · "
			local width = vim.fn.strdisplaywidth(prefix .. phrase)
			if row.width > 0 and row.width + width > 47 then
				row = { width = 0 }
				rows[#rows + 1] = row
				prefix = ""
				width = vim.fn.strdisplaywidth(phrase)
			end
			row[#row + 1] = {
				prefix .. phrase,
				hl = category.hl,
			}
			row.width = row.width + width
		end
	end

	return rows[1].width > 0 and rows or { { { "✓ clean", hl = "DiagnosticOk" }, width = 7 } }
end

local function workspace()
	local cwd = vim.fn.getcwd()
	local root = Snacks.git.get_root(cwd)
	local location = vim.fn.fnamemodify(cwd, ":~")
	local items = {}

	if root then
		location = vim.fn.fnamemodify(root, ":t")
		local relative = vim.fs.relpath(root, cwd)
		if relative and relative ~= "." then
			location = location .. "/" .. relative
		end
	end

	items[#items + 1] = info_row("󰉋 ", root and "Project" or "Directory", location, "dir")
	if not root then
		items[#items].padding = 1
		return items
	end

	local branch_result = vim.system({ "git", "-C", root, "branch", "--show-current" }, { text = true }):wait()
	local branch = branch_result.code == 0 and vim.trim(branch_result.stdout) or ""
	if branch ~= "" then
		items[#items + 1] = info_row(" ", "Branch", branch, "special")
	end

	local status_result = vim.system({ "git", "-C", root, "status", "--porcelain=v1" }, { text = true }):wait()
	if status_result.code == 0 then
		for index, summary in ipairs(status_summary(status_result.stdout)) do
			local text = {
				{ index == 1 and " " or "", hl = "icon", width = 3 },
				{ index == 1 and "Status" or "", hl = "title", width = 10 },
			}
			vim.list_extend(text, summary)
			items[#items + 1] = { text = text }
		end
	end

	items[#items].padding = 1
	return items
end

local function quote()
	local selected = quotes[((tonumber(os.date("%j")) or 1) - 1) % #quotes + 1]
	return {
		{ align = "center", hl = "footer", text = "“" .. selected.text .. "”" },
		{ align = "center", hl = "special", text = "— " .. selected.author },
	}
end

local function separator()
	return {
		align = "center",
		padding = { 1, 1 },
		text = {
			{ string.rep("─", 36), hl = "dir" },
		},
	}
end

local function actions(dashboard)
	local text = {}

	for index, item in ipairs(dashboard.opts.preset.keys) do
		text[#text + 1] = { "[" .. item.key .. "]", hl = "key" }
		text[#text + 1] = {
			" " .. item.desc .. (index < #dashboard.opts.preset.keys and "   " or ""),
			hl = "desc",
		}
	end

	return { align = "center", text = text }
end

local function project_file(item)
	local root = Snacks.git.get_root(item.file)
	local path = root and vim.fs.relpath(root, item.file) or nil
	path = path or vim.fn.fnamemodify(item.file, ":~")

	local segments = vim.split(path, "/", { plain = true })
	if #segments > max_file_segments then
		path = table.concat(segments, "/", 1, 2) .. "/…/" .. table.concat(segments, "/", #segments - 1)
	end

	local directory, filename = path:match("^(.*)/(.+)$")
	if not directory then
		return { { path, hl = "file" } }
	end

	return {
		{ directory .. "/", hl = "dir" },
		{ filename, hl = "file" },
	}
end

local rendered_header = header()

return {
	enabled = true,
	formats = {
		file = project_file,
	},
	preset = {
		keys = action_keys,
	},
	sections = {
		{ header = rendered_header, padding = 1 },
		quote,
		separator,
		workspace,
		{ section = "keys" },
		{
			cwd = true,
			icon = " ",
			indent = 2,
			limit = 3,
			section = "recent_files",
			title = "Recent Files",
		},
		separator,
		actions,
	},
}
