-- Mapping of keybinds
local keymap = vim.api.nvim_buf_set_keymap
local LSP_opts = { noremap = true, silent = true }

local function _cmd(command)
  return "<cmd>" .. command .. "<cr>"
end

local function update_alpha_on_keybind()
  -- UPDATE_ALPHA()
  -- vim.cmd("Alpha")
end

local function lsp_keymaps(bufnr)
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", LSP_opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", LSP_opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", LSP_opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", LSP_opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", LSP_opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", LSP_opts)
  keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", LSP_opts)
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", LSP_opts)
  keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", LSP_opts)
  keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", LSP_opts)
  keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", LSP_opts)
  keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", LSP_opts)
  keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", LSP_opts)
  keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", LSP_opts)
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", LSP_opts)
end


-- abcdefghijklmnopqrstuvxyz
return {
  general = {
    ["<leader>"] = {
      -- NvimTree
      ["e"] = { _cmd("NvimTreeToggle"), "NvimTree Toggle" },

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

  lsp_keymaps = {
    -- Mode, Keybind, command
    { "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" },
    { "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },
    { "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>" },
    { "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
    { "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>" },
    { "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>" },
    { "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>" },
    { "n", "<leader>li", "<cmd>LspInfo<cr>" },
    { "n", "<leader>lI", "<cmd>LspInstallInfo<cr>" },
    { "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>" },
    { "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>" },
    { "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>" },
    { "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>" },
    { "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
    { "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>" },
  },
}
