# Neovim (NvChad) Setup

This configuration is set up for **C/C++, Lua, Markdown, and XML** development.

## Installed LSP Servers

- **clangd** — C/C++ (supports compile_commands.json)
- **lua_ls** — Lua
- **marksman** — Markdown
- **lemminx** — XML

## Installed Parsers (Treesitter)

- c, cpp, lua, markdown, markdown_inline, xml, vim, vimdoc

## For C/C++ Projects

### Generate compile_commands.json

```bash
cd your-project
cmake -S . -B build -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
ln -sf $(pwd)/build/compile_commands.json $(pwd)/compile_commands.json
```

clangd will automatically find it and provide:
- Smart autocomplete
- Go to definition (gd)
- Find references (gr)
- Error checking
- Code formatting

## Key Bindings (NvChad defaults)

### General
- `Space` — Leader key
- `<Leader>ff` — Find files (Telescope)
- `<Leader>fg` — Live grep
- `<Leader>fb` — Find buffers
- `<Leader>e` — Toggle file tree

### LSP
- `gd` — Go to definition
- `gr` — Find references  
- `K` — Hover documentation
- `<Leader>ca` — Code actions
- `<Leader>rn` — Rename symbol
- `[d` / `]d` — Previous/next diagnostic

### Editing
- `gcc` — Comment line
- `gc` — Comment selection (visual mode)
- `<Tab>` — Next completion item
- `<S-Tab>` — Previous completion item

## Updating

### Update NvChad base
```bash
cd ~/.config/nvim
git pull
```

### Update plugins
Inside nvim: `:Lazy sync`

### Update LSP servers
Inside nvim: `:Mason` → `U` to update all

## Health Check

```vim
:checkhealth
```

Should show all LSP servers working.

