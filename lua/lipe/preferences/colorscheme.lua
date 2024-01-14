-- local colorscheme = "catppuccin-mocha"
local colorscheme = "kanagawa-dragon"
-- local colorscheme = "rose-pine"

local colorscheme_exists, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not colorscheme_exists then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
end
