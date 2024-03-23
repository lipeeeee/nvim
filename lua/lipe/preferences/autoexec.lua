-- This file will always run on startup
-- Disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Cmd commands
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- Disable command line history
vim.cmd [[nnoremap q: <nop>]]

-- Disable mouse
vim.cmd [[set mouse=]]

-- Remap capital wq's to wq
vim.cmd [[command! W w]]
vim.cmd [[command! WQ wq]]
vim.cmd [[command! Wq wq]]
vim.cmd [[command! WA wa]]
vim.cmd [[command! Wa wa]]
vim.cmd [[command! WQA wqa]]
vim.cmd [[command! WQa wqa]]
vim.cmd [[command! Wqa wqa]]
vim.cmd [[command! Q q]]

-- Netrw usage tweaks
vim.cmd [[ au FileType netrw nmap <buffer> h -<esc>]]
vim.cmd [[ au FileType netrw nmap <buffer> l <CR>]]
  vim.cmd [[ au FileType netrw nmap <buffer> q :bd<CR>]]

-- Custom commands
vim.api.nvim_create_user_command("Update", function()
  vim.cmd [[MasonUpdate]]
  vim.cmd [[TSUpdate]]
  vim.cmd [[UpdateRemotePlugins]]
end, {})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

vim.api.nvim_create_user_command("Reload", function()
  vim.cmd [[LspRestart]]
end, {})
