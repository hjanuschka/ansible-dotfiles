-- ============================================================================
-- Neovim Configuration - Modern Lua Setup with lazy.nvim
-- ============================================================================

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core configuration
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Setup lazy.nvim
require("lazy").setup("plugins", {
  defaults = {
    lazy = true,
    version = false, -- Use HEAD for latest features
  },
  install = {
    colorscheme = { "gruvbox" },
  },
  checker = {
    enabled = false, -- Disable auto-checking for updates (performance)
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      paths = {},
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "rplugin",
        "bugreport",
        "compiler",
        "ftplugin",
        "optwin",
        "synmenu",
      },
    },
  },
  ui = {
    border = "rounded",
  },
})
