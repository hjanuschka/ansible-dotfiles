# Neovim Configuration Migration

## Summary

Successfully migrated from vim-plug + init.vim to lazy.nvim + pure Lua configuration.

## Changes

### Structure

**Old:**
```
~/.config/nvim/
  └── init.vim (single file, ~780 lines, mixed vimscript/lua)
```

**New:**
```
~/.config/nvim/
  ├── init.lua (main entry point)
  ├── lua/
  │   ├── core/
  │   │   ├── options.lua (all vim settings)
  │   │   ├── keymaps.lua (all keybindings)
  │   │   └── autocmds.lua (all autocommands)
  │   └── plugins/
  │       ├── colorscheme.lua (gruvbox)
  │       ├── lsp.lua (LSP configuration)
  │       ├── completion.lua (nvim-cmp)
  │       ├── treesitter.lua
  │       ├── ui.lua (lualine, bufferline, nvim-tree)
  │       ├── git.lua (gitsigns, lazygit)
  │       ├── fzf.lua (fzf-lua)
  │       └── utilities.lua (misc plugins)
```

### Backups

- `init.vim.old` - Original before improvements
- `init.vim.backup` - After improvements, before migration
- `init.vim.disabled` - Final vim config (can be deleted)

### Benefits

1. **Lazy Loading** - Plugins load on-demand (faster startup)
2. **Pure Lua** - No more vimscript/lua mixing
3. **Modular** - Easy to find and edit specific config
4. **Modern** - Uses lazy.nvim (most popular plugin manager)
5. **Cleaner** - Better organized, easier to maintain

### Key Features Preserved

- All keybindings (leader = `,`)
- LSP setup with lsp-zero, mason
- PHP/Intelephense configuration
- Gruvbox colorscheme with hard contrast
- FZF fuzzy finding
- Git integration (gitsigns, lazygit)
- All autocmds and settings
- Diagnostic configuration (no signs, no virtual text)

### First Launch

On first nvim launch, lazy.nvim will:
1. Auto-install itself
2. Install all plugins automatically
3. May take 1-2 minutes

### Keybindings Reference

**File Navigation:**
- `Ctrl+p` - Find git files
- `Ctrl+x` - Find buffers
- `Ctrl+o` - Grep search
- `Leader+r` - Resume last search

**LSP:**
- `Leader+ca` - Code action
- `Leader+rn` - Rename
- `gl` - Show diagnostics

**Buffers:**
- `Leader+bp` - Pick buffer
- `Leader+bc` - Close buffer
- `Ctrl+Left/Right` - Cycle buffers
- `-` - Switch to previous buffer

**Window Navigation:**
- `Ctrl+h/j/k/l` - Navigate windows

**Editing:**
- `Alt+Up/Down` - Move lines up/down
- `Ctrl+s` - Save
- `Ctrl+z/y` - Undo/Redo
- `Y` - Yank to SSH clipboard

**Quickfix:**
- `]q` / `[q` - Next/previous
- `]Q` / `[Q` - Last/first

### Rollback

To restore old config:
```bash
cd ~/.config/nvim
rm init.lua
rm -rf lua/
mv init.vim.disabled init.vim
```

### Troubleshooting

**If plugins don't load:**
- Launch nvim and wait for lazy.nvim to install
- Run `:Lazy` to see plugin status
- Run `:Lazy sync` to update all plugins

**If LSP doesn't work:**
- Run `:Mason` to install language servers
- Run `:LspInfo` to check LSP status

**If you see deprecation warnings:**
- These are suppressed in the LSP config
- They're from lspconfig v2 and will be fixed in v3

### Performance

Initial startup will be slower (plugin installation), but subsequent startups should be much faster due to lazy loading.

Run `:Lazy profile` to see plugin load times.
