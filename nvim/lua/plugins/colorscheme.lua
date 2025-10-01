return {
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- load during startup
    priority = 1000, -- load before other plugins
    config = function()
      require("github-theme").setup({
        options = {
          transparent = false,
          styles = {
            comments = "italic",
            keywords = "bold",
          },
        },
      })
      vim.cmd.colorscheme("github_dark_default")
    end,
  },
}
