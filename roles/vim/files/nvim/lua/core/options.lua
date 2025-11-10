-- ============================================================================
-- Core Options
-- ============================================================================

local opt = vim.opt
local g = vim.g

-- Create backup/undo directories if they don't exist
local data_dir = vim.fn.stdpath("data")
local backup_dir = vim.fn.expand("$HOME/tmp/hjvim")
local undo_dir = vim.fn.expand("$HOME/tmp/hjvim/undo")

if vim.fn.isdirectory(backup_dir) == 0 then
  vim.fn.mkdir(backup_dir, "p", 0700)
end
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p", 0700)
end

-- General settings
opt.autoindent = true
opt.autoread = true
opt.backspace = "indent,eol,start"
opt.backup = false
opt.backupdir = backup_dir
opt.belloff = "all"
opt.breakindent = true
opt.cindent = false
opt.clipboard = "unnamedplus"
opt.cmdheight = 2
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0
opt.cursorline = true
opt.cursorlineopt = "number"
opt.directory = backup_dir
opt.encoding = "utf-8"
opt.equalalways = true
opt.fileencoding = "utf-8"
opt.fileformats = "unix,dos,mac"
opt.foldlevel = 2
opt.foldmethod = "syntax"
opt.foldnestmax = 10
opt.foldenable = false
opt.formatoptions:remove({ "c", "r", "o" })
opt.fsync = false
opt.guifont = "Hack Nerd Font:h16"
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.incsearch = true
opt.laststatus = 2
opt.linebreak = true
opt.list = true
opt.listchars = {
  tab = "→ ",
  trail = "·",
  nbsp = "␣",
  extends = "⟩",
  precedes = "⟨",
}
opt.mouse = "a"
opt.nrformats:remove("octal")
opt.number = true
opt.pumblend = 10
opt.pumheight = 15
opt.relativenumber = true
opt.ruler = true
opt.scrolloff = 8
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append("c")
opt.showbreak = "↪ "
opt.showcmd = true
opt.showmatch = false
opt.showmode = true
opt.showtabline = 2
opt.sidescrolloff = 8
opt.signcolumn = "no"
opt.smartcase = true
opt.smartindent = false
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.textwidth = 0
opt.ttimeout = true
opt.ttimeoutlen = 50
opt.ttyfast = true
opt.undodir = undo_dir
opt.undofile = true
opt.undolevels = 10000
opt.undoreload = 10000
opt.updatetime = 300
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildoptions = "pum"
opt.winblend = 0
opt.wrap = false
opt.wrapmargin = 0
opt.writebackup = false
opt.expandtab = true

-- Syntax highlighting
vim.cmd("syntax on")
vim.cmd("filetype off")

-- Disable matchparen
g.loaded_matchparen = 1

-- Go settings
g.go_gopls_enabled = 0
g.go_version_warning = 0

-- PHP settings
g.PHP_default_indenting = 1

-- Netrw settings
g.netrw_browse_split = 4

-- OSCYank settings
g.oscyank_term = 'default'

-- Float preview settings
g.float_preview_docked = 0

-- FZF settings
g.fzf_vim = {}
g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit'
}
