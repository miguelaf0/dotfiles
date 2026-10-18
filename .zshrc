# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Completition
autoload -Uz compinit
compinit -C
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Behavior
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP

# Keybindings
bindkey '^[[A' history-search-backward      # up arrow: search history by typed prefix
bindkey '^[[B' history-search-forward       # down arrow
bindkey '^[[1;5C' forward-word              # Ctrl+Right
bindkey '^[[1;5D' backward-word             # Ctrl+Left

# Prompt
autoload -Uz colors && colors
PROMPT='%F{blue}%~%f %F{green}❯%f '

# Environment
export EDITOR=vi

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Machine specific
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

