local api = vim.api
local fn = vim.fn

local utils = require("utils")

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#3d59a1", fg = "#c0caf5" })

-- Highlight yanked region
local yank_group = api.nvim_create_augroup("highlight_yank", { clear = true })
api.nvim_create_autocmd({ "TextYankPost" }, {
  pattern = "*",
  group = yank_group,
  callback = function()
    vim.highlight.on_yank {
      higroup = "YankHighlight",
      timeout = 300,
    }
  end,
})

-- Auto-create directory when saving a file, in case directory does not exist
local auto_create_dir_group = api.nvim_create_augroup("auto_create_dir", { clear = true })
api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*",
  group = auto_create_dir_group,
  callback = function(ctx)
    local dir = fn.fnamemodify(ctx.file, ":p:h")
    if dir:match("^oil:") then -- Oil file manager exclude
      return
    end
    utils.may_create_dir(dir)
  end,
})

-- Display a message when the current file is not in utf-8 format.
local non_utf8_file_group = api.nvim_create_augroup("non_utf8_file", { clear = true })
api.nvim_create_autocmd({ "BufRead" }, {
  pattern = "*",
  group = non_utf8_file_group,
  callback = function()
    if vim.bo.fileencoding ~= "utf-8" then
      vim.notify("File not in UTF-8 format!", vim.log.levels.WARN, { title = "nvim-config" })
    end
  end,
})

-- Automatically reload the file if it is changed outside of NeoVim.
local auto_read_group = api.nvim_create_augroup("auto_read", { clear = true })
api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = "*",
  group = auto_read_group,
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded!", vim.log.levels.WARN, { title = "nvim-config" })
  end,
})

api.nvim_create_autocmd({ "FocusGained", "CursorHold" }, {
  pattern = "*",
  group = auto_read_group,
  callback = function()
    if fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})

-- Resize all windows when we resize the terminal
local win_autoresize_group = api.nvim_create_augroup("win_autoresize", { clear = true })
api.nvim_create_autocmd("VimResized", {
  group = win_autoresize_group,
  desc = "autoresize windows on resizing operation",
  command = "wincmd =",
})

-- Do not use smart case in command line mode
local dynamic_smartcase_group = api.nvim_create_augroup("dynamic_smartcase", { clear = true })
api.nvim_create_autocmd("CmdLineEnter", {
  group = dynamic_smartcase_group,
  pattern = ":",
  callback = function()
    vim.o.smartcase = false
  end,
})

api.nvim_create_autocmd("CmdLineLeave", {
  group = dynamic_smartcase_group,
  pattern = ":",
  callback = function()
    vim.o.smartcase = true
  end,
})

-- Return to last cursor position when opening a file
local resume_cursor_position_group = api.nvim_create_augroup("resume_cursor_position", { clear = true })
api.nvim_create_autocmd("FileType", {
  group = resume_cursor_position_group,
  pattern = "*",
  callback = function(ev)
    local mark_pos = api.nvim_buf_get_mark(ev.buf, '"')
    local last_cursor_line = mark_pos[1]

    local max_line = vim.fn.line("$")
    local buf_filetype = api.nvim_get_option_value("filetype", { buf = ev.buf })
    local buftype = api.nvim_get_option_value("buftype", { buf = ev.buf })

    if buf_filetype == "" or buftype ~= "" then
      return
    end

    if vim.fn.match(vim.v.argv, [[\v^\+(\d){1,}$]]) ~= -1 then
      return
    end

    if last_cursor_line > 1 and last_cursor_line <= max_line then
      vim.schedule(function()
        local status, result = pcall(api.nvim_win_set_cursor, 0, mark_pos)
        if not status then
          api.nvim_err_writeln(
            string.format("Failed to resume cursor position. Context %s, error: %s", vim.inspect(ev), result)
          )
        end
      end)
    end
  end,
})
