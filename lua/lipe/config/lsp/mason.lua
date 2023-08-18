-- If this file is called, assume everything is setup correctly beforehand
local ensure_installed = {
  "clangd", -- C
  "lua_ls", -- LUA
  "pyright" -- PYTHON
}

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup({
  ensure_installed = ensure_installed,
  automatic_installation = true
})

local opts = {}
local tmp_prefix = USR .. ".config.lsp."
for _, server in pairs(ensure_installed) do 
  -- Speed increase for memory decresae
  local hndlrs = require(tmp_prefix .. "handlers")

  opts = {
    on_attach = hndlrs.on_attach,
    capabilities = hndlrs.capabilities
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, (tmp_prefix .. "settings." .. server))
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
