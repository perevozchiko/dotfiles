# 🖥️ Dotfiles

Personal development environment configuration for macOS. Complete terminal setup optimized for **C/C++** development.

## 📦 What's Included

| Config | Symlink Location | Description |
|--------|------------------|-------------|
| `alacritty.toml` | `~/.config/alacritty/` | Terminal (Catppuccin, Nerd Font, hotkeys) |
| `skhdrc` | `~/.skhdrc` | System hotkeys (Ctrl+Cmd+T → Alacritty) |
| `zshrc` | `~/.zshrc` | Shell with starship, fzf, zoxide |
| `tmux.conf` | `~/.tmux.conf` | Multiplexer with vim navigation |
| `nvim/` | `~/.config/nvim/lua/` | Neovim (NvChad) with LSP |
| `vimrc` | `~/.vimrc` | Classic Vim config |

## ✨ Features

### 🎨 Alacritty Terminal
- **Catppuccin Mocha** theme
- **JetBrainsMono Nerd Font** (14pt)
- **Option as Alt** for tmux/nvim
- **Live reload** — no restart needed
- **50k lines** scrollback history
- `Cmd+N` new window, `Cmd+K` clear, `Cmd+±0` font size

### 🐚 Zsh Shell
- **Starship** prompt (fast, minimal)
- **fzf** — fuzzy finder (`Ctrl+R`, `Ctrl+T`)
- **zoxide** — smart cd (`z query`)
- **Git aliases** — `gaa`, `gcm`, `gps`, etc.
- Auto-suggestions and syntax highlighting

### 🖼️ Tmux
- **Prefix:** `Ctrl+A` (easier than Ctrl+B)
- **Vim navigation** — `Ctrl+H/J/K/L` works in tmux + nvim
- **Session persistence** — auto-save/restore (tmux-resurrect)
- **Mouse support** enabled
- Split: `Prefix+|` (vertical), `Prefix+-` (horizontal)

### ⚡ Neovim (NvChad)
- **LSP:** clangd (C/C++), lua_ls, marksman, lemminx
- **Treesitter:** smart syntax highlighting
- **Telescope:** fuzzy finder, live grep
- **Git:** Neogit + Diffview + gitsigns
  - Stage/discard hunks or individual lines
  - Visual diff viewer
  - Full Git UI in nvim
- **Mason:** LSP/tool installer
- **Autopairs**, **snippets**, **formatting**

### ⌨️ System Hotkeys (skhd)
- `Ctrl+Cmd+T` — Launch Alacritty from anywhere

## 🚀 Quick Start

### Prerequisites

```bash
# Install Xcode tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Installation

```bash
# Clone repository
git clone git@github.com:perevozchiko/dotfiles.git ~/personal/projects/dotfiles
cd ~/personal/projects/dotfiles

# Install tools
brew install --cask alacritty font-jetbrains-mono-nerd-font
brew install koekeishiya/formulae/skhd neovim tmux starship zoxide fzf ripgrep fd

# Create symlinks
ln -sf $(pwd)/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf $(pwd)/skhdrc ~/.skhdrc
ln -sf $(pwd)/zshrc ~/.zshrc
ln -sf $(pwd)/tmux.conf ~/.tmux.conf

# Setup Neovim
git clone https://github.com/NvChad/starter ~/.config/nvim
rm -rf ~/.config/nvim/lua
ln -sf $(pwd)/nvim/lua ~/.config/nvim/lua

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Start services
skhd --start-service
```

### Post-Installation

1. **Grant skhd Accessibility permission:**
   - System Settings → Privacy & Security → Accessibility
   - Add `/opt/homebrew/bin/skhd` ✅

2. **First tmux launch:**
   ```bash
   tmux new -s main
   # Press: Ctrl+A then I  (install plugins)
   ```

3. **First nvim launch:**
   ```bash
   nvim
   # Plugins install automatically
   # Then: :Mason  (install LSP servers)
   ```

## 📚 Documentation

- **[HOTKEYS.md](HOTKEYS.md)** — Complete hotkey reference (print this!)
- **[nvim/SETUP.md](nvim/SETUP.md)** — Neovim LSP setup guide

## 🔧 For C/C++ Projects

Generate `compile_commands.json` for clangd:

```bash
cmake -S . -B build -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
ln -sf $(pwd)/build/compile_commands.json $(pwd)/compile_commands.json
```

Then nvim will provide:
- Smart autocomplete
- Go to definition (`gd`)
- Find references (`gr`)
- Real-time error checking

## 🔄 Workflow

### Daily Usage
```bash
# Launch terminal anywhere
Ctrl+Cmd+T

# Start tmux session
tmux new -s work

# Quick navigation
z myproject          # Jump to directory (zoxide)
nvim                 # Start editing

# Git workflow in nvim
Space+g+g            # Open Neogit
s                    # Stage hunks
c c                  # Commit
P p                  # Push
```

### Updating

```bash
cd ~/personal/projects/dotfiles
git pull

# Update nvim plugins
nvim "+Lazy sync" +qa

# Update tmux plugins
tmux
# Ctrl+A then U
```

## 📂 Structure

```
dotfiles/
├── alacritty.toml       # Terminal
├── skhdrc               # System hotkeys
├── zshrc                # Shell
├── tmux.conf            # Multiplexer
├── nvim/                # Neovim
│   ├── lua/
│   │   ├── chadrc.lua
│   │   ├── options.lua
│   │   ├── mappings.lua
│   │   ├── configs/
│   │   └── plugins/
│   ├── SETUP.md
│   └── README.md
├── HOTKEYS.md           # Complete hotkeys reference
└── README.md
```

## 🎯 Key Bindings Highlights

### Neovim
- `Space+ff` — Find files
- `Space+fw` — Search in project
- `Space+gg` — Git UI (Neogit)
- `Space+gd` — Visual diff
- `gd` — Go to definition
- `K` — Documentation

### Tmux
- `Ctrl+A |` — Split vertical
- `Ctrl+H/J/K/L` — Navigate panes (vim-aware!)
- `Prefix c` — New window
- `Prefix d` — Detach

### Zsh
- `Ctrl+R` — Search history (fzf)
- `z query` — Smart cd (zoxide)
- `gaa` → `git add .`
- `gcm "msg"` → `git commit -m`

See **[HOTKEYS.md](HOTKEYS.md)** for complete reference!

## 🐛 Troubleshooting

### skhd hotkey doesn't work
```bash
ps aux | grep skhd           # Check if running
cat /tmp/skhd_$USER.err.log  # Check logs
```
Grant Accessibility permission in System Settings.

### Neovim LSP not working
```bash
:checkhealth                 # Check nvim health
:Mason                       # Install LSP servers
```
For C++ projects, generate `compile_commands.json`.

### tmux colors wrong
Check `TERM` in tmux:
```bash
echo $TERM    # Should be: tmux-256color
```

## 📄 License

MIT License

## 🙏 Credits

- [NvChad](https://nvchad.com/) — Neovim config
- [Catppuccin](https://github.com/catppuccin/catppuccin) — Color scheme
- [Alacritty](https://github.com/alacritty/alacritty) — Terminal
- [skhd](https://github.com/koekeishiya/skhd) — Hotkey daemon
- [Starship](https://starship.rs/) — Prompt
