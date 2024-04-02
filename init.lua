-- This file works as "kernel" of config
-- Initialize config environment
local function init_environment()
  -- Shared globals
  require("shared.globals")

  -- Save start time
  NVIM_START_TIME = require("shared.utils.time").get_current_time_info()

  -- Environment globals
  require("lipe.globals")

  -- Options
  require("lipe.preferences.options")

  -- AutoExec
  require("lipe.preferences.autoexec")

  -- Remaps
  require("lipe.preferences.remaps")
end

-- Attatch lazy.nvim package manager to nvim
local function bootstrap_lazy()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- Where to look for plugins
  local plugin_source = require("lipe.plugins.sources")

  require("lazy").setup(plugin_source)
end

-- Get environment to use
local function get_environment()
  local environment_file_exists = require("shared.utils.io").file_exists(ENVIRONMENT_FILE)

  if not environment_file_exists then
    require("shared.utils.io").create_file(ENVIRONMENT_FILE, DEFAULT_ENV)
  end

  return "x"
end

init_environment()
bootstrap_lazy()
-- Customization file for each env if necessary
require("lipe.plugins.customize")
get_environment()
