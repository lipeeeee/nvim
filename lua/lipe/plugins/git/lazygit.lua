-- LazyGitFloat	Normal	Float terminal foreground and background
-- LazyGitBorder	Normal	Float terminal border
return {
  "kdheepak/lazygit.nvim",
  cmd = "LazyGit",
  -- enabled = false, -- fugitive is a much better cleaner tool to handle git
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
