return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"aznhe21/actions-preview.nvim",
			config = function()
				require("goto-preview").setup()
			end,
		},
		"rmagatti/goto-preview",
		{
			-- extended lua support
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					{ path = "snacks.nvim", words = { "Snacks" } },
				},
			},
		},
	},
	config = function()
		vim.lsp.inlay_hint.enable(true)
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("kotlin_lsp")

		-- Golang
		vim.lsp.config.gopls = {
			settings = {
				gopls = {
					completeUnimported = true, -- suggest the unimported packages
					usePlaceholders = true, -- add placeholders for args and return values
					staticcheck = true, -- staticcheck.io support
					semanticTokens = true, -- add semantic highlight
					directoryFilters = {
						"-.git",
						"-.vscode",
						"-.idea",
						"-.vscode-test",
						"-node_modules",
					},

					-- Inlay hints
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},

					-- Code analyses
					analyses = {
						unusedparams = true,
						unusedwrite = true,
						unusedvariable = true,
						nilness = true,
						fieldalignment = false,
						shadow = false,
						useany = true,
						ST1000 = false, -- disable "incorrent package comment"
					},
				},
			},
		}
		vim.lsp.enable("gopls")
	end,
}
