return {
  {
    "nvim-telescope/telescope.nvim", tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    lazy = true
  },

  -- Extensions
  { "nvim-telescope/telescope-file-browser.nvim", lazy = true },
  { "nvim-telescope/telescope-ui-select.nvim", lazy = true },
  { "dhruvmanila/telescope-bookmarks.nvim", lazy = true},
  { "nvim-telescope/telescope-github.nvim", lazy = true},
  {
    "AckslD/nvim-neoclip.lua",
    config = function() require("neoclip").setup() end,
    lazy = true
  },
  { "cljoly/telescope-repo.nvim", lazy = true },
}
