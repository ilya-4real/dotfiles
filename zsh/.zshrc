# Created by newuser for 5.9
eval "$(starship init zsh)"
export PATH=/home/ilya/.local/bin:$PATH

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# History set up
export HISTFILE=~/.config/.zshhist
export HISTSIZE=1000
export SAVEHIST=1000

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
# history options
setopt HIST_IGNORE_ALL_DUPS

# other options
setopt AUTO_CD

# gpg as ssh settng

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# terminal settings
export TERM=xterm-256color

# aliases
alias n='nvim'
alias py='python'
alias grep='rg'
alias docker_stop='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias ls='eza'
source ~/.zsh/aliases/git_aliases.zsh

# pdm setup
#
fpath=(~/.zfunc ~/.zsh/completions $fpath)

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 1 not-numeric
zstyle ':completion:*' menu select _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/ilya/new_comp.sh'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# anti dpi variable
export PATH=$PATH:~/.spoofdpi/bin
alias spoofy="spoofdpi --enable-doh --window-size 0"

# scripts
source ~/.zsh/custom/py_env_activate.sh
source ~/.zsh/custom/env_loader.sh
activate_pyenv
