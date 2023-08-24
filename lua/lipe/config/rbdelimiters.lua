local status_ok, rainbow_delimiters = pcall(require, "rainbow-delimiters")
if not status_ok then
  vim.notify("[CONFIG] FAILED TO LOAD RAINBOW-DELIMITERS")
  return
end


vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rainbow_delimiters.strategy['global'],
    vim = rainbow_delimiters.strategy['local'],
  },
  query = {
    [''] = 'rainbow-delimiters',
    lua = 'rainbow-blocks',
  },
  highlight = {
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
    'RainbowDelimiterRed',
  },
}

