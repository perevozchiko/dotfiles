# Personal Dotfiles

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

## 📋 Requirements

### Minimum System Requirements
- **Git** - for cloning the repository
- **Bash** - for running the installation script
- **Internet connection** - for downloading packages

### Supported Systems
- **macOS** 10.15+ (Catalina and newer)
- **Ubuntu** 18.04+ / **Debian** 10+
- **RedHat** 8+ / **CentOS** 8+ / **Fedora** 30+
- **Other Linux** distributions (manual package installation required)

### Auto-installed Dependencies
The installation script will automatically install these if missing:
- **Homebrew** (macOS only)
- **curl**, **git** (Linux only - usually pre-installed)

## 🛠 Installation

### Automatic Setup (Recommended)
```bash
# Clone repository
git clone <your-repo-url> ~/personal/projects/dotfiles
cd ~/personal/projects/dotfiles

# Full installation (packages + configs) - RECOMMENDED
./install.sh

# Or install only configs (skip package installation)
./install.sh --skip-packages

# Show help and available options
./install.sh --help
```

### 🌍 Cross-Platform Support
The installation script automatically detects your operating system and installs packages using the appropriate package manager:

| OS | Package Manager | Status |
|---|---|---|
| **macOS** | Homebrew | ✅ Full support |
| **Ubuntu/Debian** | apt + snap | ✅ Full support |
| **RedHat/CentOS/Fedora** | dnf/yum | ✅ Full support |
| **Other Linux** | Manual | ⚠️ Manual installation required |

### 📦 Smart Package Installation
The script intelligently handles package installation:

- **🔍 Auto-detection**: Detects already installed packages to avoid reinstalls
- **🍺 Homebrew Setup**: Automatically installs Homebrew on macOS if missing
- **⚡ Fast Installation**: Skips packages that are already present
- **🎯 Fallback Options**: Uses snap for Alacritty on older Ubuntu versions
- **🛡️ Error Handling**: Graceful handling of installation failures

### 📋 Packages Installed Automatically
| Package | Purpose | macOS | Linux |
|---|---|---|---|
| **neovim** | Modern text editor with LSP support | ✅ | ✅ |
| **tmux** | Terminal multiplexer | ✅ | ✅ |
| **alacritty** | GPU-accelerated terminal | ✅ | ✅ (via snap) |
| **fd** | Fast file finder (for Telescope) | ✅ | ✅ (fd-find) |
| **ripgrep** | Fast text search (for Telescope) | ✅ | ✅ |
| **curl** | HTTP client (for downloads) | Built-in | ✅ |
| **git** | Version control | Built-in | ✅ |

### 🚀 Installation Examples

**Fresh system setup:**
```bash
# Clone and install everything
git clone <your-repo-url> ~/personal/projects/dotfiles
cd ~/personal/projects/dotfiles
./install.sh

# Output example:
# 🚀 Installing Personal Dotfiles...
# 🍎 Detected macOS
# 📦 Installing packages via Homebrew...
# ✓ neovim already installed
# 📦 Installing alacritty...
# ✅ Package installation completed
```

**Config-only installation:**
```bash
# Skip package installation (useful for servers or restricted environments)
./install.sh --skip-packages
```

**Help and options:**
```bash
# Show all available options
./install.sh --help
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

## ❓ FAQ & Troubleshooting

### Installation Issues

**Q: "Permission denied" when running install.sh**
```bash
# Make the script executable
chmod +x install.sh
./install.sh
```

**Q: "Homebrew not found" on macOS**
- The script will automatically install Homebrew for you
- If it fails, install manually: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

**Q: "Package not found" on Linux**
```bash
# Update package lists first
sudo apt update  # Ubuntu/Debian
sudo dnf update  # RedHat/Fedora

# Then run the installer
./install.sh
```

**Q: Alacritty fails to install on Ubuntu**
- The script will try snap installation as fallback
- Manual installation: `sudo add-apt-repository ppa:aslatter/ppa && sudo apt install alacritty`

### Configuration Issues

**Q: Neovim plugins not loading**
```bash
# Open Neovim and let plugins install automatically
nvim
# Wait for lazy.nvim to install all plugins
```

**Q: LSP not working for C++**
- Ensure you have `compile_commands.json` in your project root
- See `nvim/CLANGD-PROJECT-SETUP.md` for detailed setup

**Q: Terminal colors look wrong**
- Ensure your terminal supports true colors
- For tmux: the configuration handles this automatically

### Uninstallation

**Q: How to remove dotfiles?**
```bash
# Remove symlinks
rm ~/.config/nvim ~/.tmux.conf ~/.zshrc ~/.config/alacritty/alacritty.toml

# Restore backups if they exist
mv ~/.tmux.conf.backup ~/.tmux.conf  # if exists
mv ~/.zshrc.backup ~/.zshrc          # if exists
# etc.
```

## 📊 Project Structure

```
dotfiles/
├── README.md           # This file
├── LICENSE             # MIT License
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

- **🔧 C++ Development** (C++17, CMake, clangd)
- **⚡ Terminal Workflow** (tmux + neovim integration)
- **🌍 Cross-Platform** (macOS, Ubuntu, Debian, RedHat, CentOS, Fedora)
- **🚀 Performance** (fast startup, efficient caching, smart package detection)
- **🎨 Modern UI** (Catppuccin theme, floating terminals, seamless navigation)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### What this means:
- ✅ **Use** - Use the code for any purpose
- ✅ **Modify** - Change and adapt the code as needed
- ✅ **Distribute** - Share the original or modified code
- ✅ **Commercial use** - Use in commercial projects
- ✅ **Private use** - Use in private projects
- ⚠️ **No warranty** - The code is provided "as is"

---

**Last Updated**: $(date)
**Neovim Version**: 0.11+
**Tmux Version**: 3.0+

