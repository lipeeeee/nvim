return {
  {
    "catppuccin/nvim",
    name = "catppuccin",

    opts = {
      no_italic = true,
      color_overrides = {
        mocha = {
          base = COLORS.BLACK,
          mantle = COLORS.BLACK,
          crust = COLORS.BLACK,
        },
      },
    },
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      local kanagawa = require("kanagawa")

      kanagawa.setup({
        commentStyle = { italic = false },
      })
    end,
  },
  { "shaunsingh/oxocarbon.nvim" },
  { "ellisonleao/gruvbox.nvim" },
}
