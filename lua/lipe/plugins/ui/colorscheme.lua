return {
  { 
    "catppuccin/nvim",
    name = "catppuccin", 
    priority = 1000,
    
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
}
