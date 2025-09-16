# Troubleshooting Guide

## Common Issues and Solutions

### Error: "Unknown option 't_8f'" (FIXED)
- **Problem**: Deprecated terminal options in modern Neovim
- **Solution**: Updated `tmux-fix.lua` to use modern approach
- **Status**: ✅ Fixed

### Error: "setup_handlers is a nil value" (FIXED)
- **Problem**: Incorrect mason-lspconfig API usage
- **Solution**: Moved handlers to mason-lspconfig setup, simplified LSP management
- **Status**: ✅ Fixed

### LSP Server Issues

#### Multiple clangd instances (FIXED)
- **Problem**: Two clangd servers running simultaneously
- **Solution**: Disabled automatic LSP setup in mason-lspconfig
- **Commands**: Use `:LspRestart` to restart LSP, `:LspClients` to show active clients

#### LSP Server Not Starting
- **Check**: Run `:Mason` to verify servers are installed
- **Solution**: Run `:MasonInstall clangd pylsp lua_ls` if missing
- **Check**: Ensure you have the required languages installed (Python, clang, etc.)
- **Restart**: Use `:LspRestart` command to restart LSP servers

### Treesitter Highlighting Issues
- **Check**: Run `:TSInstall c cpp python lua` to install parsers
- **Solution**: Run `:TSUpdate` to update all parsers

### Telescope Not Finding Files
- **Check**: Ensure you're in a project directory
- **Solution**: Install `fd` and `ripgrep` for better performance:
  ```bash
  brew install fd ripgrep
  ```

### Colors Not Working in Terminal
- **Check**: Ensure your terminal supports true colors
- **Solution**: Add to your shell config:
  ```bash
  export TERM=xterm-256color
  ```

### Plugin Installation Issues
- **Check**: Internet connection and Git access
- **Solution**: Run `:Lazy sync` to reinstall plugins
- **Alternative**: Delete `~/.local/share/nvim/lazy/` and restart Neovim

## Useful Commands

- `:checkhealth` - Check system health
- `:Lazy` - Plugin manager interface
- `:Mason` - LSP server manager
- `:TSUpdate` - Update Treesitter parsers
- `:LspInfo` - Show LSP server status
- `:LspRestart` - Restart LSP servers (custom command)
- `:LspClients` - Show active LSP clients (custom command)
- `:messages` - Show recent messages/errors

## Configuration Test

Run this command to test if config loads without errors:
```bash
nvim --headless -c "lua print('Config OK!')" -c "qa"
```

## Getting Help

1. Check `:help` for built-in documentation
2. Use `:checkhealth` to diagnose issues
3. Look at plugin documentation on GitHub
4. Check `HEALTH-FIXES.md` for resolved issues
