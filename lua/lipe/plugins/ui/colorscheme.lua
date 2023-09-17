return {
  {
    "catppuccin/nvim",
    name = "catppuccin",

    opts = {
      no_italic = true,
      color_overrides = {
        mocha = {
          base = COLORS.black,
          mantle = COLORS.black,
          crust = COLORS.black,
        },
      },
    },
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      local kanagawa = require("kanagawa")
      local opts = {
        commentStyle = { italic = false },
      }

      kanagawa.setup(opts)
    end,
  },
  { "shaunsingh/oxocarbon.nvim" },
  { "ellisonleao/gruvbox.nvim" },
}
