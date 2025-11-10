return {
  -- LSP Zero - Easy LSP configuration
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = false,
    config = false,
  },

  -- Mason - LSP installer
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  -- Mason LSP config integration
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {},
    },
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      -- Suppress lspconfig deprecation warnings
      local notify = vim.notify
      local deprecate = vim.deprecate

      vim.notify = function(msg, ...)
        if msg:match("lspconfig") or msg:match("buf_get_clients") then
          return
        end
        notify(msg, ...)
      end

      vim.deprecate = function(name, alternative, version, plugin, backtrace)
        if name and (name:match("buf_get_clients") or name:match("lspconfig") or name == "vim.lsp.buf_get_clients") then
          return
        end
        deprecate(name, alternative, version, plugin, backtrace)
      end

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })

        -- Additional keybindings
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = bufnr, desc = "Line Diagnostics" })
      end)

      require("mason-lspconfig").setup({
        handlers = {
          lsp_zero.default_setup,
        },
      })

      -- PHP/Intelephense configuration
      local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
      if lspconfig_ok then
        lspconfig.intelephense.setup({
          settings = {
            intelephense = {
              stubs = {
                "bcmath", "bz2", "calendar", "Core", "curl", "zip", "zlib",
                "wordpress", "woocommerce", "acf-pro", "wordpress-globals",
                "wp-cli", "genesis", "polylang"
              },
            },
          },
        })
      end

      -- Restore notifications
      vim.notify = notify
      vim.deprecate = deprecate

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        update_in_insert = false,
        underline = false,
        float = {
          source = "always",
        },
      })

      -- Diagnostic signs (even though signs are disabled, define them for consistency)
      vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarning", { text = "", texthl = "DiagnosticSignWarning" })
      vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInformation" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
    end,
  },

  -- LSP Signature
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup({
        use_diagnostic_signs = true,
      })
    end,
  },

  -- LSP Kind
  {
    "onsails/lspkind-nvim",
    lazy = true,
    config = function()
      require("lspkind").init()
    end,
  },

  -- LSP Status
  {
    "nvim-lua/lsp-status.nvim",
    lazy = true,
  },

  -- LSP Colors
  {
    "folke/lsp-colors.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp-colors").setup({
        Error = "#db4b4b",
        Warning = "#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981",
      })
    end,
  },

  -- Trouble - Diagnostics window
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    opts = {
      use_diagnostic_signs = true,
    },
  },
}
