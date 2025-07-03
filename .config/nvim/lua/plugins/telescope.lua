return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false,
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	opts = {
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			get_selection_window = function()
				local wins = vim.api.nvim_list_wins()
				table.insert(wins, 1, vim.api.nvim_get_current_win())
				for _, win in ipairs(wins) do
					local buf = vim.api.nvim_win_get_buf(win)
					if vim.bo[buf].buftype == "" then
						return win
					end
				end
				return 0
			end,
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)

		telescope.load_extension("ui-select")
		telescope.load_extension("fzf")
		-- telescope.load_extension("yaml_schema")
		telescope.load_extension("notify")
	end,
}
