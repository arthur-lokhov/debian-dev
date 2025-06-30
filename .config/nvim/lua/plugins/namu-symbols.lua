return {
	"bassamsdata/namu.nvim",
	opts = {
		namu_symbols = {
			enable = true,
			options = {},
		},
	},
	config = function(_, opts)
		require("namu").setup(opts)
	end,
}
