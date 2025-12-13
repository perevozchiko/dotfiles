# Neovim (NvChad) Configuration

This directory contains **custom configurations** for NvChad.

## Structure

```
~/.config/nvim/          # NvChad base (managed by git)
├── init.lua             # NvChad entry point
└── lua/  → symlink to ~/dotfiles/nvim/lua/

~/dotfiles/nvim/lua/     # Your custom configs (tracked in dotfiles)
├── chadrc.lua           # NvChad main config
├── options.lua          # Neovim options
├── mappings.lua         # Keymappings
├── autocmds.lua         # Autocommands
├── configs/             # Plugin configurations
└── plugins/             # Plugin specs
```

## How it works

- **NvChad base** (`~/.config/nvim/`) is a git repository from NvChad/starter
- **Your configs** (`~/dotfiles/nvim/lua/`) are symlinked into NvChad
- Edit configs in `~/dotfiles/nvim/lua/` → changes automatically applied
- Update NvChad base: `cd ~/.config/nvim && git pull`

## Installation

Already set up! If you need to reinstall:

```bash
# Remove old nvim config
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim

# Clone NvChad starter
git clone https://github.com/NvChad/starter ~/.config/nvim

# Link your configs
rm -rf ~/.config/nvim/lua
ln -sf ~/dotfiles/nvim/lua ~/.config/nvim/lua

# Launch nvim (plugins will install automatically)
nvim
```

## Updating NvChad

```bash
cd ~/.config/nvim
git pull
```

Your custom configs in `~/dotfiles/nvim/lua/` are not affected!

## Adding LSP servers

```bash
# Inside nvim
:Mason

# Search and install:
# - clangd (C/C++)
# - lua_ls (Lua)
# - marksman (Markdown)
```

