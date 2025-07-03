local g = vim.g
local fn = vim.fn

local utils = require("utils")

-- [[ Transparency ]]
g.transparent_enabled = true

-- [[ OS Detection ]]
g.is_win = (utils.has("win32") or utils.has("win64")) and true or false
g.is_linux = (utils.has("unix") and (not utils.has("macunix"))) and true or false
g.is_mac = utils.has("macunix") or true and false

-- [[ Default language ]]
vim.cmd([[language en_US.UTF-8]])

-- [[ Map leader ]]
g.mapleader = ","
g.maplocalleader = ","

-- [[ Backup ]]
g.backupdir = fn.expand(fn.stdpath("data") .. "/backup//")

-- [[ Providers ]]
g.loaded_perl_provider = 0 -- Disable perl provider
g.loaded_ruby_provider = 0 -- Disable ruby provider
g.loaded_node_provider = 0 -- Disable node provider

if utils.executable("python3") then
	if g.is_win then
		g.python3_host_prog = fn.substitute(fn.exepath("python3"), ".exe$", "", "g")
	else
		g.python3_host_prog = fn.exepath("python3")
	end
else
	vim.api.nvim_echo({
		{ "Python3 executable not found! You must install Python3 and set its PATH correctly!", "ErrorMsg" },
	}, true, {})

	return
end

-- [[ Disable some built-in plugins for speed ]]
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_spellfile_plugin = 1
