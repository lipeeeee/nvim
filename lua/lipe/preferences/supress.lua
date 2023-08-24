-- Used for message suppressing

-- Suppress clangd bug this is not cheating :) its an issue with clangd and nvim itself
local clangd_offset_bug = "warning: multiple different client offset_encodings"
local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match(clangd_offset_bug) then
      return
    end

  notify(msg, ...)
end
