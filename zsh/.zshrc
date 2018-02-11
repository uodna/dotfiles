# Ctrl+Dでログアウトしてしまうことを防ぐ
# setopt IGNOREEOF

# emacsキーバインド
bindkey -e
# bindkey -v

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
# setopt auto_cd

# 自動でpushdを実行
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups

# コマンドミスを修正
setopt correct

# # エイリアス
# alias lst='ls -ltr --color=auto'
# alias l='ls -ltr --color=auto'
# alias la='ls -la --color=auto'
# alias ll='ls -l --color=auto'
# alias so='source'
# alias v='vim'
# alias vi='vim'
# alias vz='vim ~/.zshrc'
# alias c='cdr'

# historyに日付を表示
alias h='fc -lt '%F %T' 1'
alias cp='cp -i'
alias rm='rm -i'
alias diff='diff -U1'

# cdの後にlsを実行
# chpwd() { ls -ltr }

# どこからでも参照できるディレクトリパス
# cdpath=(~)

# 区切り文字の設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars "_-./;@ "
zstyle ':zle:*' word-style unspecified

# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control

# プロンプトを2行で表示、時刻を表示
# PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color}(%*%) %~
# %# "

# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
# bindkey '^r' history-incremental-pattern-search-backward
# bindkey '^s' history-incremental-pattern-search-forward

bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down

# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# cdr タブでリストを表示
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
# cdrコマンドで履歴にないディレクトリにも移動可能に
zstyle ":chpwd:*" recent-dirs-default true

# aliases
alias g='cd $(ghq root)/$(ghq list | peco)'
alias d='docker'
alias dc='docker-compose'
alias v="nvim"
alias vi="nvim"
alias q="exit"
alias la='ls -la'
alias ll='ls -l'
alias t='tmux'
alias tm="tmux attach || tmux new"
alias be='bundle exec'

# global aliases
alias -g G='| grep'
alias -g L='| less'
alias -g Y='| pbcopy'

# anyenv
eval "$(anyenv init -)"

# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# direnv
eval "$(direnv hook zsh)"

# peco-history
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# rust
source $HOME/.cargo/env

# zplug
source ~/.zplug/init.zsh

zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-history-substring-search', defer:3
zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load # --verbose

[ -f ~/.local/.zshrc ] && source ~/.local/.zshrc
