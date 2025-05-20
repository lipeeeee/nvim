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
vim.cmd [[command! Qa qa]]

-- Netrw usage tweaks
vim.cmd [[ au FileType netrw nmap <buffer> h -<esc>]]
vim.cmd [[ au FileType netrw nmap <buffer> l <CR>]]
vim.cmd [[ au FileType netrw nmap <buffer> q :bd<CR>]]

-- Fugitive usage tweaks
vim.cmd [[ au FileType fugitive nmap <buffer> q :bd<CR>]]

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

-- Quickfix list 
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    -- “L” opens the selected entry in the parent window but keeps focus on qf
    vim.keymap.set("n", "l", function()
      local qf_win = vim.api.nvim_get_current_win()
      local idx    = vim.fn.line(".")
      local item   = vim.fn.getqflist()[idx]
      if not item then return end
      local filename = item.filename or (item.bufnr > 0 and vim.api.nvim_buf_get_name(item.bufnr))
      if not filename or filename == "" then return end

      -- switch to previous window, open file there
      vim.cmd("wincmd p")
      if item.bufnr and vim.api.nvim_buf_is_loaded(item.bufnr) then
        vim.cmd("buffer " .. item.bufnr)
      else
        vim.cmd("edit " .. vim.fn.fnameescape(filename))
        if item.lnum then
          vim.api.nvim_win_set_cursor(0, { item.lnum, (item.col or 1) - 1 })
        end
      end

      -- come back to quickfix
      vim.api.nvim_set_current_win(qf_win)
    end, { buffer = true, silent = true })

    -- “h” removes the current entry from the quickfix list
    vim.keymap.set("n", "h", function()
      local idx = vim.fn.line(".")
      local qfl = vim.fn.getqflist()
      if idx < 1 or idx > #qfl then return end

      -- remove that entry
      table.remove(qfl, idx)
      vim.fn.setqflist(qfl, "r")

      -- if list is now empty, close qf; else re-position cursor
      if #qfl == 0 then
        vim.cmd("cclose")
        return
      end

      local new_idx = idx
      if new_idx > #qfl then
        new_idx = #qfl
      end
      vim.api.nvim_win_set_cursor(0, { new_idx, 0 })
    end, { buffer = true, silent = true })
  end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "qf",
--   callback = function()
--     vim.keymap.set('n', 'l', function()
--       local qf_win = vim.api.nvim_get_current_win()
--       local idx    = vim.fn.line('.')           -- current qf line
--       local item   = vim.fn.getqflist()[idx]     -- {filename, bufnr, lnum, col, …}
--       vim.notify(item)
--
--       if not item or not item.filename then
--         return
--       end
--
--       -- Jump to previous (parent) window
--       vim.cmd('wincmd p')
--
--       -- Open the buffer (or file) in that window
--       if item.bufnr and vim.api.nvim_buf_is_loaded(item.bufnr) then
--         vim.cmd('buffer ' .. item.bufnr)
--       else
--         vim.cmd('edit ' .. vim.fn.fnameescape(item.filename))
--         if item.lnum then
--           vim.api.nvim_win_set_cursor(0, { item.lnum, (item.col or 1) - 1 })
--         end
--       end
--
--       -- Return focus to the quickfix window
--       vim.api.nvim_set_current_win(qf_win)
--     end, { buffer = true, silent = true })
--   end,
-- })
