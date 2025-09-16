# clangd Setup for C++ Project

## ✅ Current Status: OPTIMIZED

### Project Structure Analysis
- **Location**: `/Users/andrei/projects/dev`
- **Build System**: CMake with compile_commands.json (20MB)
- **Cache**: `.cache/clangd/` (1.9MB indexed)
- **Configuration**: `.clangd` file created

### Key Files

#### 1. compile_commands.json ✅
- **Size**: 20MB - excellent coverage
- **Standard**: C++17
- **Includes**: All major project directories
  - `/src` - Main source code
  - `/engine` - Game engine
  - `/HSFramework` - Framework
  - `/libs` - Libraries
  - Boost, Lua, pugixml dependencies

#### 2. .clangd Configuration ✅
Created optimized config with:
- Background indexing enabled
- clang-tidy integration
- Project-specific include paths
- Performance optimizations

### Indexing Status
- **Cache Size**: 1.9MB (good coverage)
- **Location**: `.cache/clangd/index/`
- **Status**: Active and growing

### Expected LSP Features

#### Navigation
- `gd` - Go to definition (across all project files)
- `gD` - Go to declaration  
- `gr` - Find references (project-wide)
- `gi` - Find implementations

#### Code Intelligence
- **Autocompletion**: All project symbols, STL, Boost
- **Error Detection**: Real-time compilation errors
- **Code Actions**: Refactoring, fixes
- **Hover Info**: Type information, documentation

#### Formatting
- Uses `.clang-format` for consistent style
- `<Space>f` to format current file

### Performance Optimizations

1. **Background Indexing**: Continues while you work
2. **Incremental Updates**: Only re-indexes changed files
3. **Memory Management**: Limited to prevent system slowdown
4. **Selective Analysis**: Focuses on opened files first

### Troubleshooting

#### Slow Initial Indexing
- **Normal**: First-time indexing can take 5-10 minutes
- **Solution**: Let it complete in background
- **Check**: `:LspClients` to see if clangd is active

#### Missing Symbols
- **Check**: File is included in compile_commands.json
- **Solution**: Rebuild CMake cache if needed
- **Verify**: Open file and wait for indexing

#### High Memory Usage
- **Normal**: Large projects can use 1-2GB RAM
- **Solution**: Close unused files, restart if needed
- **Monitor**: Activity Monitor for clangd process

### Commands

- `:LspClients` - Show active LSP status
- `:LspRestart` - Restart clangd if needed
- `:checkhealth vim.lsp` - Verify LSP health

### Cache Management

The clangd cache is stored in `.cache/clangd/` and contains:
- Symbol indexes
- AST information  
- Cross-references
- Compilation database cache

**Safe to delete** if you need to rebuild the index, but will require re-indexing.

**✅ Git Integration**: Cache is properly ignored in `.gitignore` - won't be committed to repository.

## Next Steps

1. Open any C++ file in the project
2. Wait for initial indexing to complete
3. Test navigation with `gd` on any symbol
4. Enjoy fast, accurate C++ development! 🚀
