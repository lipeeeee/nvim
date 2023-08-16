USR = "lipe"

-- Globals
require(USR .. ".globals")

-- Preferences
require(USR .. ".preferences")

-- Plugins
-- Setup lazy first..
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
require("lazy").setup({{import = "lipe.plugins"}})

-- Completion
require(USR .. ".cmp")

-- LSP
require(USR .. ".lsp")
