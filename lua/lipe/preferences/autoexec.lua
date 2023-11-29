-- This file will always run on startup
-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Cmd commands
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- Disable command line history
vim.cmd [[nnoremap q: <nop>]]

-- Remap capital wq's to wq
vim.cmd [[command! W w]]
vim.cmd [[command! WQ wq]]
vim.cmd [[command! Wq wq]]
vim.cmd [[command! WA wa]]
vim.cmd [[command! Wa wa]]
vim.cmd [[command! WQA wqa]]
vim.cmd [[command! WQa wqa]]
vim.cmd [[command! Wqa wqa]]

-- Remove Windows Carriage Return
vim.cmd [[command! rwcr s///g]]

-- Custom commands
vim.api.nvim_create_user_command("Update", function()
  vim.cmd [[MasonUpdate]]
  vim.cmd [[TSUpdate]]
  vim.cmd [[UpdateRemotePlugins]]
end, {})

vim.api.nvim_create_user_command("Reload", function ()
  vim.cmd [[LspRestart]]
end, {})
