local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("lipe.lsp.mason")
require("lipe.lsp.handlers").setup()
require("lipe.lsp.null-ls")
require("lipe.lsp.lsp_format_save_hook")
