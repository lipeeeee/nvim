-- This file runs after everything is loaded initially
require("lipe.preferences.colorscheme")

-- Native LSP setup (Neovim 0.11+) ; maybe this shouldnt be here. a future refactoring could remove this
-- All plugin Lua files are in rtp after lazy.setup(), so cmp_nvim_lsp et al.
-- can be required here even before their config functions have run.
local handlers = require("lipe.lsp.handlers")
local servers  = require("lipe.lsp.servers")

-- Apply per-server settings (cmd overrides, filetypes, etc.)
for _, server in ipairs(servers) do
  local name = vim.split(server, "@")[1]
  local ok, conf_opts = pcall(require, "lipe.lsp.settings." .. name)
  if ok then
    vim.lsp.config(name, conf_opts)
  end
end

-- Global setup: diagnostics, capabilities, hover borders, LspAttach autocmd
handlers.setup()
vim.lsp.enable(servers)
