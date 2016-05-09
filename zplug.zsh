export ZPLUG_HOME=$HOME/.zplug
export ZPLUG_CLONE_DEPTH=1
unset ZPLUG_SHALLOW

if [ -f ~/.zplug/init.zsh ]
then
    source ~/.zplug/init.zsh
fi

if [ $ZPLUG_HOME ]
then
    zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"
    zplug "plugins/command-not-found", from:oh-my-zsh
    # zplug "themes/af-magic", from:oh-my-zsh
    zplug "zsh-users/zsh-completions"
    # compinit 以降に読み込むようにロードの優先度を変更する（10~19にすれば良い）
    zplug "zsh-users/zsh-syntax-highlighting", nice:10
    zplug "mollifier/cd-gitroot"
    zplug "mollifier/anyframe"
    zplug "mafredri/zsh-async", on:sindresorhus/pure
    zplug "sindresorhus/pure", use:pure.zsh, nice:10

    # local plugins
    zplug "~/.zsh", use:pyenv.zsh, from:local
    zplug "~/.zsh", use:rbenv.zsh, from:local
    # zplug "~/.zsh", use:nvm.zsh, from:local
    zplug "~/.zsh", use:go.zsh, from:local
    zplug "~/.zsh", use:direnv.zsh, from:local
    zplug "~/.zsh", use:vim.zsh, from:local
    zplug "~/.zsh", use:hub.zsh, from:local
    zplug "~/.zsh", use:fzf.zsh, from:local
    zplug "~/.zsh", use:dckrm.zsh, from:local
    zplug "~/.zsh", use:dircolors.zsh, from:local

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    zplug load  # --verbose
fi
