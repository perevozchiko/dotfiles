# Terminal Setup Hotkeys Cheatsheet

Complete reference for Alacritty + tmux + zsh + Neovim (NvChad)

---

# Alacritty (Terminal)

## Window Management

| Hotkey | Action |
|--------|--------|
| `Cmd+N` | New window |
| `Cmd+K` | Clear screen |
| `Cmd+F` | Toggle fullscreen |
| `Cmd++` | Increase font size |
| `Cmd+-` | Decrease font size |
| `Cmd+0` | Reset font size |
| `Cmd+Q` | Quit Alacritty |

## Text Selection & Copy/Paste

| Hotkey | Action |
|--------|--------|
| `Cmd+C` | Copy selection |
| `Cmd+V` | Paste |
| `Cmd+Click` | Open URL in browser |
| Click + Drag | Select text |
| Double Click | Select word |
| Triple Click | Select line |

## System Hotkey

| Hotkey | Action |
|--------|--------|
| `Ctrl+Cmd+T` | Launch Alacritty from anywhere (skhd) |

---

# Tmux (Terminal Multiplexer)

**Prefix Key:** `Ctrl+A` (instead of default Ctrl+B)

## Session Management

| Hotkey | Action |
|--------|--------|
| `tmux new -s name` | Create named session |
| `tmux attach -t name` | Attach to session |
| `tmux ls` | List sessions |
| `Prefix d` | Detach from session |
| `Prefix $` | Rename session |
| `Prefix Ctrl+S` | Save session (tmux-resurrect) |
| `Prefix Ctrl+R` | Restore session (tmux-resurrect) |

## Window Management (Tabs)

| Hotkey | Action |
|--------|--------|
| `Prefix c` | Create new window |
| `Prefix ,` | Rename window |
| `Prefix n` | Next window |
| `Prefix p` | Previous window |
| `Prefix 0-9` | Switch to window by number |
| `Prefix w` | List windows (interactive) |
| `Prefix &` | Kill window (with confirmation) |

## Pane Management (Splits)

| Hotkey | Action |
|--------|--------|
| `Prefix \|` | Split vertical (new pane right) |
| `Prefix -` | Split horizontal (new pane below) |
| `Ctrl+H` | Move to left pane |
| `Ctrl+J` | Move to bottom pane |
| `Ctrl+K` | Move to top pane |
| `Ctrl+L` | Move to right pane |
| `Prefix H/J/K/L` | Resize pane |
| `Prefix x` | Kill pane (with confirmation) |
| `Prefix z` | Toggle pane zoom (fullscreen) |

## Copy Mode

| Hotkey | Action |
|--------|--------|
| `Prefix [` | Enter copy mode |
| `v` | Start selection (in copy mode) |
| `y` | Copy selection (in copy mode) |
| `Ctrl+V` | Rectangle selection |
| `q` | Exit copy mode |

## Miscellaneous

| Hotkey | Action |
|--------|--------|
| `Prefix Ctrl+L` | Clear screen |
| `Prefix ?` | Show all keybindings |
| `Prefix :` | Enter command mode |
| `Prefix r` | Reload tmux config |

---

# Zsh (Shell)

## Navigation

| Command | Action |
|---------|--------|
| `cd dir` | Change directory |
| `z query` | Jump to frequently used directory (zoxide) |
| `zi query` | Interactive directory selection (zoxide + fzf) |
| `..` | Go up one directory |
| `...` | Go up two directories |

## History

| Hotkey | Action |
|--------|--------|
| `Ctrl+R` | Search command history (fzf) |
| `↑` / `↓` | Navigate history |
| `!!` | Repeat last command |
| `!$` | Last argument of previous command |

## Completion

| Hotkey | Action |
|--------|--------|
| `Tab` | Trigger completion |
| `Tab Tab` | Show all completions |
| Arrow keys | Navigate completions |

## fzf Integration

| Hotkey | Action |
|--------|--------|
| `Ctrl+T` | Find file (insert into command) |
| `Ctrl+R` | Search command history |
| `Alt+C` | Find directory and cd into it |
| `**<Tab>` | Fuzzy completion (e.g., `vim **<Tab>`) |

