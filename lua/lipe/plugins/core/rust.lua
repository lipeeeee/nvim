return {
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      local opts = {
        on_attach = require("lipe.lsp.handlers").on_attach,
        capablilites = require("lipe.lsp.handlers").capablilites
      }

      require("rust-tools").setup(opts)
    end
  },
}
