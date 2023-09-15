return {
  {
    "williamboman/mason.nvim",
    -- dependencies = {
    --   "williamboman/mason-lspconfig.nvim",
    -- },
    config = function()
      local mason = require("mason")
      local opts = {
        ui = {
          icons = {
            package_installed = ICONS.ui.Check,
            package_pending = ICONS.ui.BoldArrowRight,
            package_uninstalled = ICONS.ui.Close
          }
        },
      }
      mason.setup(opts)
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- dependencies = {
    --   "rafamadriz/friendly-snippets",
    --   "nvim-lspconfig",
    --   "williamboman/mason-lspconfig.nvim",
    -- },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      -- Mason Setup
      local ensure_installed = require("lipe.lsp.servers")
      local opts = {
        ensure_installed = ensure_installed,
        automatic_installation = true,
      }
      mason_lspconfig.setup(opts)

      -- Handlers & server options
      local handlers = require("lipe.lsp.handlers")
      opts = {
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
  }
}
