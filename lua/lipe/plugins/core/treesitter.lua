-- Remove italics in highlight groups
local function remove_italics()
  vim.cmd("hi Keyword gui=bold")
  vim.cmd("hi @keyword.return gui=bold")
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    config = function()
      -- Post-2024 refactor API: nvim-treesitter.configs is gone.
      -- The plugin now only manages parser installation; highlight/indent
      -- are handled by Neovim's native vim.treesitter API.
      require("nvim-treesitter").setup()

      -- Enable treesitter highlighting for every buffer that has a parser.
      -- pcall so buffers without a parser fall back to regex syntax silently.
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          -- Skip special buffers
          if vim.bo[args.buf].buftype ~= "" then return end
          pcall(vim.treesitter.start, args.buf)
        end,
      })

      -- Fix dumb italic defaults
      remove_italics()
    end,
  },
}
