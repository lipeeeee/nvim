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

    -- Lazy
    ["L"] = { _cmd("Lazy"), "Lazy" },

    -- Telescope
    t = {
      name = "+Telescope",
      f = { _cmd("Telescope find_files"), "Find File" },
      r = { _cmd("Telescope oldfiles"), "Recent Files" },
      b = { _cmd("Telescope file_browser"), "File Browser" },
      c = { _cmd("Telescope neoclip"), "Clipboard" },
      g = { _cmd("Telescope live_grep"), "Grep" }
    },
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
}
