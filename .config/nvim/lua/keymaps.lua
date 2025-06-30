local keymap = vim.keymap.set

-- Quit
keymap("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Lazy
keymap("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Oil
keymap("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

-- Better Up & Down
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Buffers
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
keymap("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
keymap("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Telescope
keymap("n", "<leader>:", "<cmd>Telescope command_history<cr>", { desc = "Command History" })
keymap("n", "<leader>fy", "<cmd>Telescope yaml_schema<cr>", { desc = "YAML Schemas" })
-- find
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find File" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
keymap(
	"n",
	"<leader>fb",
	"<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>",
	{ desc = "Buffers" }
)
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent Files" })
-- git
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits" })
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
-- search
keymap("n", '<leader>s"', "<cmd>Telescope registers<cr>", { desc = "Registers" })
keymap("n", "<leader>sa", "<cmd>Telescope autocommands<cr>", { desc = "Autocommands" })
keymap("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Buffers" })
keymap("n", "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Diagnostics" })
keymap("n", "<leader>sD", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
keymap("n", "<leader>sH", "<cmd>Telescope highlights<cr>", { desc = "Highlights" })
keymap("n", "<leader>sj", "<cmd>Telescope jumplist<cr>", { desc = "Jumplist" })
keymap("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
keymap("n", "<leader>sl", "<cmd>Telescope loclist<cr>", { desc = "Loclist" })
keymap("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
keymap("n", "<leader>sm", "<cmd>Telescope marks<cr>", { desc = "Marks" })
keymap("n", "<leader>sq", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix" })
keymap("n", "<leader>ss", "<cmd>Namu symbols<cr>", {
	desc = "Jump to LSP symbol",
	silent = true,
})
keymap("n", "<leader>sS", function()
	require("auto-session.session-lens").search_session({})
end, { desc = "Search Session" })

-- Diagnostics
local diagnostic_goto = function(next, severity)
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		vim.diagnostic.jump({
			count = next and 1 or -1,
			float = true,
			severity = severity,
		})
	end
end
keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
keymap("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
keymap("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
keymap("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
keymap("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
keymap("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Trouble for diagnostics
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
keymap("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List" })
keymap("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List" })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local opts = { buffer = bufnr, remap = false }

		keymap(
			"n",
			"<leader>ca",
			"<cmd>lua require('actions-preview').code_actions()<cr>",
			vim.tbl_extend("force", opts, { desc = "Code action" })
		)
		keymap("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
		keymap("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
		keymap("n", "gK", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))
		keymap("n", "<c-k>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))
		keymap("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Definition" }))
		keymap("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Declaration" }))
		keymap("n", "gI", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Implementation" }))
		keymap("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
	end,
})

-- Preview for goto
keymap("n", "<leader>pd", function()
	require("goto-preview").goto_preview_definition({})
end, { desc = "Preview Definition", silent = true })
keymap("n", "<leader>pt", function()
	require("goto-preview").goto_preview_type_definition({})
end, { desc = "Preview Type Definition", silent = true })
keymap("n", "<leader>pi", function()
	require("goto-preview").goto_preview_implementation({})
end, { desc = "Preview Implementation", silent = true })
keymap("n", "<leader>pr", function()
	require("goto-preview").goto_preview_references({})
end, { desc = "Preview References", silent = true })
keymap("n", "<leader>ps", function()
	require("goto-preview").goto_preview_declaration({})
end, { desc = "Preview References", silent = true })
keymap("n", "<leader>pc", function()
	require("goto-preview").close_all_win({})
end, { desc = "Close Previews", silent = true })

-- Inlay hints
keymap("n", "<leader>ch", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
	vim.lsp.inlay_hint.enable(not enabled)
end, { desc = "Toggle Inlay Hints" })

-- Search with `n` and `N` by default
keymap("n", "<leader>n", "<cmd>nohl<cr>", { desc = "No HLS", silent = true })
keymap(
	"n",
	"n",
	[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
	{ desc = "Next search result", silent = true }
)
keymap(
	"n",
	"N",
	[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
	{ desc = "Previous search result", silent = true }
)
keymap(
	"n",
	"*",
	[[*<Cmd>lua require('hlslens').start()<CR>]],
	{ desc = "Next Search Result Highlighted", silent = true }
)
keymap(
	"n",
	"#",
	[[#<Cmd>lua require('hlslens').start()<CR>]],
	{ desc = "Previous Search Result Highlighted", silent = true }
)

-- Flash
local flash = require("flash")
keymap({ "n", "x", "o" }, "s", flash.jump, { desc = "Flash" })
keymap({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash Treesitter" })
keymap("o", "r", flash.remote, { desc = "Remote Flash" })
keymap({ "o", "x" }, "R", flash.treesitter_search, { desc = "Treesitter Search" })
keymap("c", "<C-s>", flash.toggle, { desc = "Toggle Flash Search" })

-- Git
keymap("n", "<leader>go", "<cmd>Neogit<cr>", { desc = "Git client" })

local gs = require("gitsigns")
keymap({ "n", "v" }, "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
keymap({ "n", "v" }, "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
keymap("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer" })
keymap("n", "<leader>ghu", gs.undo_stage_hunk)
keymap("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer" })
keymap("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview Hunk" })
keymap("n", "<leader>ghb", function()
	gs.blame_line({ full = true })
end, { desc = "Blame" })
keymap("n", "<leader>gtB", gs.toggle_current_line_blame, { desc = "Toggle Blame" })
keymap("n", "<leader>ghd", gs.diffthis, { desc = "Diff" })
keymap("n", "<leader>ghD", function()
	gs.diffthis("~")
end, { desc = "Diff with Previous" })