## Git Aliases

| Alias | Command | Action |
|-------|---------|--------|
| `g` | `git` | Git shortcut |
| `gs` | `git status` | Show status |
| `ga` | `git add` | Add file |
| `gaa` | `git add .` | Add all files |
| `gc` | `git commit` | Commit |
| `gcm` | `git commit -m` | Commit with message |
| `gp` | `git pull --rebase` | Pull with rebase |
| `gps` | `git push` | Push |
| `gl` | `git log --oneline --graph` | Pretty log |
| `gd` | `git diff` | Show diff |
| `gco` | `git checkout` | Checkout branch |

## Other Aliases

| Alias | Command |
|-------|---------|
| `vim` | `nvim` |
| `v` | `nvim` |
| `t` | `tmux` |
| `ta` | `tmux attach -t` |
| `tn` | `tmux new -s` |
| `tl` | `tmux list-sessions` |
| `ll` | `ls -lh` (or `eza -l` if installed) |
| `la` | `ls -lAh` (or `eza -la`) |

## File Operations

| Command | Action |
|---------|--------|
| `ls` | List files |
| `ll` | List with details |
| `la` | List all (including hidden) |
| `cat file` | Show file content (or `bat` if installed) |
| `mkdir dir` | Create directory |
| `rm file` | Remove file |
| `mv old new` | Move/rename |
| `cp src dst` | Copy file |

---

# Neovim (NvChad)

## Leader Key
- `Space` — Leader key for most commands

---

## File Navigation (Telescope)

| Hotkey | Action |
|--------|--------|
| `<Leader>ff` | Find files |
| `<Leader>fa` | Find all files (including hidden) |
| `<Leader>fw` | Live grep (search in files) |
| `<Leader>fb` | Find buffers |
| `<Leader>fh` | Help tags |
| `<Leader>fo` | Old files (history) |
| `<Leader>fz` | Find in current buffer |
| `<Leader>cm` | Git commits |
| `<Leader>gt` | Git status |

---

## File Tree (nvim-tree)

| Hotkey | Action |
|--------|--------|
| `<Leader>e` | Toggle file tree |
| `<C-n>` | Toggle file tree |
| `a` | Create new file/folder (in tree) |
| `r` | Rename file (in tree) |
| `d` | Delete file (in tree) |
| `x` | Cut file (in tree) |
| `c` | Copy file (in tree) |
| `p` | Paste file (in tree) |

---

## LSP (Language Server)

| Hotkey | Action |
|--------|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<Leader>sh` | Signature help |
| `<Leader>D` | Type definition |
| `<Leader>ra` | Rename symbol |
| `<Leader>ca` | Code action |
| `<Leader>wa` | Add workspace folder |
| `<Leader>wr` | Remove workspace folder |
| `<Leader>wl` | List workspace folders |

---

## Diagnostics (Errors/Warnings)

| Hotkey | Action |
|--------|--------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<Leader>q` | Diagnostic quickfix list |
| `<Leader>e` | Show line diagnostics |

---

## Editing

| Hotkey | Action |
|--------|--------|
| `gcc` | Comment/uncomment line |
| `gc` | Comment/uncomment selection (visual) |
| `gbc` | Block comment/uncomment |
| `<Leader>n` | Toggle line numbers |
| `<Leader>rn` | Toggle relative numbers |

---

## Buffers

