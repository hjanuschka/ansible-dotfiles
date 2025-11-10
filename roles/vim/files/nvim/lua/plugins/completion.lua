return {
  -- nvim-cmp - Completion engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      local cmp = require("cmp")
      local lsp_zero = require("lsp-zero")
      local cmp_format = lsp_zero.cmp_format()

      cmp.setup({
        sources = {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip", priority = 750 },
          { name = "buffer", priority = 500 },
          { name = "path", priority = 250 },
        },
        formatting = cmp_format,
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
      })
    end,
  },

  -- LuaSnip - Snippet engine
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    lazy = true,
  },

  -- CMP sources
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },
  {
    "hrsh7th/cmp-buffer",
    lazy = true,
  },
}
