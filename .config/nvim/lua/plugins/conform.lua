return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
		},
		format_on_save = { async = false, timeout_ms = 500, lsp_fallback = true },
	},
}
