return {
	"kevinhwang91/nvim-ufo",
	event = "VeryLazy",
	config = function()
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local foldedLines = endLnum - lnum
			local suffix = (" 󱞥 %d"):format(foldedLines)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0

			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
			suffix = (" "):rep(rAlignAppndx) .. suffix
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end

		require("ufo").setup({
			fold_virt_text_handler = handler,
			provider_selector = function(_, filetype, _)
				if filetype == "snacks_dashboard" then
					return ""
				end
				return { "treesitter", "indent" }
			end,
		})
		-- Folds mappings
		vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
	end,
}
