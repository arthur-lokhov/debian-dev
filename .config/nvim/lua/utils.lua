local fn = vim.fn
local version = vim.version

local M = {}

-- Check if the name exists in executables
-- @param name string
-- @return boolean
function M.executable(name)
  if fn.executable(name) > 0 then
    return true
  end

  return false
end

-- Check whether a feature exists in NeoVim
-- @param feat string
-- @return boolean
function M.has(feat)
  if fn.has(feat) == 1 then
    return true
  end

  return false
end

-- Create a dir if does not exist
-- @param dir string
function M.may_create_dir(dir)
  local res = fn.isdirectory(dir)

  if res == 0 then
    fn.mkdir(dir, "p")
  end
end

-- Check if the current NeoVim version is compatible with the allowed version
-- @param expected_version string
-- @return boolean
function M.is_compatible_version(expected_version)
  local expect_ver = version.parse(expected_version)
  local actual_ver = version()

  if expect_ver == nil then
    local msg = string.format("Unsupported version string: %s", expected_version)
    vim.api.nvim_err_writeln(msg)
    return false
  end

  local result = version.cmp(expect_ver, actual_ver)
  if result ~= 0 then
    local _ver = string.format("%s.%s.%s", actual_ver.major, actual_ver.minor, actual_ver.patch)
    local msg = string.format(
      "Expect neovim version %s, but your current neovim version is %s. Use at your own risk.",
      expected_version,
      _ver
    )
    vim.api.nvim_err_writeln(msg)
  end

  return true
end

return M
