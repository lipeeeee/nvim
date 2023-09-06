return {
  "nvim-lualine/lualine.nvim",
  event = "VimEnter",
  config = function()
    local pref_signs = require(USR .. ".preferences.signs")
    local colors = require(USR .. ".preferences.colors")
    local lualine = require('lualine')
    local col_mode = nil

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
        disabled_filetypes = { "toggleterm" },

        globalstatus = true,
        component_separators = '',
        section_separators = '',
        theme = "auto",
      },
      -- Reset defaults
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

    -- Maps a color and a text to a vim mode
    local col_dict = {
      n = { col = colors.blue, text = "NORMAL" },
      i = { col = colors.green, text = "INSERT" },
      v = { col = colors.purple, text = "VISUAL" },
      V = { col = colors.purple, text = "VISUAL" },
      c = { col = colors.yellow, text = "CMMAND" },
      R = { col = colors.red, text = "REPLAC" },
    }

    -- MODE
    ins_left { function()
      col_mode = col_dict[vim.fn.mode()]

      -- This doesn't work because vim.cmd does not return anyth, only prints to notify
      -- if (vim.cmd("set paste?") == "paste") then
      --   col_mode = col_mode .. " (P)"
      -- end
      return col_mode.text
    end,
      color = function()
        col_mode = col_dict[vim.fn.mode()]
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
        fg = colors.lualine.fg,
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
    -- diagnostics
    ins_right {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = {
        error = pref_signs.ERROR .. " ",
        warn = pref_signs.WARN .. " ",
        info = pref_signs.INFO .. " ",
        hint = pref_signs.HINT .. " ",
      },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
      },
    }

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
        fg = colors.lualine.fg,
        gui = "bold",
      },
      cond = conditions.hide_in_width,
    }

    -- SHIFT
    ins_right {
      function()
        local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
        return pref_signs.ui.Tab .. " " .. shiftwidth
      end,
      padding = 1,
    }

    -- filetype
    ins_right { "filetype",
      padding =
      {
        left = 1,
        right = 1
      },
      cond = nil,
    }

    -- Location
    ins_right { 'location',
      color = function()
        local status, col_mode = pcall(function()
          return col_dict[vim.fn.mode()]
        end)
        if (status and col_mode ~= nil) then
          return {
            bg = colors.grey,
            fg = col_mode.col,
          }
        else
          return {}
        end
      end
    }

    -- Progress
    ins_right { "progress",
      fmt = function()
        return "%P/%L"
      end,
      color = function()
        local status, col_mode = pcall(function()
          return col_dict[vim.fn.mode()]
        end)

        if (status and col_mode ~= nil) then
          return {
            bg = col_mode.col,
            fg = colors.black
          }
        else
          return {}
        end
      end,
    }

    lualine.setup(config)
  end
}
