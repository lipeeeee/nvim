return {
  -- Snippet engine
	{
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",

    -- follow latest release.
    version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    dependencies = { "rafamadriz/friendly-snippets" },

    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
}
