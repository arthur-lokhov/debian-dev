return {
	"xiyaowong/transparent.nvim",
	opts = {
		groups = {
			"Normal",
			"NormalNC",
			"Comment",
			"Constant",
			"Special",
			"Identifier",
			"Statement",
			"PreProc",
			"Type",
			"Underlined",
			"Todo",
			"String",
			"Function",
			"Conditional",
			"Repeat",
			"Operator",
			"Structure",
			"LineNr",
			"NonText",
			"SignColumn",
			"CursorLine",
			"CursorLineNr",
			"StatusLine",
			"StatusLineNC",
			"EndOfBuffer",
		},
	},
	config = function(_, opts)
		local transparent = require("transparent")
		transparent.setup(opts)
		transparent.clear_prefix("NormalFloat")
		transparent.clear_prefix("Float")
		transparent.clear_prefix("BufferLine")
		transparent.clear_prefix("TabLine")
		transparent.clear_prefix("Telescope")
		transparent.clear_prefix("Snacks")
		transparent.clear_prefix("Trouble")
		transparent.clear_prefix("Noice")
	end,
}
