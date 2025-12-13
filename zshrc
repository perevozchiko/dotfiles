# ==============================
#  Homebrew
# ==============================

# Apple Silicon
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
# Intel
elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi


# ==============================
#  Environment
# ==============================

export EDITOR="nvim"
export VISUAL="nvim"
export LANG="en_US.UTF-8"


# ==============================
#  History
# ==============================

HISTFILE=~/.zsh_history
HISTSIZE=200000
SAVEHIST=200000

# History options
setopt inc_append_history        # Write immediately
setopt share_history             # Share across sessions
setopt hist_ignore_all_dups      # Remove older duplicates
setopt hist_reduce_blanks        # Remove extra whitespace
setopt hist_ignore_space         # Ignore commands starting with space


# ==============================
#  Completion
# ==============================

autoload -Uz compinit && compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Menu selection
zstyle ':completion:*' menu select


# ==============================
#  fzf (fuzzy finder)
# ==============================

if [[ -f ~/.fzf.zsh ]]; then
    source ~/.fzf.zsh
elif command -v fzf &> /dev/null; then
    # Keybindings
    eval "$(fzf --zsh)"
fi

# fzf options
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"


# ==============================
#  zoxide (smart cd)
# ==============================

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi


# ==============================
#  Starship Prompt
# ==============================

if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi


# ==============================
#  Aliases
# ==============================

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# ls → eza (if installed)
if command -v eza &> /dev/null; then
    alias ls="eza --icons --group-directories-first"
    alias ll="eza -l --icons --group-directories-first"
    alias la="eza -la --icons --group-directories-first"
    alias tree="eza --tree --icons"
else
    alias ll="ls -lh"
    alias la="ls -lAh"
fi

# cat → bat (if installed)
if command -v bat &> /dev/null; then
    alias cat="bat --style=plain --paging=never"
fi

# Git shortcuts
alias g="git"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."           # Add all files
alias gc="git commit"
alias gcm="git commit -m"       # Commit with message
alias gp="git pull --rebase --autostash"
alias gps="git push"            # Push
alias gl="git log --oneline --graph --decorate"
alias gd="git diff"
alias gco="git checkout"
alias gpp="git pull --rebase && git submodule update --init --recursive && git push"

# Neovim
alias vim="nvim"
alias v="nvim"

# Tmux
alias t="tmux"
alias ta="tmux attach -t"
alias tn="tmux new -s"
alias tl="tmux list-sessions"

# Quick edit configs
alias zshconfig="nvim ~/.zshrc"
alias alacrittyconfig="nvim ~/.config/alacritty/alacritty.toml"
alias tmuxconfig="nvim ~/.tmux.conf"
alias nvimconfig="cd ~/.config/nvim && nvim ."


# ==============================
#  Local/Project Scripts
# ==============================

# Add local bin to PATH
if [[ -d "$HOME/.local/bin" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi


# ==============================
#  macOS Specific
# ==============================

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Disable brew auto-update hints
    export HOMEBREW_NO_ENV_HINTS=1
fi

