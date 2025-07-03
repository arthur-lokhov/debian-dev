return {
	"williamboman/mason.nvim",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},
	build = ":MasonUpdate",
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_installation = false,
			automatic_enable = false,
			ensure_installed = {
				"lua_ls", -- Lua
				"gopls", -- Golang
				"templ", -- Go Templ
				-- "autotools_ls", -- Makefile
				"kotlin_lsp",
				"starpls", -- Bazel
				"bashls", -- Bash
				"html", -- HTML
				"cssls", -- CSS
				"tailwindcss", -- Tailwind CSS
				"dockerls", -- Docker
				"docker_compose_language_service", -- Docker Compose
				"helm_ls", -- Helm
				"graphql", -- GraphQL,
				"jsonls", -- JSON
				"lemminx", -- XML
				"yamlls", -- YAML
				"ts_ls", -- JS/TS,
				"vuels", -- Vue
				"svelte", -- Svelte
			}, -- Servers to install
		})

		-- Don't use formatter for Go
		mason_tool_installer.setup({
			automatic_installation = false,
			automatic_enable = false,
			ensure_installed = {
				"stylua", -- Lua formatter
			},
		})
	end,
}
