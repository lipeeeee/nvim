-- This file works as "kernel" of config
-- Get environment to use
local function get_environment()
  local environment_file_exists = require("shared.utils.io").file_exists(ENVIRONMENT_FILE)

  if not environment_file_exists then
    require("shared.utils.io").create_file(ENVIRONMENT_FILE, DEFAULT_ENV)
  end

  return require("shared.utils.io").read_file_data(ENVIRONMENT_FILE)
end

-- Initializes core of config
local function init_core()
  -- Shared globals
  require("shared.globals")

  -- Save start time
  NVIM_START_TIME = require("shared.utils.time").get_current_time_info()

  -- Get environment to use
  NVIM_ENVIRONMENT = get_environment()
end

-- Initialize config environment
local function init_environment()
  -- Environment globals
  require(NVIM_ENVIRONMENT .. ".globals")

  -- Options
  require(NVIM_ENVIRONMENT .. ".preferences.options")

  -- AutoExec
  require(NVIM_ENVIRONMENT .. ".preferences.autoexec")

  -- Remaps
  require(NVIM_ENVIRONMENT .. ".preferences.remaps")
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
  local plugin_source = require(NVIM_ENVIRONMENT .. ".plugins.sources")

  require("lazy").setup(plugin_source)
end

init_core()
init_environment()
bootstrap_lazy()
require(NVIM_ENVIRONMENT .. ".post_load") -- Customization file for each env if necessary
