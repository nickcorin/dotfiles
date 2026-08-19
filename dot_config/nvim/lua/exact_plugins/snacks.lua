local dashboard = require("config.dashboard")

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		-- Explorer.
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer.",
		},
		-- Find.
		{
			"<leader><leader>",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers (Alias)",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.zoxide()
			end,
			desc = "Projects (zoxide)",
		},
		-- Git.
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gi",
			function()
				Snacks.picker.gh_issue()
			end,
			desc = "Git: Browse Issues (open)",
		},
		{
			"<leader>gI",
			function()
				Snacks.picker.gh_issue({ state = "all" })
			end,
			desc = "Git: Browse Issues (all)",
		},
		-- LSP
		{
			"<leader>ca",
			function()
				vim.lsp.buf.code_action()
			end,
			desc = "Code Actions",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		-- Search.
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},

		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
	},
	opts = {
		dashboard = dashboard,
		explorer = {
			enabled = true,
			replace_netrw = true,
			trash = true,
		},
		indent = {
			animate = {
				enabled = false,
			},
			chunk = {
				enabled = false,
			},
			indent = {
				enabled = true,
				char = "┆",
			},
			scope = {
				enabled = true,
				char = "┆",
				underline = true,
			},
		},
		notifier = {
			enabled = true,
			style = "fancy",
			timeout = 5000,
			top_down = true,
		},
		picker = {
			sources = {
				explorer = {
					diagnostics_open = true,
					git_status_open = true,
					hidden = true,
					ignored = true,
					layout = {
						layout = { position = "right" },
						preset = "sidebar",
						preview = false,
					},
				},
			},
		},
		statuscolumn = {
			enabled = true,
		},
		styles = {
			dashboard = {
				wo = {
					wrap = true,
				},
			},
			notification = {
				wo = {
					wrap = true,
				},
			},
		},
	},
}
