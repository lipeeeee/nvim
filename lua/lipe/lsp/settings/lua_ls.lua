local function find_binary(name)
  for dir in vim.gsplit(vim.env.PATH, ":") do
    if not dir:find("mason") then
      local path = dir .. "/" .. name
      if vim.fn.executable(path) == 1 then
        return { path }
      end
    end
  end
  return { name }
end

return {
  cmd        = find_binary("lua-language-server"),
  filetypes  = { "lua" },
  -- Search upward for these markers to find the workspace root
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      diagnostics = { globals = { "vim" } },
      telemetry = { enable = false },
    },
  },
}
