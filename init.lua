-- This file works as "kernel" of config
-- Initialize config environment
local function init_environment()
  -- Save start time
  NVIM_START_TIME = require("lipe.utils.time").get_current_time_info()

  -- Initialize globals
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
  local plugin_source = {
    { import = "lipe.plugins.core" },
    { import = "lipe.plugins.lsp" },
    { import = "lipe.plugins.ui" },
    { import = "lipe.plugins.git" },
  }

  require("lazy").setup(plugin_source)
end

-- Post plugin processing
local function post_plugin_processing()
  -- Colorscheme
  require("lipe.preferences.colorscheme")
end

init_environment()
bootstrap_lazy()
post_plugin_processing()
