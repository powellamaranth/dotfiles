# Exports
export EDITOR=nvim
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export PATH=$HOME/bin:$PATH
export BAT_THEME="Dracula"

# History
HISTCONTROL=ignoreboth:erasedups
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

# Options
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
bindkey -e

# Plugins
export ZPLUG_PROTOCOL=ssh
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'djui/alias-tips'
zplug 'dracula/zsh', as:theme
zplug 'plugins/asdf', from:oh-my-zsh
zplug 'plugins/direnv', from:oh-my-zsh
zplug 'plugins/fzf', from:oh-my-zsh
zplug 'plugins/gcloud', from:oh-my-zsh
zplug 'plugins/git', from:oh-my-zsh
zplug 'plugins/kubectl', from:oh-my-zsh
zplug 'plugins/tmux', from:oh-my-zsh
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

ZSH_TMUX_AUTOSTART=true

zplug install
zplug load

# Aliases
alias vim="nvim"
alias cat="bat"

# Misc
eval "$(starship init zsh)"
[ -d ~/.asdf/plugins/java ] && source ~/.asdf/plugins/java/set-java-home.zsh
