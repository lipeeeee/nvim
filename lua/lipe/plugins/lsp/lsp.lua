-- Handles config for core lsp packages:
-- nvim-lspconfig, mason, mason-lspconfig
return {
  {
    "neovim/nvim-lspconfig",
    lazy = true, -- mason-lspconfig will load this
  },
  {
    "williamboman/mason.nvim",
    lazy = true, -- mason-lspconfig will load this
    config = function()
      local mason = require("mason")

      mason.setup({
        ui = {
          icons = {
            package_installed = ICONS.ui.Check,
            package_pending = ICONS.ui.BoldArrowRight,
            package_uninstalled = ICONS.ui.Close
          }
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      -- mason-lspconfig Setup
      local ensure_installed = require("lipe.lsp.servers")
      mason_lspconfig.setup({
        ensure_installed = ensure_installed,
        automatic_installation = true,
      })

      -- Handlers & server options
      local handlers = require("lipe.lsp.handlers")
      local opts = {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities
      }

      -- Specific server options
      for _, server in pairs(ensure_installed) do
        server = vim.split(server, "@")[1]

        local require_ok, conf_opts = pcall(require, ("lipe.lsp.settings." .. server))
        if require_ok then
          opts = vim.tbl_deep_extend("force", conf_opts, opts)
        end

        lspconfig[server].setup(opts)
      end

      handlers.setup()
    end,
  },
}
