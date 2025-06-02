export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fwalch"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Directories
export REPOS="$HOME/repositories"
export GITUSER="fsgabriel"
export GHREPOS="$REPOS/$GITUSER"
export DOTFILES="$REPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"

# Go related
export GOPATH="$HOME/go/"
export GOBIN="$GOPATH/bin"
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"

export PYENV_ROOT="$HOME/.pyenv"


# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~
path=(
    $path
    $HOME/bin
    $HOME/.local/bin
    $HOME/dotnet
    $SCRIPTS
    $GOPATH
    $GOBIN
    $PYENV_ROOT
)

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH


# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~
alias v="vim"
alias cl='clear'
..() {
    cd ..
}

# Directories
alias scripts='cd $SCRIPTS'
alias repos='cd $REPOS'
alias ghrepos='cd $GHREPOS'
alias dotfiles='cd $DOTFILES'

# Docker
alias dco="docker-compose"
alias dcup="docker-compose up -d"
alias dcdown="docker-compose down"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Git
alias gclone='function _gclone() { mkdir -p "$HOME/repositories" && cd "$HOME/repositories" && git clone "$1"; }; _gclone'
alias gc='git commit -m'
alias gps='git push'
alias gp='git pull origin'
alias gs='git status'
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gb='git branch'
alias ga='git add'
alias gc='git checkout'
alias gca='git checkout -b'
alias gre='git reset'
alias glsort='git log -1 --pretty=format:%h'
alias gbdeleteall='git branch | grep -v "master" | xargs git branch -D'

# Misc
alias goruntst='bash ~/scripts/gotest.sh'
alias maincache='docker exec -it test-cache redis-cli -a 5AJwf62jXo0v'


# ~~~~~~~~~~~~~~~ Load ~~~~~~~~~~~~~~~~~~~~~~~~
# Scripts
if [ -d "$SCRIPTS" ]; then
  chmod +x "$SCRIPTS"/*
fi

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~~~~~~~~
cd() {
  builtin cd "$@"
  if [[ -f .nvmrc ]]; then
    nvm use > /dev/null
  fi
}

cd .
