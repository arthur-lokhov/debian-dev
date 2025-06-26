-- This is my personal NeoVim configuration supporting Linux, and maybe Windows and Mac, with various plugins configured.
-- This configuration evolves as I learn more about NeoVim and become more proficient in using NeoVim.
-- I would not recommend cloning this configuration and replace your own config. Good configuration are personal, build over time with a lot of polish
--
-- Author: Arthur Lokhov
-- Email: arthurlokhov@gmail.com
-- GitHub: https://github.com/arthur-lokhov

-- Enable Neovim's built-in bytecode cache for faster startup
if vim.loader then
  vim.loader.enable()
end

-- Compare the actual and expected versions
local expected_version = "0.11.2"
require("utils").is_compatible_version(expected_version)

require("g")

require("opt")

require("plugins-loader")
