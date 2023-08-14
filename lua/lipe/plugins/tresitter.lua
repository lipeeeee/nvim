-- This module contains a number of default definitions
local rainbow_delimiters = require('rainbow-delimiters')

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
    'RainbowDelimiterOrange',
    'RainbowDelimiterViolet',
    'RainbowDelimiterRed',
    'RainbowDelimiterCyan',
    'RainbowDelimiterGreen',
    'RainbowDelimiterBlue'
  },
}

require 'nvim-treesitter.configs'.setup {
  -- Modules and its options go here
  ensure_installed = "all",
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  indent = { enable = true, disable = { "yaml" } },
  additional_vim_regex_highlighting = false
}