| Hotkey | Action |
|--------|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<Leader>x` | Close buffer |
| `<Leader>b` | New buffer |

---

## Tabs

| Hotkey | Action |
|--------|--------|
| `<Leader>ta` | New tab |
| `<Leader>tx` | Close tab |
| `<Leader>tn` | Next tab |
| `<Leader>tp` | Previous tab |

---

## Terminal

| Hotkey | Action |
|--------|--------|
| `<Leader>h` | Horizontal terminal |
| `<Leader>v` | Vertical terminal |
| `<C-x>` | Close terminal (in terminal mode) |
| `<Esc>` | Exit terminal mode → normal mode |

---

## Windows/Splits

| Hotkey | Action |
|--------|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to bottom window |
| `<C-k>` | Move to top window |
| `<C-l>` | Move to right window |
| `<C-w>v` | Vertical split |
| `<C-w>s` | Horizontal split |
| `<C-w>q` | Close window |

---

## Completion (Insert Mode)

| Hotkey | Action |
|--------|--------|
| `<Tab>` | Next completion item |
| `<S-Tab>` | Previous completion item |
| `<CR>` | Confirm completion |
| `<C-e>` | Close completion menu |
| `<C-Space>` | Trigger completion |

---

## Visual Mode

| Hotkey | Action |
|--------|--------|
| `v` | Visual mode (character) |
| `V` | Visual mode (line) |
| `<C-v>` | Visual mode (block) |
| `>` | Indent right |
| `<` | Indent left |
| `J` | Join lines |

---

## Search & Replace

| Hotkey | Action |
|--------|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace with confirmation |

---

## Copy/Paste (System Clipboard)

| Hotkey | Action |
|--------|--------|
| `y` | Yank (copy) |
| `yy` | Yank line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `"+y` | Copy to system clipboard |
| `"+p` | Paste from system clipboard |

---

## Undo/Redo

| Hotkey | Action |
|--------|--------|
| `u` | Undo |
| `<C-r>` | Redo |

---

## Miscellaneous

