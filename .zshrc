export ZSH="/home/patrick/.oh-my-zsh"
ZSH_THEME="pygmalion"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Vim is not OS enough
export EDITOR='emacsclient'
alias vi='$EDITOR'
alias vim='$EDITOR'

# Replace ls
alias ls='exa'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias ll='ls -al -t modified'

# Copypasta
alias copycb='xclip -selection c'
alias pastecb='xclip -selection c -o'

#node alias
alias ns='npm start'
alias nsd='npm run start:dev'
alias nt='npm test'
alias ntu='npm test -- --updateSnapshot'
alias ntw='npm run test:watch'


alias mirrordisplay='xrandr --output DP-2 --auto --output DP-4 --auto --same-as DP-2'

c() { cd "$(fd -t d . $HOME | grep -v -E 'node_modules|\.git' | fzy)"; }

nr() { npm run | grep -v -E '(Lifecycle included in)|(available via)|^$' | awk 'NR%2==0' | fzy | xargs -r npm run; }

export SASS_PATH=./node_modules
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.local/bin/tools:$PATH"

source $ZSH/oh-my-zsh.sh
