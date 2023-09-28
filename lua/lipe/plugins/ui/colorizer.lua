return {
  "norcalli/nvim-colorizer.lua",
  enabled = false,
  config = function()
    local colorizer = require("colorizer")
    colorizer.setup({
      "*", -- All files
    })
  end
}
