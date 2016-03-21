# https://github.com/direnv/direnv
# Requirements: Go
if builtin command -v direnv > /dev/null ; then
    eval "$(direnv hook zsh)"
fi
