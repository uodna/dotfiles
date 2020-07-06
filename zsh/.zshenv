# autoload
autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
autoload -Uz is-at-least

# 日本語を使用
export LANG=ja_JP.UTF-8

# History file and its size
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# go
export GOPATH=$HOME/go

path=(
  /usr/local/bin
  $HOME/.anyenv/bin
  $HOME/.cargo/bin
  $HOME/.tfenv/bin
  $GOPATH/bin
  $HOME/bin
  /usr/local/opt/mysql@5.6/bin
  $path
)

# neovim
export EDITOR=nvim
export BUNDLER_EDITOR=nvim
export XDG_CONFIG_HOME=$HOME/.config

# misc
export MANPAGER="nvim -c 'set ft=man' -"
export BAT_THEME="1337"
export BAT_PAGER="less -R"
export HOMEBREW_NO_INSTALL_CLEANUP=1
export TIME_STYLE="long-iso"
export PURE_PROMPT_SYMBOL="$"
