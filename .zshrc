# Exports
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR=nvim
export TERM="screen-256color"
export HISTCONTROL=ignoreboth:erasedups
export PATH=$HOME/bin:$PATH

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

bindkey -e
eval "$(starship init zsh)"

# Plugins
[ ! -d ~/.zplug ] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug 'dracula/zsh', as:theme
zplug 'plugins/git', from:oh-my-zsh
zplug 'plugins/fzf', from:oh-my-zsh
zplug 'plugins/tmux', from:oh-my-zsh
zplug 'plugins/asdf', from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Plugins Config
if [ "$TERM_PROGRAM" != "Apple_Terminal" ] && [ "$TERM_PROGRAM" != "iTerm.app" ]; then
  ZSH_TMUX_AUTOSTART=true
fi

zplug load

# init asdf
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
