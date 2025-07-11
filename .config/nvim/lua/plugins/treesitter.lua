return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"html",
			},
			ignore_install = {},
			modules = {},
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				indent = { enable = true },
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			textobjects = {
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					-- goto next end
					goto_next_end = {
						["]M"] = "@function.outer",
						["]C"] = "@class.outer",
					},
				},
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["am"] = "@function.outer",
						["im"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						["ib"] = "@block.inner",
						["ab"] = "@block.outer",
						["iP"] = "@parameter.inner",
						["aP"] = "@parameter.outer",
					},
				},
			},
		})
	end,
}
