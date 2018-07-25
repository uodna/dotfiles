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

path=(
  $HOME/.anyenv/bin
  $HOME/.cargo/bin
  $HOME/.tfenv/bin
  $HOME/go/bin
  $HOME/bin
  /usr/local/opt/mysql@5.6/bin
  /usr/local/share/git-core/contrib/diff-highlight
  /usr/local/bin
  $path
)

# neovim
export EDITOR=nvim
export BUNDLER_EDITOR=nvim
export XDG_CONFIG_HOME=$HOME/.config

# less
export MANPAGER=less
