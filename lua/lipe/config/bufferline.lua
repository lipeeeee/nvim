local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  vim.notify("[CONFIG] FAILED TO LOAD BUFFERLINE")
  return
end

-- :h bufferline-configuration
bufferline.setup({

})
