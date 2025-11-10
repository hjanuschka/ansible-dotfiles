return {
  -- Lualine - Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local colors = {
        blue = "#80a0ff",
        cyan = "#79dac8",
        black = "#262626",
        white = "#c6c6c6",
        red = "#ff5189",
        violet = "#d183e8",
        grey = "#303030",
      }

      local bubbles_theme = {
        normal = {
          a = { fg = colors.black, bg = colors.violet },
          b = { fg = colors.white, bg = colors.grey },
          c = { fg = colors.black, bg = colors.black },
        },
        insert = { a = { fg = colors.black, bg = colors.blue } },
        visual = { a = { fg = colors.black, bg = colors.cyan } },
        replace = { a = { fg = colors.black, bg = colors.red } },
        inactive = {
          a = { fg = colors.white, bg = colors.black },
          b = { fg = colors.white, bg = colors.black },
          c = { fg = colors.black, bg = colors.black },
        },
      }

      require("lualine").setup({
        options = {
          theme = bubbles_theme,
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = "" }, right_padding = 2 },
          },
          lualine_b = {
            "filename",
            "branch",
            {
              "diagnostics",
              sources = { "nvim_lsp" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
          },
          lualine_c = {
            "fileformat",
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
            },
          },
          lualine_x = {},
          lualine_y = { "filetype", "progress" },
          lualine_z = {
            { "location", separator = { right = "" }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
      })
    end,
  },

  -- Bufferline - Buffer tabs
  {
    "akinsho/nvim-bufferline.lua",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
      { "<leader>bc", "<cmd>BufferLinePickClose<CR>", desc = "Close Buffer" },
    },
    config = function()
      require("bufferline").setup({
        options = {
          separator_style = "slant",
          diagnostics = "nvim_lsp",
          show_buffer_icon = true,
          show_buffer_close_icon = true,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true,
            },
          },
          diagnostics_indicator = function(count, level, diagnostics_dict)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
        },
      })
    end,
  },

  -- Nvim Tree - File explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = true,
  },

  -- Web devicons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup({
        override = {
          zsh = {
            icon = "",
            color = "#428850",
            name = "Zsh",
          },
        },
        default = true,
      })
    end,
  },

  -- Startify - Start screen
  {
    "mhinz/vim-startify",
    lazy = false,
  },

  -- Float preview
  {
    "ncm2/float-preview.nvim",
    event = "InsertEnter",
  },
}
