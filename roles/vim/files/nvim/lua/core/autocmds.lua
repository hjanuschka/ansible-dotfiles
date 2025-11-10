-- ============================================================================
-- Autocommands
-- ============================================================================

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
augroup("highlight_yank", { clear = true })
autocmd("TextYankPost", {
  group = "highlight_yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
  end,
})

-- Binary file editing (JPEG as hex)
augroup("Binary", { clear = true })
autocmd("BufReadPre", {
  group = "Binary",
  pattern = "*.jpeg",
  callback = function()
    vim.bo.bin = true
  end,
})
autocmd("BufReadPost", {
  group = "Binary",
  pattern = "*.jpeg",
  callback = function()
    if vim.bo.bin then
      vim.cmd("%!xxd")
      vim.bo.ft = "xxd"
    end
  end,
})
autocmd("BufWritePre", {
  group = "Binary",
  pattern = "*.jpeg",
  callback = function()
    if vim.bo.bin then
      vim.cmd("%!xxd -r")
    end
  end,
})
autocmd("BufWritePost", {
  group = "Binary",
  pattern = "*.jpeg",
  callback = function()
    if vim.bo.bin then
      vim.cmd("%!xxd")
      vim.bo.modified = false
    end
  end,
})

-- Force autoindent on buffer read
autocmd("BufReadPost", {
  callback = function()
    vim.bo.autoindent = true
  end,
})

-- Cursorline only in active window
augroup("cursorline", { clear = true })
autocmd({ "WinEnter", "BufEnter" }, {
  group = "cursorline",
  callback = function()
    vim.wo.cursorline = true
  end,
})
autocmd({ "WinLeave", "BufLeave" }, {
  group = "cursorline",
  callback = function()
    vim.wo.cursorline = false
  end,
})

-- Wrap long lines in quickfix
augroup("quickfix", { clear = true })
autocmd("FileType", {
  group = "quickfix",
  pattern = "qf",
  callback = function()
    vim.wo.wrap = true
  end,
})

-- Reload config on save
augroup("myvimrc", { clear = true })
autocmd("BufWritePost", {
  group = "myvimrc",
  pattern = { "init.lua", "init.vim", ".vimrc", "_vimrc", "vimrc", ".gvimrc", "_gvimrc", "gvimrc" },
  callback = function()
    vim.cmd("source $MYVIMRC")
  end,
})

-- PHP filetype settings
autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.opt_local.iskeyword:append("$")
  end,
})

-- Show diagnostics on cursor hold
autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
