# Andrei's Dotfiles

My personal configuration files for development environment.

## 📁 What's Included

- **alacritty.toml** → `~/.config/alacritty/alacritty.toml` - Alacritty terminal configuration
- **tmux.conf** → `~/.tmux.conf` - Tmux configuration with vim-style navigation
- **zshrc** → `~/.zshrc` - Zsh shell configuration
- **nvim/** → `~/.config/nvim/` - Neovim configuration with LSP and plugins

## 🔗 Dotfiles Structure

This repository contains the **actual configuration files**, and the home directory has **symbolic links** pointing to them. This means:

- ✅ **Version controlled**: All configs are tracked in git with full history
- ✅ **Centralized**: All configurations in one place for easy management
- ✅ **Portable**: Easy to set up on new machines with install script
- ✅ **Live editing**: Edit configs normally, changes are immediately active

## 🚀 Features

### Neovim
- **LSP Support**: clangd (C++), pylsp (Python), lua_ls (Lua)
- **Smart Navigation**: Go to definition, find references, hover documentation
- **File Search**: Telescope for fuzzy file finding and live grep
- **Syntax Highlighting**: Treesitter for accurate highlighting
- **Autocompletion**: nvim-cmp with LSP integration
- **Git Integration**: Signs and navigation
- **Modern UI**: Catppuccin theme, lualine status bar

### Tmux
- **Vim Integration**: Seamless navigation between tmux panes and vim splits
- **Smart Keybindings**: Ctrl+hjkl works in both tmux and neovim
- **Copy Mode**: Vim-style text selection and copying
- **Mouse Support**: Click to select panes and resize

### Development Setup
- **C++17 Support**: Optimized for C++ project development
- **clangd Integration**: Background indexing, compile_commands.json support
- **Performance Optimized**: Caches ignored in git, fast startup

## 🛠 Installation

### Automatic Setup
```bash
# Clone repository
git clone <your-repo-url> ~/personal/projects/dotfiles
cd ~/personal/projects/dotfiles

# Run setup script
./install.sh
```

### Manual Setup
The configs are already linked if you're on the same machine. For new machines:

```bash
# Link terminal config
ln -sf ~/personal/projects/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml

# Link tmux config  
ln -sf ~/personal/projects/dotfiles/tmux.conf ~/.tmux.conf

# Link shell config
ln -sf ~/personal/projects/dotfiles/zshrc ~/.zshrc

# Link neovim config
ln -sf ~/personal/projects/dotfiles/nvim ~/.config/nvim
```

## 📝 Usage

### Key Bindings (Neovim)

#### Mode Switching
- `jk` or `kj` - Exit insert/visual/command mode to normal

#### Navigation
- `Ctrl+h/j/k/l` - Navigate between tmux panes and vim splits
- `gd` - Go to definition
- `gr` - Find references  
- `K` - Show documentation

#### File Operations
- `<Space>ff` - Find files (Telescope)
- `<Space>fg` - Live grep in files
- `<Space>e` - Toggle file tree

#### Code Actions
- `<Space>ca` - Code actions
- `<Space>f` - Format code
- `<Space>rn` - Rename symbol

#### Terminal
- `<Space>th` - Open terminal horizontally (bottom)
- `<Space>tv` - Open terminal vertically (right)
- `<Space>tt` - Open terminal in new tab
- `<Space>tf` - Open floating terminal
- `Ctrl+q` - Close floating terminal (from terminal mode)
- `q` - Close floating terminal (from normal mode)

### Tmux Navigation
- `Ctrl+h/j/k/l` - Move between panes (works in both tmux and neovim)
- `Prefix + r` - Reload tmux config
- `Prefix + |` - Split vertically
- `Prefix + -` - Split horizontally

## 🔧 Customization

Edit any config file normally - changes will be reflected in the repository automatically since they're symlinked.

## 📊 Project Structure

```
dotfiles/
├── README.md           # This file
├── install.sh          # Installation script (executable)
├── alacritty.toml      # Alacritty terminal config
├── tmux.conf           # Tmux configuration
├── zshrc               # Zsh shell configuration
└── nvim/               # Neovim configuration
    ├── init.lua        # Main config file
    ├── lua/            # Lua configuration modules
    │   ├── options.lua # Editor settings
    │   ├── keymaps.lua # Key mappings
    │   ├── plugins/    # Plugin configurations
    │   └── ...         # Other modules
    └── README.md       # Neovim-specific documentation

# Home directory structure (after installation):
~/.config/alacritty/alacritty.toml -> ~/personal/projects/dotfiles/alacritty.toml
~/.tmux.conf -> ~/personal/projects/dotfiles/tmux.conf
~/.zshrc -> ~/personal/projects/dotfiles/zshrc
~/.config/nvim -> ~/personal/projects/dotfiles/nvim
```

## 🎯 Optimized For

- **C++ Development** (C++17, CMake, clangd)
- **Terminal Workflow** (tmux + neovim)
- **macOS Environment**
- **Performance** (fast startup, efficient caching)

---

**Last Updated**: $(date)
**Neovim Version**: 0.11+
**Tmux Version**: 3.0+

