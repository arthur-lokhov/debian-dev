local map = vim.keymap.set

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Oil
map("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

-- Better Up & Down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Save key strokes
map({ "n", "x" }, ";", ":", { desc = "Save key strokes" })

-- Continuous visual shifting to reselect previous visual area
map("x", "<", "<gv", { desc = "Visual shifting to left side" })
map("x", ">", ">gv", { desc = "Visual shiftint to right side" })

-- Move current line up and down
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move current line up" })
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move current line down" })

-- Always use very magic mode for searching
map("n", "/", [[/\v]], { desc = "Searching with very magic mode" })

-- Copy entire buffer
map("n", "<leader>y", "<cmd>%yank<cr>", { desc = "Yank entire buffer" })

-- Window with Tmux integration
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Go to Right Window", remap = true })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Telescope
map("n", "<leader>:", "<cmd>Telescope command_history<cr>", { desc = "Command History" })
map("n", "<leader>fy", "<cmd>Telescope yaml_schema<cr>", { desc = "YAML Schemas" })
-- find
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find File" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map(
	"n",
	"<leader>fb",
	"<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>",
	{ desc = "Buffers" }
)
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent Files" })
-- git
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
-- search
map("n", '<leader>s"', "<cmd>Telescope registers<cr>", { desc = "Registers" })
map("n", "<leader>sa", "<cmd>Telescope autocommands<cr>", { desc = "Autocommands" })
map("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Buffers" })
map("n", "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Diagnostics" })
map("n", "<leader>sD", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
map("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
map("n", "<leader>sH", "<cmd>Telescope highlights<cr>", { desc = "Highlights" })
map("n", "<leader>sj", "<cmd>Telescope jumplist<cr>", { desc = "Jumplist" })
map("n", "<leader>sk", "<cmd>Telescope maps<cr>", { desc = "Keymaps" })
map("n", "<leader>sl", "<cmd>Telescope loclist<cr>", { desc = "Loclist" })
map("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
map("n", "<leader>sm", "<cmd>Telescope marks<cr>", { desc = "Marks" })
map("n", "<leader>sq", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix" })
map("n", "<leader>ss", "<cmd>Namu symbols<cr>", {
	desc = "Jump to LSP symbol",
	silent = true,
})
map("n", "<leader>sS", function()
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
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Trouble for diagnostics
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List" })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local opts = { buffer = bufnr, remap = false }

		map(
			"n",
			"<leader>ca",
			"<cmd>lua require('actions-preview').code_actions()<cr>",
			vim.tbl_extend("force", opts, { desc = "Code action" })
		)
		map("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
		map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
		map("n", "gK", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))
		map("n", "<c-k>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))
		map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Definition" }))
		map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Declaration" }))
		map("n", "gI", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Implementation" }))
		map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
	end,
})

-- Preview for goto
map("n", "<leader>pd", function()
	require("goto-preview").goto_preview_definition({})
end, { desc = "Preview Definition", silent = true })
map("n", "<leader>pt", function()
	require("goto-preview").goto_preview_type_definition({})
end, { desc = "Preview Type Definition", silent = true })
map("n", "<leader>pi", function()
	require("goto-preview").goto_preview_implementation({})
end, { desc = "Preview Implementation", silent = true })
map("n", "<leader>pr", function()
	require("goto-preview").goto_preview_references({})
end, { desc = "Preview References", silent = true })
map("n", "<leader>ps", function()
	require("goto-preview").goto_preview_declaration({})
end, { desc = "Preview References", silent = true })
map("n", "<leader>pc", function()
	require("goto-preview").close_all_win({})
end, { desc = "Close Previews", silent = true })

-- Inlay hints
map("n", "<leader>ch", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
	vim.lsp.inlay_hint.enable(not enabled)
end, { desc = "Toggle Inlay Hints" })

-- Search with `n` and `N` by default
map("n", "<leader>n", "<cmd>nohl<cr>", { desc = "No HLS", silent = true })
map(
	"n",
	"n",
	[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
	{ desc = "Next search result", silent = true }
)
map(
	"n",
	"N",
	[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
	{ desc = "Previous search result", silent = true }
)
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { desc = "Next Search Result Highlighted", silent = true })
map(
	"n",
	"#",
	[[#<Cmd>lua require('hlslens').start()<CR>]],
	{ desc = "Previous Search Result Highlighted", silent = true }
)

-- Paste image to markdown
map("n", "<leader>up", "<cmd>PasteImage<cr>", { desc = "Paste image from system clipboard" })

-- Undo
map("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })

-- Flash
local flash = require("flash")
map({ "n", "x", "o" }, "s", flash.jump, { desc = "Flash" })
map({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash Treesitter" })
map("o", "r", flash.remote, { desc = "Remote Flash" })
map({ "o", "x" }, "R", flash.treesitter_search, { desc = "Treesitter Search" })
map("c", "<C-s>", flash.toggle, { desc = "Toggle Flash Search" })

-- Find and Replace
map("n", "<leader>sr", function()
	require("grug-far").open()
end, { desc = "Search with Replace" })

-- Git
map("n", "<leader>go", "<cmd>Neogit<cr>", { desc = "Git client" })

local gs = require("gitsigns")
map({ "n", "v" }, "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
map({ "n", "v" }, "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
map("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer" })
map("n", "<leader>ghu", gs.undo_stage_hunk)
map("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer" })
map("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview Hunk" })
map("n", "<leader>ghb", function()
	gs.blame_line({ full = true })
end, { desc = "Blame" })
map("n", "<leader>gtB", gs.toggle_current_line_blame, { desc = "Toggle Blame" })
map("n", "<leader>ghd", gs.diffthis, { desc = "Diff" })
map("n", "<leader>ghD", function()
	gs.diffthis("~")
end, { desc = "Diff with Previous" })
