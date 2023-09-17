-- Optional dependencies
-- sharkdp/fd (finder)
-- nvim-treesitter/nvim-treesitter (finder/preview)
-- neovim LSP (picker)
-- devicons (icons)
return {
  {
    "nvim-telescope/telescope.nvim",
    -- Load on Telescope command
    cmd = "Telescope",
    tag = '0.1.3',
    dependencies = {
      {
        "AckslD/nvim-neoclip.lua",
        config = function() require("neoclip").setup() end,
      },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup {
        defaults = {

          prompt_prefix = "> ",
          selection_caret = "> ",
          color_devicons = true,
          -- path_display = { "smart" },

          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,

              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,

              ["<C-c>"] = actions.close,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,

              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,

              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-l>"] = actions.complete_tag,
              ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
              ["<esc>"] = actions.close,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,

              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["H"] = actions.move_to_top,
              ["M"] = actions.move_to_middle,
              ["L"] = actions.move_to_bottom,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["gg"] = actions.move_to_top,
              ["G"] = actions.move_to_bottom,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,

              ["?"] = actions.which_key,
            },
          },
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
        },
        -- extensions = {
        --   fzf = {
        --     fuzzy = true, -- false will only do exact matching
        --     override_generic_sorter = true,
        --     override_file_sorter = true,
        --     case_mode = "smart_case", -- this is default
        --   },
        --   file_browser = {
        --     hidden = true,
        --   },
        --   ["ui-select"] = {
        --     require("telescope.themes").get_cursor(),
        --   },
        --   -- Bookmarks don't work in wsl :( - lipe
        --   bookmarks = {
        --     selected_browser = "brave",
        --     url_open_command = "open",
        --     config_dir = "/mnt/c/Users/filip/AppData/Local/BraveSoftware/Brave-Browser/User Data"
        --   },
        -- },
      }

      -- 🔭 Extensions
      -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      -- telescope.load_extension "fzf"

      -- https://github.com/nvim-telescope/telescope-file-browser.nvim
      telescope.load_extension "file_browser"

      -- https://github.com/nvim-telescope/telescope-ui-select.nvim
      telescope.load_extension "ui-select"

      -- https://github.com/AckslD/nvim-neoclip.lua
      -- <C-n>
      telescope.load_extension "neoclip"

      -- GitHub CLI → local version
      -- telescope.load_extension "gh"
    end,
  },

  -- Extensions
}
