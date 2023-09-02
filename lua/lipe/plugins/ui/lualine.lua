return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local pref_signs = require(USR .. ".preferences.signs")
    local lualine = require('lualine')

    -- Color table for highlights
    local colors = {
      bg = "#202328",
      fg = "#bbc2cf",
      black = "#000000",
      grey = "#383838",
      yellow = "#ECBE7B",
      d_yellow = "#fcba03",
      cyan = "#008080",
      darkblue = "#081633",
      green = "#98be65",
      orange = "#FF8800",
      violet = "#a9a1e1",
      magenta = "#c678dd",
      purple = "#c678dd",
      blue = "#51afef",
      red = "#ec5f67",
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        globalstatus = true,
        component_separators = '',
        section_separators = '',
        theme = "auto",
        -- theme = {
        --   -- We are going to use lualine_c an lualine_x as left and
        --   -- right section. Both are highlighted by c theme .  So we
        --   -- are just setting default looks o statusline
        --   normal = { c = { fg = colors.fg, bg = colors.bg } },
        --   inactive = { c = { fg = colors.fg, bg = colors.bg } },
        -- },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    -- Gets gitsigns data for lualine
    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end

    -- Maps a color and a text
    local function get_color_mode(key)
      local dict = {
        n = { col = colors.blue, text = "NORMAL" },
        i = { col = colors.green, text = "INSERT" },
        v = { col = colors.purple, text = "VISUAL" },
        [''] = { col = colors.blue, text = "WHATISTHIS" },
        V = { col = colors.purple, text = "VISUAL" },
        c = { col = colors.yellow, text = "CMMAND" },
        no = { col = colors.red, text = "NO" },
        s = { col = colors.orange, text = "SUB" },
        S = { col = colors.orange, text = "SUB" },
        [''] = { col = colors.orange, text = "" },
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red,
      }
      return dict[key]
    end

    -- MODE
    col_mode = ""
    ins_left {
      function()
        col_mode = get_color_mode(vim.fn.mode())
        return col_mode.text
      end,
      color = function()
        return {
          fg = colors.black,
          bg = col_mode.col
        }
      end,
    }

    -- BRANCH
    ins_left {
      'b:gitsigns_head',
      icon = {
        pref_signs["BRANCH"],
        color = {
          fg = colors.d_yellow
        }
      },
      color = {
        fg = colors.white,
        bg = colors.grey,
        gui = 'bold'
      },
    }

    -- FILENAME
    -- ins_left {
    --   'filename',
    --   cond = conditions.buffer_not_empty,
    --   color = { fg = colors.green, gui = 'bold' },
    -- }

    -- DIFF
    ins_left {
      'diff',
      source = diff_source,
      symbols = {
        added = pref_signs.git.LineAdded .. " ",
        modified = pref_signs.git.LineModified .. " ",
        removed = pref_signs.git.LineRemoved .. " "
      },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = nil,
    }

    -- Right:
    -- LSP
    ins_right {
      function()
        local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
        if #buf_clients == 0 then
          return "LSP Inactive"
        end

        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return "[" .. client.name .. "]"
          end
        end
      end,
      color = {
        fg = colors.fg,
        gui = "bold",
      },
      cond = conditions.hide_in_width,
    }

    ins_right { 'location' }

    ins_right { 'progress', color = { gui = 'bold' } }

    ins_right {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = { error = pref_signs["ERROR"] .. " ", warn = pref_signs["WARN"] .. " ", info = pref_signs["INFO"] .. " " },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
      },
    }

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    -- ins_left {
    --   function()
    --     return '%='
    --   end,
    -- }

    -- Add components to right sections
    ins_right {
      'o:encoding',       -- option component same as &encoding in viml
      fmt = string.upper, -- I'm not sure why it's upper case either ;)
      cond = conditions.hide_in_width,
      color = { fg = colors.green, gui = 'bold' },
    }

    ins_right {
      'fileformat',
      fmt = string.upper,
      icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
      color = { fg = colors.green, gui = 'bold' },
    }
    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end
}
