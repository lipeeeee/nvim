
-- Safety check
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig.. Could not load config for LSP")
  return
end

local status_ok, _ = pcall(require, "mason")
if not status_ok then
  vim.notify("Mason.. Could not load config for LSP")
  return
end

local cnf_prefix = USR .. ".config.lsp."
require(cnf_prefix .. "mason")
require(cnf_prefix .. "handlers").setup()
require(cnf_prefix .. "null-ls")
