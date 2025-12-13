# 🖥️ Dotfiles

Personal configuration files for macOS development environment.

## 📦 What's Included

| Config | Symlink Location | Description |
|--------|------------------|-------------|
| `alacritty.toml` | `~/.config/alacritty/alacritty.toml` | Terminal emulator (Catppuccin theme, hotkeys) |
| `skhdrc` | `~/.skhdrc` | System-wide hotkeys (Ctrl+Cmd+T → Alacritty) |
| `vimrc` | `~/.vimrc` | Classic Vim configuration |

## ✨ Features

### 🎨 Alacritty Terminal
- **Catppuccin Mocha** color scheme
- **JetBrainsMono Nerd Font** (14pt)
- **Option as Alt** — proper Alt/Meta keybindings for tmux/nvim
- **Live config reload** — changes apply instantly
- **Transparency** (80%) with blur effect
- **50k lines** scrollback history

**Hotkeys:**
- `Cmd+N` — New window
- `Cmd+K` — Clear screen
- `Cmd+F` — Fullscreen toggle
- `Cmd+±` — Font size
- `Cmd+0` — Reset font size
- `Cmd+Click URL` — Open in browser

### ⌨️ System Hotkeys (skhd)
- `Ctrl+Cmd+T` — Launch Alacritty from anywhere

## 🚀 Installation

### Prerequisites

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install required tools
brew install --cask alacritty
brew install --cask font-jetbrains-mono-nerd-font
brew install koekeishiya/formulae/skhd
```

### Setup Dotfiles

```bash
# Clone repository
git clone git@github.com:perevozchiko/dotfiles.git ~/dotfiles

# Create symlinks
ln -sf ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/dotfiles/skhdrc ~/.skhdrc
ln -sf ~/dotfiles/vimrc ~/.vimrc

# Start skhd service
skhd --start-service
```

### Grant Permissions

**skhd needs Accessibility permission:**

1. Open **System Settings** → **Privacy & Security** → **Accessibility**
2. Click 🔒 and authenticate
3. Click **+** and add `/opt/homebrew/bin/skhd`
4. Enable the checkbox ✅

## 🔄 Sync Changes

All configs use **symlinks** to this repository, so:

```bash
# Edit configs normally
vim ~/.config/alacritty/alacritty.toml


