local name = {
	[[]],
	[[]],
	[[]],
	[[]],
	[[ $$$$$$\            $$\                               ]],
	[[$$  __$$\           $$ |                              ]],
	[[$$ /  \__| $$$$$$\  $$ | $$$$$$\  $$$$$$$\   $$$$$$\  ]],
	[[$$ |$$$$\ $$  __$$\ $$ | \____$$\ $$  __$$\ $$  __$$\ ]],
	[[$$ |\_$$ |$$ /  $$ |$$ | $$$$$$$ |$$ |  $$ |$$ /  $$ |]],
	[[$$ |  $$ |$$ |  $$ |$$ |$$  __$$ |$$ |  $$ |$$ |  $$ |]],
	[[\$$$$$$  |\$$$$$$  |$$ |\$$$$$$$ |$$ |  $$ |\$$$$$$$ |]],
	[[ \______/  \______/ \__| \_______|\__|  \__| \____$$ |]],
	[[                                            $$\   $$ |]],
	[[                                            \$$$$$$  |]],
	[[                                             \______/ ]],
	[[]],
	[[]],
}

return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.buttons.val = {
			dashboard.button("r", "󰦛 Restore session", "<cmd>SessionRestore<CR>"),
			dashboard.button(
				"s",
				"󱎰 Find session",
				'<cmd>lua require("auto-session.session-lens").search_session() <CR>'
			),
			dashboard.button("f", "󰱼  Find file", "<cmd>Telescope find_files<CR>"),
			dashboard.button("t", "󱎸 Find text", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("n", "󰈔 New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("o", "󱑒 Recently opened files", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("u", " Update Plugins", "<cmd>Lazy sync<CR>"),
			dashboard.button("q", " Quit", ":qa<CR>"),
		}

		dashboard.section.header.val = name
		dashboard.section.footer.val = "Arthur Lokhov"

		alpha.setup(dashboard.opts)

		vim.keymap.set("n", "<leader>;", ":Alpha<CR>", { desc = "Toggle Alpha", silent = true })
	end,
}
