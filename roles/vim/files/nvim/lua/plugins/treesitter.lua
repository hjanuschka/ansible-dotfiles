return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {},  -- Using already-installed parsers
        highlight = {
          enable = true,
        },
      })
    end,
  },
}
