-- ============================================================================
-- Keymaps
-- ============================================================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Map \ to : for quick commands
keymap("n", "\\", ":", { noremap = true })

-- Switch to previous buffer
keymap("n", "-", ":b#<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move lines up/down (Alt+Up/Down)
keymap("n", "<M-Up>", ":<C-U>exec \"exec 'norm m`' \\| move -\" . (1+v:count1)<CR>``", opts)
keymap("n", "<M-Down>", ":<C-U>exec \"exec 'norm m`' \\| move +\" . (0+v:count1)<CR>``", opts)
keymap("i", "<M-Up>", "<C-O>m`<C-O>:move -2<CR><C-O>``", opts)
keymap("i", "<M-Down>", "<C-O>m`<C-O>:move +1<CR><C-O>``", opts)
keymap("v", "<M-Up>", ":<C-U>exec \"'<,'>move '<-\" . (1+v:count1)<CR>gv", opts)
keymap("v", "<M-Down>", ":<C-U>exec \"'<,'>move '>+\" . (0+v:count1)<CR>gv", opts)

-- Quickfix navigation
keymap("n", "]q", ":cnext<CR>", opts)
keymap("n", "[q", ":cprevious<CR>", opts)
keymap("n", "]Q", ":clast<CR>", opts)
keymap("n", "[Q", ":cfirst<CR>", opts)

-- Close all buffers
keymap("n", "<leader>bd", ":%bd|e#|bd#<CR>", opts)

-- Netrw (file explorer)
keymap("n", "<Leader>pv", ":wincmd v<bar> :Ex <bar> :vertical resize 30<CR>", opts)

-- OSCYank - yank to SSH clipboard
keymap("v", "Y", ":OSCYankVisual<CR>", opts)
keymap("n", "Y", ":OSCYankVisual<CR>", opts)

-- Copy current file path to clipboard and yank to SSH
keymap("n", "<C-x>", ":let @0 = expand('%')<CR>:OSCYankRegister 0<CR>", opts)

-- Save file
keymap("n", "<C-S>", ":w<CR>", opts)
keymap("v", "<C-S>", "<C-C>:w<CR>", opts)
keymap("i", "<C-S>", "<Esc>:w<CR>", opts)

-- Clear search highlighting
keymap("n", "<C-L>", ":nohlsearch<CR><C-L>", opts)

-- Indentation
keymap("v", "<Tab>", ">", opts)
keymap("v", "<S-Tab>", "<", opts)

-- Undo/Redo
keymap("n", "<C-z>", ":undo<CR>", opts)
keymap("i", "<C-z>", "<Esc>:undo<CR>", opts)
keymap("n", "<C-y>", ":redo<CR>", opts)
keymap("i", "<C-y>", "<Esc>:redo<CR>", opts)

-- BufferLine navigation
keymap("n", "<C-Left>", ":BufferLineCyclePrev<CR>", opts)
keymap("i", "<C-Left>", "<Esc>:BufferLineCyclePrev<CR>i", opts)
keymap("n", "<C-Right>", ":BufferLineCycleNext<CR>", opts)
keymap("i", "<C-Right>", "<Esc>:BufferLineCycleNext<CR>i", opts)

-- FZF keybindings (will be loaded with lazy.nvim)
keymap("n", "<C-p>", ":FzfLua git_files<CR>", opts)
keymap("i", "<C-p>", "<ESC>:FzfLua git_files<CR>", opts)
keymap("n", "<C-x>", ":FzfLua buffers<CR>", { noremap = true, silent = true, desc = "Find buffers" })
keymap("i", "<C-x>", "<ESC>:FzfLua buffers<CR>", opts)
keymap("n", "<Leader>r", ":FzfLua resume<CR>", opts)
keymap("i", "<Leader>r", "<ESC>:FzfLua resume<CR>", opts)
keymap("n", "<C-o>", ":Rgr<CR>", opts)
keymap("i", "<C-o>", "<ESC>:Rgr<CR>", opts)

-- Focus events (F24/F25 for terminal focus)
keymap("i", "<F24>", "<C-\\><C-O>:silent doautocmd FocusLost %<CR>", opts)
keymap("i", "<F25>", "<C-\\><C-O>:silent doautocmd FocusGained %<CR>", opts)
