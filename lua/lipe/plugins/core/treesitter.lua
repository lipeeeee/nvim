-- Remove italics in highlight
-- EXPORT THIS FUNCT IF NEEDED
local function remove_italics()
  vim.cmd("hi Keyword gui=bold")
  vim.cmd("hi @keyword.return gui=bold")
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").setup {
        ensure_installed = { "c", "lua", "python" },
        sync_install = false,
        auto_install = true,

        -- Indentation
        indent = { enable = true },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = { "rust" },
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      }

      -- Fix dumb italic defaults
      remove_italics()
    end
  }
}
