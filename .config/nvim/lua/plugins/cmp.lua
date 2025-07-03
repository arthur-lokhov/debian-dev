return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
			event = "BufReadPost",
		},
		{
			-- snippets
			"L3MON4D3/LuaSnip",
			lazy = true,
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
		},
		"hrsh7th/cmp-nvim-lsp-signature-help",
		{
			"hrsh7th/cmp-cmdline",
			event = "CmdlineEnter",
			config = function()
				local cmp = require("cmp")
				cmp.setup.cmdline({ "/", "?" }, {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "buffer" },
					},
				})

				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = "path" },
					}, {
						{ name = "cmdline" },
					}),
				})
			end,
		},
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"onsails/lspkind-nvim",
	},
	config = function()
		local cmp = require("cmp")

		vim.api.nvim_create_autocmd("InsertEnter", {
			callback = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
			once = true,
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = {
					border = "rounded",
					scrollbar = false,
					winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
				},
				documentation = {
					border = "rounded",
					scrollbar = false,
					winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "lazydev" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "path" },
			}, {
				{ name = "buffer", keyword_length = 3 },
			}),
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					show_labelDetails = true,
					maxwidth = 50,
					ellipsis_char = "...",
					before = function(_, vim_item)
						return vim_item
					end,
				}),
			},
		})
	end,
}
