local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  vim.notify("Could not find completion engine for LSP")
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.offsetEncoding = "utf-8"
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

-- Setup lsp clangd bug
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = ICONS.diagnostics.Error },
    { name = "DiagnosticSignWarn",  text = ICONS.diagnostics.Warning },
    { name = "DiagnosticSignHint",  text = ICONS.diagnostics.Hint },
    { name = "DiagnosticSignInfo",  text = ICONS.diagnostics.Info },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {
      texthl = sign.name,
      text = sign.text,
      numhl = ""
    })
  end

  local config = {
    virtual_text = true, -- text in front of line
    signs = {
      active = signs,     -- show signs
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
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

M.on_attach = function(client, bufnr)
  local keymap = vim.api.nvim_buf_set_keymap
  -- if client.name == "tsserver" then
  -- 	client.server_capabilities.documentFormattingProvider = false
  -- end
  --
  -- if client.name == "sumneko_lua" then
  -- 	client.server_capabilities.documentFormattingProvider = false
  -- end

  local lsp_keymaps = require("lipe.preferences.keybinds").lsp_keymaps
  for _, element in pairs(lsp_keymaps) do
    -- "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts
    keymap(bufnr, element[1], element[2], element[3], element[4])
  end

  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

return M
