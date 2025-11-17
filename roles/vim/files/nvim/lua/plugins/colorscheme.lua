return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        transparent_mode = false,
        italic = {
          strings = false,
          comments = true,
          operators = false,
          folds = true,
        },
        overrides = {
          -- Better visual distinction
          SignColumn = { bg = "#1d2021" },
          -- Cleaner gitsigns colors
          GitSignsAdd = { fg = "#b8bb26", bg = "#1d2021" },
          GitSignsChange = { fg = "#fabd2f", bg = "#1d2021" },
          GitSignsDelete = { fg = "#fb4934", bg = "#1d2021" },
          -- Better cursorline
          CursorLineNr = { fg = "#fabd2f", bg = "#1d2021", bold = true },
          -- Better popup menu
          Pmenu = { bg = "#282828" },
          PmenuSel = { bg = "#504945", bold = true },
        },
      })
      vim.cmd("colorscheme gruvbox")
      vim.cmd("set background=dark")

      -- Enhanced visual colors
      vim.cmd("set conceallevel=0")

      -- Better diff colors
      vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#b8bb26", bg = "#1d2021" })
      vim.api.nvim_set_hl(0, "DiffChange", { fg = "#fabd2f", bg = "#3c3836" })
      vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#fb4934", bg = "#1d2021" })
      vim.api.nvim_set_hl(0, "DiffText", { fg = "#fe8019", bg = "#504945", bold = true })
    end,
  },
}
