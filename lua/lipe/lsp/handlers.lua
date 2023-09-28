local M = {}

-- Check if LSP completion is installed
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  vim.notify("Could not find completion engine for LSP")
  return
end

-- Capabilites & LSP completion
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

-- Setup function for lsp handlers
M.setup = function()
  -- Signs that LSP will use
  local signs = {
    { name = "DiagnosticSignError", text = ICONS.diagnostics.Error },
    { name = "DiagnosticSignWarn",  text = ICONS.diagnostics.Warning },
    { name = "DiagnosticSignHint",  text = ICONS.diagnostics.Hint },
    { name = "DiagnosticSignInfo",  text = ICONS.diagnostics.Info },
  }

  -- Define signs internally
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {
      texthl = sign.name,
      text = sign.text,
      numhl = ""
    })
  end

  vim.diagnostic.config({
    virtual_text = true, -- text in front of line
    signs = {
      active = signs,    -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  -- Setup some handlers's settings
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

-- Buffer attach function, called whenever LSP attaches to a buffer
M.on_attach = function(client, bufnr)
  -- Initialize illuminate for that buffer
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    vim.notify("Tried loading illuminate but failed... lsp.handlers")
    return
  end
  illuminate.on_attach(client)
end

return M
