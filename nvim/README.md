# Neovim Configuration

Minimal but functional Neovim configuration for working with C++, Python, Lua, and C.

## Installation

1. Make sure you have Neovim installed (version 0.8+):
   ```bash
   nvim --version
   ```

2. First launch:
   ```bash
   nvim
   ```
   All plugins will be installed automatically on first launch.

## Main Features

### Syntax Highlighting
- Support for C, C++, Python, Lua via Treesitter
- Automatic parser installation when opening files

### LSP (Language Server Protocol)
- **C/C++**: clangd
- **Python**: pylsp
- **Lua**: lua_ls

### Keybindings

#### General
- `<Space>` - leader key
- `<Space>w` - save file
- `<Space>q` - quit
- `<Space>x` - save and quit

#### Mode Switching
- `jk` or `kj` - exit insert mode to normal mode
- `jk` or `kj` - exit visual mode to normal mode  
- `jk` or `kj` - exit command mode

#### Buffer Navigation
- `Tab` - next buffer
- `Shift+Tab` - previous buffer
- `<Space>bd` - close buffer

#### Window Navigation
- `Ctrl+h/j/k/l` - move between windows

#### LSP Functions
- `gd` - go to definition
- `gD` - go to declaration
- `gr` - find all references
- `gi` - find implementations
- `K` - show documentation
- `<Space>rn` - rename symbol
- `<Space>ca` - code actions
- `<Space>f` - format code
- `[d` / `]d` - previous/next error
- `<Space>e` - show error in floating window

#### Search (Telescope)
- `<Space>ff` - find files
- `<Space>fg` - live grep
- `<Space>fb` - find buffers
- `<Space>fh` - help tags

#### File Manager
- `<Space>e` - toggle file tree

#### Autocompletion
- `Ctrl+Space` - force open completion menu
- `Enter` - confirm selection
- `Tab` / `Shift+Tab` - navigate options
- `Ctrl+e` - close menu

#### Commenting
- `gcc` - toggle line comment
- `gc` - comment selected block (in visual mode)

#### Terminal
- `<Space>th` - open terminal horizontally (bottom split)
- `<Space>tv` - open terminal vertically (right split)  
- `<Space>tt` - open terminal in new tab
- `<Space>tf` - open floating terminal
- `Ctrl+h/j/k/l` - navigate from terminal to other windows
- `Esc` - exit terminal mode to normal mode
- `q` - close floating terminal (in normal mode)
- `Ctrl+q` - close floating terminal (in terminal mode)

## Configuration Structure

```
~/.config/nvim/
├── init.lua              # Main configuration file
├── lua/
│   ├── options.lua       # Basic editor settings
│   ├── keymaps.lua       # Keybindings
│   └── plugins/          # Plugin configuration
│       ├── colorscheme.lua
│       ├── treesitter.lua
│       ├── lsp.lua
│       ├── completion.lua
│       └── ui.lua
```

## Installed Plugins

- **lazy.nvim** - plugin manager
- **catppuccin** - color scheme
- **nvim-treesitter** - syntax highlighting
- **mason.nvim** - LSP server management
- **nvim-lspconfig** - LSP configuration
- **nvim-cmp** - autocompletion
- **telescope.nvim** - file search
- **nvim-tree.lua** - file manager
- **lualine.nvim** - status line
- **Comment.nvim** - commenting
- **nvim-autopairs** - auto-close brackets

## Getting Started

1. Open a C++, Python, or Lua file
2. LSP server will start automatically
3. Try navigation: hover over a function and press `gd`
4. Use `K` to view documentation
5. Try autocompletion: start typing and press `Ctrl+Space`

## Extending Configuration

To add new plugins, create a file in `~/.config/nvim/lua/plugins/` and add the plugin configuration.
