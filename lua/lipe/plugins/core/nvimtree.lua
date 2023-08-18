return {
  "nvim-tree/nvim-tree.lua",
  config = function()
	  local pref_signs = require(USR .. ".preferences.signs")
    local nvim_tree = require("nvim-tree")
    -- local nvim_tree_config = require("nvim-tree.config")

    -- local tree_cb = nvim_tree_config.nvim_tree_callback

    nvim_tree.setup {
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      renderer = {
        root_folder_modifier = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = pref_signs["HINT"],
          info = pref_signs["INFO"],
          warning = pref_signs["WARN"],
          error = pref_signs["ERROR"]
        },
      },
      view = {
        width = 35,
        side = "left",
        -- mappings = {
        --   list = {
        --     { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        --     { key = "h", cb = tree_cb "close_node" },
        --     { key = "v", cb = tree_cb "vsplit" },
        --   },
        -- },
      },
    } 
  end,
}
