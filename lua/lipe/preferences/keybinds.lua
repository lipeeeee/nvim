local harpoon = require("harpoon")

-- Mapping of keybinds
local function _cmd(command)
  return "<cmd>" .. command .. "<cr>"
end

-- abcdefghijklmnopqrstuvxyz
return {
  ["<leader>"] = {

    -- Buffer actions
    b = {
      name = "+Buffer",
      ["d"] = { _cmd("bd"), "Delete current buffer" },
      ["D"] = { _cmd("%bd|e#"), "Delete every other buffer" },
      ["l"] = { _cmd("Telescope buffers"), "List Buffers" },
    },

    -- Dynamic file explorer, input gotten from entry init.lua
    ["e"] = { _cmd(FILE_EXPLORERS[FILE_EXPLORER_TO_USE]), FILE_EXPLORER_TO_USE .. " Toggle" },

    -- Git
    g = {
      name = "+Git",
      a = { _cmd("Git add ."), "Add" },
      b = { _cmd("Gitsigns blame_line"), "Blame" },
      c = { _cmd("Git commit"), "Commit" },
      l = { _cmd("Git log"), "Log" },
      g = { _cmd("LazyGit"), "LazyGit" },
      s = { _cmd("Git"), "Status" },
    },

    -- Harpoon
    ["h"] = {
      name = "+Harpoon",
      ["a"] = { function() harpoon:list():append() end, "Add file" },
      ["e"] = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Menu" },
    },

    -- Help
    ["H"] = {
      name = "+Help",
      ["k"] = { _cmd("Telescope keymaps"), "Keymaps" },
      ["t"] = { _cmd("Telescope builtin"), "Telescope" },
      ["T"] = { _cmd("Telescope help_tags"), "Tags" },
    },

    -- LSP
    ["l"] = {
      name = "+LSP",
      ["f"] = { _cmd("lua vim.lsp.buf.format{ async = true }"), "Format" },
      ["r"] = { _cmd("lua vim.lsp.buf.rename()"), "Rename" },
      ["i"] = { _cmd("LspInfo"), "Info" },
      ["a"] = { _cmd("lua vim.lsp.buf.code_action()"), "Code Actions" },
      ["n"] = { _cmd("lua vim.diagnostic.goto_next({buffer=, opts0})"), "Diagnostics Next" },
      ["p"] = { _cmd("lua vim.diagnostic.goto_prev({buffer=, opts0})"), "Diagnostics Prev" },
      ["s"] = { _cmd("lua vim.lsp.buf.signature_help()"), "Signature Help" },
      ["t"] = { _cmd("TroubleToggle"), "Trouble" },
      ["q"] = { _cmd("lua vim.diagnostic.setloclist()"), "Loc List" },
    },

    -- Lazy
    ["L"] = { _cmd("Lazy"), "Lazy" },

    -- Mason
    ["M"] = { _cmd("Mason"), "Mason" },

    -- Telescope
    ["t"] = {
      name = "+Telescope",
      f = { _cmd("Telescope find_files"), "Find File" },
      r = { _cmd("Telescope oldfiles"), "Recent Files" },
      B = { _cmd("Telescope file_browser"), "File Browser" },
      b = { _cmd("Telescope buffers"), "Buffers" },
      c = { _cmd("Telescope neoclip"), "Clipboard" },
      g = { _cmd("Telescope live_grep"), "Grep" }
    },

    -- Trouble
    ["T"] = { _cmd("Trouble"), "Trouble" },

    ["U"] = { _cmd("UndotreeToggle"), "Undotree" },

    ["z"] = { _cmd("ZenMode"), "Zen Mode" },
  },

  -- Non-Leader lsp bindings
  ["<C-space>"] = { _cmd("lua vim.lsp.buf.hover()"), "Lsp Hover Info" },
  ["gd"] = { _cmd("lua vim.lsp.buf.definition()"), "Go Definition" },
  ["gD"] = { _cmd("lua vim.lsp.buf.declaration()"), "Go Declaration" },
  ["gI"] = { _cmd("lua vim.lsp.buf.implementation()"), "Go Implementation" },
  ["gr"] = { _cmd("lua vim.lsp.buf.references()"), "Go References" },
  -- ["gl"] = { _cmd("lua vim.diagnostic.open_float()"), "Go Diagnostics" },

  -- Harpoon
  ["<A-1>"] = { function() harpoon:list():select(1) end, "Harpoon file 1" },
  ["<A-2>"] = { function() harpoon:list():select(2) end, "Harpoon file 2" },
  ["<A-3>"] = { function() harpoon:list():select(3) end, "Harpoon file 3" },
  ["<A-4>"] = { function() harpoon:list():select(4) end, "Harpoon file 4" },
  ["<A-5>"] = { function() harpoon:list():select(5) end, "Harpoon file 5" },

  -- ToggleTerm
  ["<C-\\>"] = { _cmd("ToggleTerm"), "Terminal" },
}
