return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			on_open = function(win)
				local buf = vim.api.nvim_win_get_buf(win)
				local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
				for _, line in ipairs(lines) do
					if line:match("No information available") then
						vim.api.nvim_win_close(win, true)
						return
					end
				end
			end,
			stages = "fade_in_slide_out",
			timeout = 1500,
			background_colour = "#000000",
		})
	end,
}
