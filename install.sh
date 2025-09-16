#!/bin/bash

# Andrei's Dotfiles Installation Script

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

DOTFILES_DIR="$HOME/personal/projects/dotfiles"

echo -e "${BLUE}🚀 Installing Andrei's Dotfiles...${NC}"

# Function to create backup
backup_file() {
    if [ -f "$1" ] && [ ! -L "$1" ]; then
        echo -e "${YELLOW}📦 Backing up existing $1 to $1.backup${NC}"
        mv "$1" "$1.backup"
    fi
}

# Function to create symlink
create_symlink() {
    local source="$1"
    local target="$2"
    
    if [ -L "$target" ]; then
        echo -e "${YELLOW}🔗 Removing existing symlink: $target${NC}"
        rm "$target"
    fi
    
    # Create directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    echo -e "${GREEN}🔗 Linking $source -> $target${NC}"
    ln -sf "$source" "$target"
}

# Check if dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${RED}❌ Dotfiles directory not found: $DOTFILES_DIR${NC}"
    echo -e "${BLUE}Please clone the repository first:${NC}"
    echo "git clone <your-repo-url> $DOTFILES_DIR"
    exit 1
fi

cd "$DOTFILES_DIR"

echo -e "${BLUE}📁 Working in: $(pwd)${NC}"

# Install configurations
echo -e "\n${BLUE}🔧 Installing configurations...${NC}"

# Alacritty
if [ -f "$DOTFILES_DIR/alacritty.toml" ]; then
    backup_file "$HOME/.config/alacritty/alacritty.toml"
    create_symlink "$DOTFILES_DIR/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
fi

# Tmux
if [ -f "$DOTFILES_DIR/tmux.conf" ]; then
    backup_file "$HOME/.tmux.conf"
    create_symlink "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"
fi

# Zsh
if [ -f "$DOTFILES_DIR/zshrc" ]; then
    backup_file "$HOME/.zshrc"
    create_symlink "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
fi

# Neovim
if [ -d "$DOTFILES_DIR/nvim" ]; then
    backup_file "$HOME/.config/nvim"
    create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
fi

echo -e "\n${GREEN}✅ Installation complete!${NC}"
echo -e "\n${BLUE}📋 What was installed:${NC}"
echo -e "  • Alacritty terminal configuration"
echo -e "  • Tmux configuration with vim-style navigation"  
echo -e "  • Zsh shell configuration"
echo -e "  • Neovim configuration with LSP and plugins"

echo -e "\n${YELLOW}🔄 Next steps:${NC}"
echo -e "  1. Restart your terminal or run: source ~/.zshrc"
echo -e "  2. Reload tmux config: tmux source-file ~/.tmux.conf"
echo -e "  3. Configurations are now active!"

echo -e "\n${BLUE}🎉 Happy coding!${NC}"
