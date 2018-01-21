# autoload
autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
autoload -Uz is-at-least

# 日本語を使用
export LANG=ja_JP.UTF-8

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"

# git
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

# openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"

# mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# neovim
export EDITOR=nvim
export XDG_CONFIG_HOME=$HOME/.config

# History file and its size
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
