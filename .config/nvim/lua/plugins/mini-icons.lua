return {
	"echasnovski/mini.icons",
	lazy = true,
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
	config = function()
		require("mini.icons").setup({
			file = {
				[".keep"] = { glyph = "", hl = "MiniIconsGrey" },
				["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
				["go.mod"] = { glyph = "", hl = "MiniIconsBlue" },
				["go.sum"] = { glyph = "", hl = "MiniIconsBlue" },
				[".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
				[".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
				[".node-version"] = { glyph = "", hl = "MiniIconsGreen" },
				[".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
				[".yarnrc.yml"] = { glyph = "", hl = "MiniIconsBlue" },
				["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
				["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
				["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
				["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" },
				["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
				markdown = { glyph = "", hl = "MiniIconsBlue" },
				sql = { glyph = "󰆼", hl = "MiniIconsRed" },
				go = { glyph = "", hl = "MiniIconsBlue" },
				javascript = { glyph = "", hl = "MiniIconsYellow" },
				typescript = { glyph = "", hl = "MiniIconsBlue" },
			},
		})
	end,
}
