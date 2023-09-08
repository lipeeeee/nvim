USR = "lipe"
START_TIME = require(USR .. ".utils").GET_CURRENT_TIME_INFO()
math.randomseed(START_TIME.os_time)

-- Globals
require(USR .. ".globals")

-- Preferences
require(USR .. ".preferences")

-- Plugins
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
require("lazy").setup({
  { import = USR .. ".plugins.core" },
  { import = USR .. ".plugins.lsp" },
  { import = USR .. ".plugins.ui" }
})

-- After plugin setup..
-- Set colorscheme, & keymaps(requires which-key)
require(USR .. ".preferences.colorscheme")
require(USR .. ".preferences.keymaps")
