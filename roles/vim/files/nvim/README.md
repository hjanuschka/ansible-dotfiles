# Neovim Configuration

Modern Neovim configuration using lazy.nvim and pure Lua.

## Structure

```
nvim/
├── init.lua                    # Entry point, bootstraps lazy.nvim
├── lua/
│   ├── core/
│   │   ├── options.lua         # All vim settings
│   │   ├── keymaps.lua         # All keybindings
│   │   └── autocmds.lua        # All autocommands
│   └── plugins/
│       ├── colorscheme.lua          # Gruvbox theme
│       ├── lsp.lua                  # LSP, Mason, diagnostics
│       ├── completion.lua           # nvim-cmp, LuaSnip
│       ├── treesitter.lua           # Syntax highlighting
│       ├── ui.lua                   # Lualine, Bufferline, NvimTree
│       ├── git.lua                  # Gitsigns, Lazygit
│       ├── fzf.lua                  # Fuzzy finding
│       ├── utilities.lua            # Misc plugins
│       └── visual-enhancements.lua  # Dropbar, Satellite, Illuminate
└── MIGRATION_NOTES.md          # Full migration details
```

## Installation

This config is symlinked via Ansible playbook:
```bash
ansible-playbook -i hosts local_env.yml --tags vim
```

Or manually:
```bash
ln -sf ~/dotfiles/roles/vim/files/nvim ~/.config/nvim
```

## First Launch

On first launch, lazy.nvim will auto-install and install all plugins.

## Requirements

- Neovim >= 0.9.0
- Git
- FZF (installed at `~/.fzf/bin/fzf`)
- ripgrep (for grep search)
- A Nerd Font (for icons)

## Key Features

- **Lazy loading** - Fast startup
- **LSP** - Full language server support with lsp-zero
- **Mason** - Easy LSP server installation
- **Fuzzy finding** - FZF integration
- **Git integration** - Gitsigns, lazygit
- **Treesitter** - Advanced syntax highlighting with large file optimization
- **Visual enhancements** - Breadcrumbs, scrollbar, symbol highlighting
- **Modular** - Easy to customize
- **Optimized for large C++ codebases** - Chromium-scale performance

## Leader Key

Leader key is `,` (comma)

## New Visual Enhancement Keybindings

- `Ctrl+Space` - Expand selection (incremental treesitter selection)
- `Backspace` - Shrink selection (in visual mode)
- `]]` - Jump to next reference of symbol under cursor
- `[[` - Jump to previous reference of symbol under cursor

## Performance Features

- **Large file handling** - Treesitter highlighting disabled in files >100KB
- **Symbol highlighting** - Shows all references to symbol under cursor (min 2 occurrences)
- **Breadcrumbs** - Winbar shows current code location (namespace::class::function)
- **Scrollbar** - Shows diagnostics, git changes, marks at a glance

See MIGRATION_NOTES.md for full keybinding reference.
