local harpoon = require("harpoon")

-- Mapping of keybinds
local function _cmd(command)
  return "<cmd>" .. command .. "<cr>"
end

-- abcdefghijklmnopqrstuvxyz
return {
  -- Dynamic file explorer, input gotten from entry init.lua
  { "<leader>e", _cmd(FILE_EXPLORERS[FILE_EXPLORER_TO_USE]), desc = FILE_EXPLORER_TO_USE .. " Toggle" },

  -- Buffer actions
  { "<leader>b", group = "+Buffer" },
  { "<leader>bs", function () require("snipe").open_buffer_menu() end, desc = "Snipe buffer" },
  { "<leader>bd", _cmd("bd"), desc = "Delete current buffer" },
  { "<leader>bD", _cmd("%bd|e#"), desc = "Delete every other buffer" },
  { "<leader>bl", _cmd("Telescope buffers"), desc = "List Buffers" },

  -- Commands/Custom shortcuts
  { "<leader>c", group = "+Commands" },
  { "<leader>cs", group = "+Set" },
  { "<leader>csn", _cmd("set nopaste"), desc = "set nopaste" },
  { "<leader>csp", _cmd("set paste"), desc = "set paste" },

  -- Git
  { "<leader>g", group = "+Git" },
  { "<leader>ga", _cmd("Git add ."), desc = "Add" },
  { "<leader>gb", _cmd("Gitsigns blame_line"), desc = "Blame" },
  { "<leader>gc", _cmd("Git commit"), desc = "Commit" },
  { "<leader>gl", _cmd("Git log"), desc = "Log" },
  { "<leader>gg", _cmd("LazyGit"), desc = "LazyGit" },
  { "<leader>gs", _cmd("Git"), desc = "Status" },

  -- Harpoon
  { "<leader>h", group = "+Harpoon" },
  { "<leader>ha", function() harpoon:list():add() end, desc = "Add file" },
  { "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Menu" },

  -- Help
  { "<leader>H", group = "+Help" },
  { "<leader>Hk", _cmd("Telescope keymaps"), desc = "Keymaps" },
  { "<leader>Ht", _cmd("Telescope builtin"), desc = "Telescope" },
  { "<leader>HT", _cmd("Telescope help_tags"), desc = "Tags" },

  -- LSP
  { "<leader>l", group = "+LSP" },
  { "<leader>lf", _cmd("lua vim.lsp.buf.format{ async = true }"), desc = "Format" },
  { "<leader>lr", _cmd("lua vim.lsp.buf.rename()"), desc = "Rename" },
  { "<leader>li", _cmd("LspInfo"), desc = "Info" },
  { "<leader>la", _cmd("lua vim.lsp.buf.code_action()"), desc = "Code Actions" },
  { "<leader>ln", _cmd("lua vim.diagnostic.goto_next({buffer=, opts0})"), desc = "Diagnostics Next" },
  { "<leader>lp", _cmd("lua vim.diagnostic.goto_prev({buffer=, opts0})"), desc = "Diagnostics Prev" },
  { "<leader>ls", _cmd("lua vim.lsp.buf.signature_help()"), desc = "Signature Help" },
  { "<leader>lt", _cmd("TroubleToggle"), desc = "Trouble" },
  { "<leader>lq", _cmd("lua vim.diagnostic.setloclist()"), desc = "Loc List" },

  -- Lazy
  { "<leader>L", _cmd("Lazy"), desc = "Lazy" },

  -- Mason 
  { "<leader>M", _cmd("Mason"), desc = "Mason" },

  -- Telescope
  { "<leader>t", group = "+Telescope" },
  { "<leader>tf", _cmd("Telescope find_files"), desc = "Find File" },
  { "<leader>tr", _cmd("Telescope oldfiles"), desc = "Recent Files" },
  { "<leader>tB", _cmd("Telescope file_browser"), desc = "File Browser" },
  { "<leader>tb", _cmd("Telescope buffers"), desc = "Buffers" },
  { "<leader>tc", _cmd("Telescope neoclip"), desc = "Clipboard" },
  { "<leader>tg", _cmd("Telescope live_grep"), desc = "Grep" },

  -- Trouble
  { "<leader>T", _cmd("Trouble"), desc = "Trouble" },

  -- Undotree 
  { "<leader>U", _cmd("UndotreeToggle"), desc = "Undotree" },

  -- Zen mode
  { "<leader>z", _cmd("ZenMode"), desc = "Zen Mode" },

  -- Non-Leader lsp bindings
  { "<C-space>", _cmd("lua vim.lsp.buf.hover()"), desc = "Lsp Hover Info" },
  { "gd", _cmd("lua vim.lsp.buf.definition()"), desc = "Go Definition" },
  { "gD", _cmd("lua vim.lsp.buf.declaration()"), desc = "Go Declaration" },
  { "gI", _cmd("lua vim.lsp.buf.implementation()"), desc = "Go Implementation" },
  { "gr", _cmd("lua vim.lsp.buf.references()"), desc = "Go References" },
  -- ["gl"] = { _cmd("lua vim.diagnostic.open_float()"), "Go Diagnostics" },

  -- Harpoon
  { "<A-1>", function() harpoon:list():select(1) end, desc = "Harpoon file 1" },
  { "<A-2>", function() harpoon:list():select(2) end, desc = "Harpoon file 2" },
  { "<A-3>", function() harpoon:list():select(3) end, desc = "Harpoon file 3" },
  { "<A-4>", function() harpoon:list():select(4) end, desc = "Harpoon file 4" },
  { "<A-5>", function() harpoon:list():select(5) end, desc = "Harpoon file 5" },
  { "<A-6>", function() harpoon:list():select(6) end, desc = "Harpoon file 6" },

  -- ToggleTerm
  { "<C-\\>", _cmd("ToggleTerm"), desc = "Toggle Term" },
}
