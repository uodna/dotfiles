# 日本語を使用
export LANG=ja_JP.UTF-8

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"

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
