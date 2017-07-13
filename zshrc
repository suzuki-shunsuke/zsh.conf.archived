fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# autoload -Uz compinit
autoload -Uz colors
# compinit -u

alias sudo="sudo -E"
alias ls="gls --color=auto"

bindkey -v

# 
# zmv
autoload -Uz zmv
# 
# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

{% include 'zplug/zshrc' %}
{% include 'anyframe/zshrc' %}
{% include 'direnv/zshrc' %}
{% include 'docker/zshrc' %}
{% include 'fzf/zshrc' %}
{% include 'git/zshrc' %}
{% include 'gvm/zshrc' %}
{% include 'hub/zshrc' %}
{% include 'nvim/zshrc' %}
{% include 'profile/zshrc' %}
{% include 'zsh-pure/zshrc' %}

{#
{% include 'npm/zshrc' %}
{% include 'dirssh/zshrc' %}
{% include 'travis/zshrc' %}
{% include 'haskel/zshrc' %}
#}
