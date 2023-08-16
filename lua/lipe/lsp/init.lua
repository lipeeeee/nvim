local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require(USR .. ".lsp.mason")
require(USR .. ".lsp.handlers").setup()
require(USR .. ".lsp.null-ls")
