# zmodload zsh/zprof
export PATH=$HOME/bin:/usr/local/bin:$PATH

export HISTSIZE=1000
export HISTFILE=~/.zsh_history
export SAVEHIST=100000

export ZPLUG_HOME=$HOME/.zplug
export ZPLUG_CLONE_DEPTH=1
unset ZPLUG_SHALLOW

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# XDG Base Direcotry Specification
export XDG_CONFIG_HOME=$HOME/.config

# uvbm
# export UVBM_ROOT="$HOME/.ghq/gitlab.com/suzuki-shunsuke/unite.vim_bookmark"

# Go
export GOPATH=$HOME/.go
export PATH="$GOPATH/bin:/usr/local/go/bin:$PATH"

# Ansible
# export ANSIBLE_LIBRARY=$HOME/ansible/modules
# export ANSIBLE_ROLES_PATH=$HOME/ansible/roles

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [ -d $PYENV_ROOT ]
then
    eval "$(pyenv init -)"
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if [ -d $HOME/.rbenv/bin ]
then
    eval "$(rbenv init -)"
fi
