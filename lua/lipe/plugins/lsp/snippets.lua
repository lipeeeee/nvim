-- Snippet engines & sources
return {
  {
    "rafamadriz/friendly-snippets",
    lazy = true, -- luasnip will load friendly-snippets
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    lazy = true, -- nvim-cmp will load luasnip
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
    build = "make install_jsregexp", -- Optional
  },
}
