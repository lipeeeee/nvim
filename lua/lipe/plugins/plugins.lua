-- All plugins
return {
  -- Core
  { "wbthomason/packer.nvim" },
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "windwp/nvim-autopairs" },

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Snippets
  { "L3MON4D3/LuaSnip" }, -- Snippet engine
  { "rafamadriz/friendly-snippets" },

  -- Colorschemes
  -- { "lunarvim/colorschemes" },
  { "lunarvim/darkplus.nvim" },

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },

  --
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },
  { "hiphish/rainbow-delimiters.nvim" },
  { "nvim-treesitter/playground" },
}
