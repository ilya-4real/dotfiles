# Created by newuser for 5.9
eval "$(starship init zsh)"
export PATH=/home/ilya/.local/bin:$PATH

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# History set up
export HISTFILE=~/.config/.zshhist
export HISTSIZE=1000
export SAVEHIST=1000

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

# aliases
alias n='nvim'
alias py='python'
source ./.zsh/aliases/git_aliases.zsh

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
	   theme = 'hyper',
    config = {
		header = {"neovim"},
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
    },
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
# The following lines were added by compinstall

zstyle ':completion:*' menu select _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/ilya/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ./.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

