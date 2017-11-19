# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF

# 日本語を使用
export LANG=ja_JP.UTF-8

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"

# 色を使用
autoload -Uz colors
colors

# 補完
autoload -Uz compinit
compinit

# emacsキーバインド
bindkey -e
# bindkey -v

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
# setopt auto_cd

# 自動でpushdを実行
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups

# コマンドミスを修正
setopt correct

# # グローバルエイリアス
# alias -g L='| less'
# alias -g H='| head'
# alias -g G='| grep'
# alias -g GI='| grep -ri'
#
#
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
alias mkdir='mkdir -p'
alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'

# cdの後にlsを実行
chpwd() { ls -ltr }

# どこからでも参照できるディレクトリパス
cdpath=(~)

# 区切り文字の設定
# autoload -Uz select-word-style
# select-word-style default
# zstyle ':zle:*' word-chars "_-./;@"
# zstyle ':zle:*' word-style unspecified

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
alias vi="nvim"
alias vim="nvim"
alias q="exit"
alias la='ls -la'
alias ll='ls -l'

# global aliases
alias -g G='| grep'
alias -g L='| less'
alias -g Y='| pbcopy'

# HOMEBREW
export HOMEBREW_GITHUB_API_TOKEN=c88061d5f92fdcd3410debdb203f1e0bd652c3ce

# neovim
export XDG_CONFIG_HOME=$HOME/.config

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# git
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

# openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"

# mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

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
