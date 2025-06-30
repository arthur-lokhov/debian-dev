return {
	-- Highly recommend to use Pro version
	"supermaven-inc/supermaven-nvim",
	opts = {
		keymaps = {
			accept_suggestion = "<Tab>",
			clear_suggestion = "<C-]>",
		},
		log_level = "info",
		disable_inline_completion = false, -- for compatible with cmp
		disable_keymaps = false, -- disable builtin keymaps
	},
}