| Hotkey | Action |
|--------|--------|
| `<Leader>fm` | Format code (with LSP) |
| `<Leader>th` | Change theme |
| `<Leader>pt` | Preview theme |
| `<Esc>` | Clear search highlight |
| `<Leader>uu` | Update plugins (Lazy) |
| `:w` | Save file |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:q!` | Quit without saving |

---

## NvChad Specific

| Command | Action |
|---------|--------|
| `:NvCheatsheet` | Open cheatsheet |
| `:Lazy` | Plugin manager |
| `:Mason` | LSP/tool installer |
| `:checkhealth` | Check Neovim health |

---

## Git Integration

### Neogit (Full Git UI)

| Hotkey | Action |
|--------|--------|
| `<Leader>gg` | Open Neogit (Space+g+g) |
| `Tab` | Expand section/hunk (in Neogit) |
| `s` | Stage file/hunk |
| `S` | Stage all |
| `u` | Unstage file/hunk |
| `U` | Unstage all |
| `x` | Discard hunk/file |
| `c` | Commit menu |
| `P` | Push menu |
| `p` | Pull menu |
| `b` | Branch menu |
| `l` | Log |
| `d` | Diff |
| `Enter` | Open diff/file |
| `?` | Show help |
| `q` | Close Neogit |

### Diffview (Visual Diff)

| Hotkey | Action |
|--------|--------|
| `<Leader>gd` | Open diff of current changes |
| `<Leader>gh` | File history (current file) |
| `<Leader>gH` | Project history |
| `<Leader>gc` | Close diffview |
| `]c` | Next change (in diff) |
| `[c` | Previous change (in diff) |
| `<Tab>` | Switch between files |

Commands:
- `:DiffviewOpen` — diff current changes
- `:DiffviewOpen HEAD~2` — diff with commit
- `:DiffviewOpen main` — diff with branch
- `:DiffviewOpen origin/main...HEAD` — diff between branches

### Gitsigns (Inline Git)

| Hotkey | Action |
|--------|--------|
| `]c` | Next git hunk |
| `[c` | Previous git hunk |
| `<Leader>hs` | Stage hunk (normal mode) |
| `<Leader>hs` | Stage selected lines (visual mode) |
| `<Leader>hr` | Reset (discard) hunk |
| `<Leader>hr` | Reset selected lines (visual mode) |
| `<Leader>hR` | Reset entire file |
| `<Leader>ph` | Preview hunk |
| `<Leader>gb` | Git blame line |
| `<Leader>td` | Toggle deleted lines |

---

## Autopairs (nvim-autopairs)

Automatic closing of brackets, quotes, etc.

| Insert Mode | Result |
|-------------|--------|
| `(` | Automatically closes `()` |
| `{` | Automatically closes `{}` |
| `[` | Automatically closes `[]` |
| `"` | Automatically closes `""` |
| `'` | Automatically closes `''` |

---

## Snippets (LuaSnip)

| Hotkey | Action |
|--------|--------|
| `<Tab>` | Expand snippet or jump to next placeholder |
| `<S-Tab>` | Jump to previous placeholder |
| `<C-e>` | Cancel snippet |

Common snippets (in insert mode):
- `for` → for loop
- `if` → if statement
- `func` → function definition
- `main` → main function (C/C++)
- `class` → class definition (C++)

---

## Which-key (which-key.nvim)

Shows available keybindings in popup

| Hotkey | Action |
|--------|--------|
| `<Leader>` | Wait ~200ms → shows menu |
| `<Leader>wk` | Open which-key manually |

---

## Telescope Extensions

| Hotkey | Action |
|--------|--------|
| `<C-/>` | Toggle help (in Telescope) |
| `<C-j>` | Next item (in Telescope) |
| `<C-k>` | Previous item (in Telescope) |
| `<C-q>` | Send to quickfix list |
| `<Tab>` | Toggle selection |
| `<C-u>` | Scroll up preview |
| `<C-d>` | Scroll down preview |

---

## Conform (Code Formatting)

| Hotkey | Action |
|--------|--------|
| `<Leader>fm` | Format current buffer |
| Visual mode `<Leader>fm` | Format selection |

Supported formatters (install via Mason):
- clang-format (C/C++)
- stylua (Lua)
- prettier (Markdown, JSON, etc.)

---

## Indent Blankline

Visual indent guides (automatic, no hotkeys)

---

## Custom Mappings

| Hotkey | Action |
|--------|--------|
| `;` | Enter command mode (same as `:`) |
| `jk` | Exit insert mode (alternative to `<Esc>`) |

---

## Mason (Tool Installer)

| Command | Action |
|---------|--------|
| `:Mason` | Open Mason UI |
| `:MasonInstall <tool>` | Install tool |
| `:MasonUninstall <tool>` | Uninstall tool |
| `:MasonUpdate` | Update all tools |

In Mason UI:
- `i` — Install tool under cursor
- `u` — Update tool
- `X` — Uninstall tool
- `U` — Update all tools
- `/` — Search

---

## Tips

- Use `<Leader>` (Space) followed by key to see which-key menu
- Most navigation works with `hjkl` (vim motion)
- In terminal mode: `<Esc>` to exit, `<C-x>` to close
- LSP must be installed via `:Mason` for language features
- Use `:Telescope` to see all telescope commands
- Type `jk` quickly in insert mode to exit (faster than Esc)
- Git changes show in sign column (left side of line numbers)
- Autopairs work automatically — just type opening bracket

---

## Quick Workflow Examples

### Basic Editing:
```
1. Open nvim
2. <Leader>ff               → Find and open file
3. Start editing
4. jk                       → Exit insert mode
5. <Leader>fm               → Format code
6. :w                       → Save
7. <Leader>e                → Toggle file tree
8. <Leader>fw               → Search in project
9. <Leader>x                → Close buffer
```

### Git Workflow:
```
1. <Leader>gd               → View all changes (diffview)
2. <Leader>gg               → Open Neogit
3. Tab                      → Expand hunks
4. s                        → Stage specific hunks
5. (or v to select lines → s to stage partial)
6. c c                      → Commit
7. (write message) :wq
8. P p                      → Push
```

### Stage Partial Changes:
```
1. ]c                       → Jump to next change
2. <Leader>ph               → Preview hunk
3. v                        → Visual mode (select lines)
4. <Leader>hs               → Stage only selected lines
```

### Discard Changes:
```
1. ]c                       → Jump to hunk
2. <Leader>ph               → Preview (check if need to discard)
3. <Leader>hr               → Discard hunk
(or v to select → <Leader>hr to discard lines)
```

---

**Print this and keep near your desk for quick reference!**

