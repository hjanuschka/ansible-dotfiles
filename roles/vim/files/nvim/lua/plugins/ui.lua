return {
  -- Lualine - Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      -- VSCode-inspired colors (Gruvbox themed)
      local colors = {
        bg = '#1d2021',
        fg = '#ebdbb2',
        yellow = '#fabd2f',
        cyan = '#83a598',
        green = '#b8bb26',
        orange = '#fe8019',
        violet = '#d3869b',
        magenta = '#d3869b',
        blue = '#83a598',
        red = '#fb4934',
        grey = '#928374',
        dark_grey = '#282828',
      }

      local vscode_theme = {
        normal = {
          a = { fg = colors.dark_grey, bg = colors.blue, gui = 'bold' },
          b = { fg = colors.fg, bg = colors.dark_grey },
          c = { fg = colors.grey, bg = colors.bg },
        },
        insert = { a = { fg = colors.dark_grey, bg = colors.green, gui = 'bold' } },
        visual = { a = { fg = colors.dark_grey, bg = colors.violet, gui = 'bold' } },
        replace = { a = { fg = colors.dark_grey, bg = colors.red, gui = 'bold' } },
        command = { a = { fg = colors.dark_grey, bg = colors.yellow, gui = 'bold' } },
        inactive = {
          a = { fg = colors.grey, bg = colors.bg },
          b = { fg = colors.grey, bg = colors.bg },
          c = { fg = colors.grey, bg = colors.bg },
        },
      }

      require("lualine").setup({
        options = {
          theme = vscode_theme,
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          always_divide_middle = true,
          globalstatus = true,  -- Single statusline for all windows (like VSCode)
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                return ' ' .. str:sub(1,1)
              end,
            }
          },
          lualine_b = {
            {
              'branch',
              icon = '',
            },
            {
              'diff',
              symbols = { added = ' ', modified = ' ', removed = ' ' },
              colored = true,
            },
          },
          lualine_c = {
            {
              'filename',
              file_status = true,
              path = 1,  -- Relative path
              shorting_target = 40,
              symbols = {
                modified = ' ●',
                readonly = ' ',
                unnamed = '[No Name]',
              }
            },
          },
          lualine_x = {
            {
              'filetype',
              colored = true,
              icon_only = false,
              icon = { align = 'right' },
            },
            'encoding',
            {
              'fileformat',
              symbols = {
                unix = 'LF',
                dos = 'CRLF',
                mac = 'CR',
              }
            },
          },
          lualine_y = {
            'progress',
          },
          lualine_z = {
            {
              'location',
              fmt = function(str)
                return ' ' .. str
              end,
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { 'nvim-tree', 'lazy', 'fzf' },
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
          mode = "buffers",
          style_preset = {
            require('bufferline').style_preset.no_italic,
            require('bufferline').style_preset.no_bold,
          },
          themable = true,
          separator_style = "thick", -- macOS-like tabs
          indicator = {
            icon = '▎',
            style = 'icon',
          },
          buffer_close_icon = '',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          diagnostics = false, -- Clean look, no diagnostics in tabs
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = false,
          show_tab_indicators = true,
          color_icons = true,
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
          },
          offsets = {
            {
              filetype = "NvimTree",
              text = "  Explorer",
              text_align = "left",
              separator = true,
            },
          },
        },
        highlights = {
          fill = {
            bg = '#1d2021',
          },
          background = {
            bg = '#282828',
          },
          buffer_selected = {
            fg = '#fbf1c7',
            bg = '#3c3836',
            bold = false,
            italic = false,
          },
          buffer_visible = {
            fg = '#a89984',
            bg = '#282828',
          },
          modified = {
            fg = '#fabd2f',
          },
          modified_selected = {
            fg = '#fabd2f',
            bg = '#3c3836',
          },
          separator = {
            fg = '#1d2021',
            bg = '#282828',
          },
          separator_selected = {
            fg = '#1d2021',
            bg = '#3c3836',
          },
          indicator_selected = {
            fg = '#83a598',
            bg = '#3c3836',
          },
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
