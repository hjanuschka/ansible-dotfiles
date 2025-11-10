return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
      vim.cmd("colorscheme gruvbox")
      vim.cmd("set background=dark")

      -- Enhanced visual colors
      vim.cmd("set conceallevel=0")

      -- Better diff colors
      vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#00ff00", bg = "#005500" })
      vim.api.nvim_set_hl(0, "DiffChange", { fg = "#cccccc", bg = "#333333" })
      vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#ff0000", bg = "#550000" })
    end,
  },
}
