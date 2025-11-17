-- Lightweight visual polish for better optics
return {
  -- Indent-blankline - Subtle indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = false,  -- Disable scope highlighting (too noisy for C++)
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  },

  -- Mini.indentscope - Shows current scope (alternative to indent-blankline scope)
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- Illuminate - Highlight same words under cursor
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "NvimTree",
        "Trouble",
      },
      under_cursor = true,
      min_count_to_highlight = 2,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      -- Keybindings for jumping between references
      vim.keymap.set("n", "]]", function()
        require("illuminate").goto_next_reference(false)
      end, { desc = "Next Reference" })
      vim.keymap.set("n", "[[", function()
        require("illuminate").goto_prev_reference(false)
      end, { desc = "Prev Reference" })
    end,
  },

  -- Better color column (only shows when line exceeds limit)
  {
    "Bekaboo/deadcolumn.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      scope = "line",  -- Only show on lines that exceed
      modes = { "i", "ic", "ix", "R", "Rc", "Rx", "Rv", "Rvc", "Rvx" },
      blending = {
        threshold = 0.75,
        colorcode = "#000000",
        hlgroup = { "Normal", "bg" },
      },
      warning = {
        alpha = 0.4,
        offset = 0,
        colorcode = "#FF0000",
        hlgroup = { "Error", "bg" },
      },
    },
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing_function = "quadratic",
      pre_hook = nil,
      post_hook = nil,
    },
  },
}
