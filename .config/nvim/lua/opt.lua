local opt = vim.opt

-- [[ Columns ]]
opt.number = true -- Display line numbers
opt.relativenumber = true -- Use relative numbers
opt.signcolumn = "yes:1" -- Keep signcolumn on by default

-- [[ Lines ]]
opt.list = false -- Turn off the display symbol mode
opt.linebreak = true -- Enable line breaks
opt.wrap = false -- Disable the wrap
opt.ruler = false -- Disable the ruler
opt.scrolloff = 3 -- Minimum number of lines when scrolling

-- [[ Indenting ]]
opt.tabstop = 4 -- Use 4 spaces for indent
opt.softtabstop = 4 -- Use 4 spaces for indent
opt.shiftwidth = 4 -- Use 4 spaces for indent
opt.expandtab = true -- Use spaces instead of tabs

-- [[ Highlighting ]]
opt.synmaxcol = 250 -- Maximum line length for syntax highlighting
opt.termguicolors = true -- Enable 24bit RGB color

-- [[ Encoding ]]
opt.encoding = "utf-8" -- Set the editor encoding to UTF-8
opt.fileencoding = "utf-8" -- Set the encoding for the files that will be saved
opt.fileencodings = { "ucs-bom", "utf-8", "cp936", "gb18030", "big5", "euc-jp", "euc-kr", "latin1" } -- Support for other encodings
opt.fileformats = { "unix", "dos" } -- Formats for new files

-- [[ Folds ]]
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- [[ Formating ]]
opt.formatoptions:append("mM") -- Auto-format for multi-byte characters

-- [[ Mouse ]]
opt.mouse = "" -- Disable the mouse
opt.mousemodel = "popup" -- Disable the mouse

-- [[ Searching ]]
opt.ignorecase = true -- Disable case-sensitive searching
opt.smartcase = true -- Disable case-sensitive searching
opt.wildignore:append {
  "*.o",
  "*.obj",
  "*.dylib",
  "*.bin",
  "*.dll",
  "*.exe", -- binary
  "*/.git/*",
  "*/.svn/*", -- folders
  "*.jpg",
  "*.png",
  "*.jpeg",
  "*.bmp",
  "*.gif",
  "*.tiff",
  "*.svg",
  "*.ico", -- media
} -- Ignore specific files and folders in global search
opt.wildignorecase = true -- Ignore case for wildignore

if vim.fn.executable("rg") == 1 then
  opt.grepprg = "rg --vimgrep --no-heading --smart-case"
  opt.grepformat = "%f:%l:%c:%m"
end -- External program for grep command

-- [[ Split ]]
opt.splitbelow = true -- Split windows by default at the bottom
opt.splitright = true -- Split windows by default at the right
opt.splitkeep = "screen" -- Remove flickering when splitting a window horizontally

-- [[ Chars ]]
opt.fillchars = {
  fold = " ",
  foldsep = " ",
  foldopen = "",
  foldclose = "",
  vert = "│",
  eob = " ",
  msgsep = "‾",
  diff = "╱",
} -- List of fillchars characters
opt.listchars = {
  tab = "▸ ",
  extends = "❯",
  precedes = "❮",
  nbsp = "␣",
} -- List of display characters
opt.tildeop = true -- Using the tilde (~) as an operator
opt.isfname:remove("=") -- Remove this character (=) from file name patterns
opt.isfname:remove(",") -- Remove this character (,) from file name patterns

-- [[ Clipboard ]]
if vim.fn.has("clipboard") == 1 then
  opt.clipboard:append("unnamedplus") -- Settings for working with the clipboard
end

-- [[ Diff ]]
opt.diffopt = {
  "vertical",
  "filler",
  "closeoff",
  "context:3",
  "internal",
  "indent-heuristic",
  "algorithm:histogram",
  "linematch:60",
}

-- [[ Swapfile ]]
opt.swapfile = false -- Disable the swap files

-- [[ Undofile ]]
opt.undofile = true -- Enable the undo files

-- [[ Shortmess ]]
opt.shortmess:append("c") -- Disable display of "match xx of xx" and other messages during auto-completion
opt.shortmess:append("S") -- Disable display of the number of matches during search
opt.shortmess:append("I") -- Disable the on-screen message at startup

-- [[ Backup ]]
opt.backupdir = vim.g.backupdir -- Backup folder
opt.backup = true -- Enable the backup
opt.backupcopy = "yes" -- Make a copy when saving a file
opt.backupskip = vim.opt.wildignore:get() -- Skipping backups for wildignore files

-- [[ Bell ]]
opt.visualbell = true -- Disabling sound and visual notifications
opt.errorbells = false -- Disabling sound and visual notifications

-- [[ Autocomplete ]]
opt.wildmode = "list:longest" -- Autocomplete behavior
opt.completeopt = "menuone,noselect" -- Better completion experience
opt.pumheight = 10 -- Maximum number of lines in the auto-completion window

-- [[ SpellCheck ]]
opt.spelllang = { "en" } -- Languages for spell checking
opt.spellsuggest = { 9 } -- Number of replacement options for spell checking

-- [[ Performance ]]
opt.updatetime = 50 -- Faster CursorHold events (default 4000ms)
opt.timeoutlen = 300 -- Faster key sequence timeout
opt.ttimeoutlen = 10 -- Faster key code timeout
opt.redrawtime = 1500 -- Time limit for syntax highlighting
opt.synmaxcol = 200 -- Limit syntax highlighting to 200 columns

-- [[ Memory ]]
opt.history = 100 -- Limit command history (default 1000)
opt.maxmempattern = 20000 -- Increase memory for pattern matching

-- [[ Misc. ]]
opt.laststatus = 3 -- option for statusline
opt.confirm = true -- Ask for confirmation when working with unsaved or read-only files
opt.showmode = false -- Disable display of current mode on command line
