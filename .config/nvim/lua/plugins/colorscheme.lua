return {
    "folke/tokyonight.nvim",
	priority = 1000,
    opts = {
        style = "night",
        transparent = vim.g.transparent_enabled,
        terminal_colors = true,
		styles = {
			comments = { italic = false },
			keywords = { italic = false },
		},
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd([[colorscheme tokyonight]])
    end,
}
