return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason", -- lazy: only open UI when :Mason is called
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed   = ICONS.ui.Check,
            package_pending     = ICONS.ui.BoldArrowRight,
            package_uninstalled = ICONS.ui.Close,
          },
        },
      })
    end,
  },
}
