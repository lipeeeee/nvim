return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local ensure_installed = {
        "clangd",
        "lua_ls",
        "pyright"
      }

      local lspconfig = require("lspconfig")
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        automatic_installation = true
      })

      local tmp_prefix = USR .. ".lsp."
      local hndlrs = require(tmp_prefix .. "handlers")
      local opts = {
          on_attach = hndlrs.on_attach,
          capabilities = hndlrs.capabilities
      }

      -- Specific server customization
      for _, server in pairs(ensure_installed) do
        server = vim.split(server, "@")[1]

        local require_ok, conf_opts = pcall(require, (tmp_prefix .. "settings." .. server))
        if require_ok then
          opts = vim.tbl_deep_extend("force", conf_opts, opts)
        end

        lspconfig[server].setup(opts)
      end

      hndlrs.setup()
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
    },
  }
}
