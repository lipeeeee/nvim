return {
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 0
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      local rust_tools = require("rust-tools")

      rust_tools.setup({
        on_attach = require("lipe.lsp.handlers").on_attach,
        capablilites = require("lipe.lsp.handlers").capablilites
      })
    end
  },
}
