return {
	{
		"mbbill/undotree",
		event = "VeryLazy",
		config = function() end,
	},
	{
		"tzachar/highlight-undo.nvim",
		event = "VeryLazy",
		config = function()
			require("highlight-undo").setup()
		end,
	},
}
