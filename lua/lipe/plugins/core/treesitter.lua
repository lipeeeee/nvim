-- Remove italics in highlight
-- EXPORT THIS FUNCT IF NEEDED
local function remove_italics()
  vim.cmd("hi Keyword gui=bold")
  vim.cmd("hi @keyword.return gui=bold")
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    config = function()
      local ts_config = require("nvim-treesitter.configs")

      ts_config.setup {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = { "c", "lua" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

        -- Indentation
        indent = { enable = true },

        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      }

      -- Fix dumb italic defaults
      remove_italics()
    end
  },
  {
    "nvim-treesitter/playground", event = "VeryLazy"
  }
}
