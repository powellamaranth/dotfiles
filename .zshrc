# Exports
export EDITOR=nvim
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export PATH=$HOME/bin:$PATH
export BAT_THEME="Dracula"
export ZPLUG_PIPE_FIX=true
export ZPLUG_PROTOCOL=ssh
export ZPLUG_HOME=/usr/local/opt/zplug

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

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

# Misc
eval "$(starship init zsh)"
[ -d ~/.asdf/plugins/java ] && source ~/.asdf/plugins/java/set-java-home.zsh
