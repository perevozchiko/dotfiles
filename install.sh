#!/bin/bash

# Personal Dotfiles Installation Script

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

DOTFILES_DIR="$HOME/personal/projects/dotfiles"

echo -e "${BLUE}🚀 Installing Personal Dotfiles...${NC}"

# Show help
show_help() {
    echo -e "${BLUE}Personal Dotfiles Installation Script${NC}"
    echo ""
    echo -e "${YELLOW}Usage:${NC}"
    echo "  ./install.sh                Install packages and configurations"
    echo "  ./install.sh --skip-packages Install only configurations"
    echo "  ./install.sh --help         Show this help"
    echo ""
    echo -e "${YELLOW}Supported OS:${NC}"
    echo "  • macOS (via Homebrew)"
    echo "  • Ubuntu/Debian (via apt)"
    echo "  • RedHat/CentOS/Fedora (via dnf/yum)"
    echo ""
    echo -e "${YELLOW}Packages installed:${NC}"
    echo "  • neovim, tmux, alacritty, fd, ripgrep"
}

# Check command line arguments
INSTALL_PACKAGES=true
if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
    show_help
    exit 0
elif [[ "$1" == "--skip-packages" ]]; then
    INSTALL_PACKAGES=false
    echo -e "${YELLOW}⏭️  Skipping package installation${NC}"
fi

# Detect operating system
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
        echo -e "${BLUE}🍎 Detected macOS${NC}"
    elif [[ -f /etc/debian_version ]]; then
        OS="debian"
        echo -e "${BLUE}🐧 Detected Debian/Ubuntu Linux${NC}"
    elif [[ -f /etc/redhat-release ]]; then
        OS="redhat"
        echo -e "${BLUE}🐧 Detected RedHat/CentOS/Fedora Linux${NC}"
    else
        OS="unknown"
        echo -e "${YELLOW}⚠️  Unknown operating system${NC}"
    fi
}

# Install packages based on OS
install_packages() {
    echo -e "\n${BLUE}📦 Installing required packages...${NC}"
    
    case $OS in
        "macos")
            # Check if Homebrew is installed
            if ! command -v brew &> /dev/null; then
                echo -e "${YELLOW}🍺 Installing Homebrew...${NC}"
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
            
            echo -e "${BLUE}📦 Installing packages via Homebrew...${NC}"
            
            # Install packages that aren't already installed
            packages=(neovim tmux alacritty fd ripgrep)
            for package in "${packages[@]}"; do
                if brew list "$package" &>/dev/null; then
                    echo -e "${GREEN}✓ $package already installed${NC}"
                else
                    echo -e "${BLUE}📦 Installing $package...${NC}"
                    brew install "$package"
                fi
            done
            ;;
        "debian")
            echo -e "${BLUE}📦 Updating package list...${NC}"
            sudo apt update
            
            echo -e "${BLUE}📦 Installing packages via apt...${NC}"
            
            # Install packages that aren't already installed
            packages=(neovim tmux fd-find ripgrep curl git)
            for package in "${packages[@]}"; do
                if dpkg -l | grep -q "^ii  $package "; then
                    echo -e "${GREEN}✓ $package already installed${NC}"
                else
                    echo -e "${BLUE}📦 Installing $package...${NC}"
                    sudo apt install -y "$package"
                fi
            done
            
            # Install Alacritty (not available in default repos for older Ubuntu)
            if ! command -v alacritty &> /dev/null; then
                echo -e "${YELLOW}📦 Installing Alacritty via snap...${NC}"
                sudo snap install alacritty --classic || {
                    echo -e "${RED}❌ Failed to install Alacritty via snap${NC}"
                    echo -e "${YELLOW}💡 You may need to install Alacritty manually${NC}"
                }
            fi
            ;;
        "redhat")
            echo -e "${BLUE}📦 Installing packages via dnf/yum...${NC}"
            if command -v dnf &> /dev/null; then
                sudo dnf install -y neovim tmux alacritty fd-find ripgrep curl git
            elif command -v yum &> /dev/null; then
                sudo yum install -y neovim tmux alacritty fd-find ripgrep curl git
            fi
            ;;
        *)
            echo -e "${YELLOW}⚠️  Automatic package installation not supported for this OS${NC}"
            echo -e "${BLUE}💡 Please install manually: neovim, tmux, alacritty, fd, ripgrep${NC}"
            ;;
    esac
    
    echo -e "${GREEN}✅ Package installation completed${NC}"
}

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

# Detect OS and install packages
detect_os
if [[ "$INSTALL_PACKAGES" == true ]]; then
    install_packages
else
    echo -e "${YELLOW}📦 Package installation skipped${NC}"
fi

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
echo -e "  • Required packages (neovim, tmux, alacritty, fd, ripgrep)"
echo -e "  • Alacritty terminal configuration"
echo -e "  • Tmux configuration with vim-style navigation"  
echo -e "  • Zsh shell configuration"
echo -e "  • Neovim configuration with LSP and plugins"

echo -e "\n${YELLOW}🔄 Next steps:${NC}"
echo -e "  1. Restart your terminal or run: source ~/.zshrc"
echo -e "  2. Reload tmux config: tmux source-file ~/.tmux.conf"
echo -e "  3. Open Neovim and let plugins install automatically"
echo -e "  4. Configurations are now active!"

echo -e "\n${BLUE}🎉 Happy coding!${NC}"
