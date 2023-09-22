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

local opts = { noremap = true, silent = true }
local lsp_keymaps = {
  -- Mode, Keybind, command
  { "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts },
  { "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts },
  { "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts },
  { "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts },
  { "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts },
  { "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts },
  { "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts },
  { "n", "<leader>li", "<cmd>LspInfo<cr>", opts },
  { "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts },
  { "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts },
  { "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts },
  { "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts },
  { "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts },
  { "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts },
  { "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts },
}

M.on_attach = function(client, bufnr)
  local keymap = vim.api.nvim_buf_set_keymap

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
