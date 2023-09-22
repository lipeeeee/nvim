-- Mapping of keybinds
local function _cmd(command)
  return "<cmd>" .. command .. "<cr>"
end

local function update_alpha_on_keybind()
  -- UPDATE_ALPHA()
  -- vim.cmd("Alpha")
end

-- abcdefghijklmnopqrstuvxyz
return {
  ["<leader>"] = {
    -- NvimTree
    ["e"] = { _cmd("NvimTreeToggle"), "NvimTree Toggle" },

    -- LSP
    ["l"] = {
      name = "+LSP",
      ["f"] = { _cmd("lua vim.lsp.buf.format{ async = true }"), "Format" },
      ["i"] = { _cmd("LspInfo"), "Info" },
      ["a"] = { _cmd("lua vim.lsp.buf.code_action()"), "Code Actions" },
      ["n"] = { _cmd("lua vim.diagnostic.goto_next({buffer=, opts0})"), "Diagnostics Next" },
      ["p"] = { _cmd("lua vim.diagnostic.goto_prev({buffer=, opts0})"), "Diagnostics Prev" },
      ["s"] = { _cmd("lua vim.lsp.buf.signature_help()"), "Signature Help" },
      ["q"] = { _cmd("lua vim.diagnostic.setloclist()"), "Loc List" },
    },

    -- Lazy
    ["L"] = { _cmd("Lazy"), "Lazy" },

    -- Telescope
    ["t"] = {
      name = "+Telescope",
      f = { _cmd("Telescope find_files"), "Find File" },
      r = { _cmd("Telescope oldfiles"), "Recent Files" },
      b = { _cmd("Telescope file_browser"), "File Browser" },
      c = { _cmd("Telescope neoclip"), "Clipboard" },
      g = { _cmd("Telescope live_grep"), "Grep" }
    },
    --  ["<C-\\>"] = { _cmd("ToggleTerm"), "Terminal" },
    --  ["<leader>"] = {
    --    -- Open alpha's dashboard
    --    [';'] = { update_alpha_on_keybind, "Dashboard" },
    --
    --    -- NvimTree Toggle
    --    e = { _cmd("NvimTreeToggle"), "NvimTree Toggle" },
    --
    --    -- Buffer
    --    b = {
    --      name = "+Buffer",
    --      n = { _cmd("enew"), "New File" },
    --      f = { _cmd("lua vim.lsp.buf.format{async=true}"), "Format" },
    --      d = { _cmd("Bdelete"), "Delete Current Buffer" },
    --    },
    --    -- Git
    --    g = {
    --      name = "+Git",
    --      c = { _cmd("Telescope git_commits"), "Commits" },
    --      b = { _cmd("Gitsigns blame_line"), "Blame" },
    --    },
    --
    --    -- LSP
    --    l = {
    --      name = "+LSP",
    --      d = { _cmd("TroubleToggle"), "Diagnostics" },
    --    },
    --
    --    -- Telescope
    --    -- Quit
    --    -- q = {
    --    --   name = "+Quit",
    --    --   q = { _cmd("Bdelete"), "Buffer Quit" },
    --    -- },
    --
    --    -- ToggleTerm
    --    T = { _cmd("ToggleTerm"), "Terminal" },
    --
    --    -- Lazy
    --    L = { _cmd("Lazy"), "Lazy" }

  },
  -- Non-Leader lsp bindings
  ["<C-space>"] = { _cmd("lua vim.lsp.buf.hover()"), "Lsp Hover Info" },
  ["gd"] = { _cmd("lua vim.lsp.buf.definition()"), "Go Definition" },
  ["gD"] = { _cmd("lua vim.lsp.buf.declaration()"), "Go Declaration" },
  ["gI"] = { _cmd("lua vim.lsp.buf.implementation()"), "Go Implementation" },
  ["gr"] = { _cmd("lua vim.lsp.buf.references()"), "Go References" },
  -- ["gl"] = { _cmd("lua vim.diagnostic.open_float()"), "Go Diagnostics???" },
}
