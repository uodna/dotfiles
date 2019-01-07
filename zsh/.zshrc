# Ctrl+Dでログアウトしてしまうことを防ぐ
# setopt IGNOREEOF

# emacsキーバインド
bindkey -e
# bindkey -v

# history
setopt share_history
setopt extended_history
setopt histignorealldups
setopt hist_reduce_blanks
# 5文字以上のもののみhistoryに登録
zshaddhistory()
{
  local line=${1%%$'\n'}
  [[ ${#line} -ge 5 ]]
}

# disable auto_cd
setopt no_auto_cd

# コマンドミスを修正
setopt no_correct

# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control

# completion
setopt auto_param_slash
setopt list_types
setopt glob_complete
setopt mark_dirs
setopt magic_equal_subst

setopt print_eight_bit
setopt extended_glob

# 区切り文字の設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-./;:@|="
zstyle ':zle:*' word-style unspecified

# 補完時にCtrl+jkで上下移動
zmodload -i zsh/complist
zstyle ':completion:*:default' menu select=2
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^k' vi-up-line-or-history

# 補完で小文字は大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Fish like history search
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down

# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# cdr タブでリストを表示
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
# cdrコマンドで履歴にないディレクトリにも移動可能に
zstyle ":chpwd:*" recent-dirs-default true

# alias
alias b='bat --plain --paging=never'
alias be='bundle exec'
alias c='cdr $(cdr -l | fzf --height 60% --nth 2.. | awk '\''{print $1}'\'')'
alias cp='cp -i'
alias d='docker'
alias dc='docker-compose'
alias diff='diff -U2'
alias dircolors='gdircolors'
alias g='cd $(ghq root)/$(ghq list | fzf)'
alias gg='ghq get -p'
alias gr='git-root'
alias h="fc -Dlt '%F %T' 1" # historyに日付を表示
alias j='z'
alias kk='clear && tmux clear-history'
alias la='ls -la'
alias less='bat --paging=always'
alias ll='ls -l'
alias ls='exa'
alias myip='curl inet-ip.info/json/indent'
alias pr='hub browse -- pull/$(git rev-parse --abbrev-ref HEAD)'
alias rm='rm -i'
alias ssh='TERM=xterm-256color ssh'
alias t='tmux'
alias tf='terraform'
alias tkt='tk ~/tmp/`date +"%Y%m%d"`'
alias tm='tmux attach || tmux new'
alias top='glances'
alias v='nvim'
alias maxima='rlwrap maxima'

# global alias
alias -g G='| grep'
alias -g L='| less'
alias -g Y='| pbcopy'
alias -g F='| fzf'

# anyenv
eval "$(anyenv init - --no-rehash zsh)"

# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# rust
[ -f ~/.cargo/env ] && source ~/.cargo/env

# direnv
eval "$(direnv hook zsh)"

export PATH="bin:$PATH"

# zplug
if [[ -f ~/.zplug/init.zsh ]]; then
    export ZPLUG_LOADFILE="$HOME/.zsh/zplug.zsh"
    source ~/.zplug/init.zsh

    #if ! zplug check --verbose; then
    #    printf "Install? [y/N]: "
    #    if read -q; then
    #        echo; zplug install
    #    else
    #        echo
    #    fi
    #fi
    zplug load # --verbose
fi

# fzf
if [[ -f ~/.fzf.zsh ]]; then
  # export FZF_DEFAULT_COMMAND='fd --type f'
  export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   fd --type f --hidden --follow --exclude .git) 2> /dev/null'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='--reverse --inline-info'
  export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
  export FZF_CTRL_R_OPTS="--with-nth 2.. --height 60% --preview 'echo {}' --preview-window down:3:wrap --bind '?:toggle-preview'"
  export FZF_COMPLETION_TRIGGER='**'
  # export FZF_COMPLETION_OPTS="--height 60% --select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --preview-window hidden --bind '?:toggle-preview'"

  source ~/.fzf.zsh

  # bindkey '^T' fzf-completion
  # bindkey '^O' fzf-cd-widget
  # bindkey '^I' $fzf_default_completion

  _fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
  }

  # Use fd to generate the list for directory completion
  _fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
  }
fi

# z with fzf
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --nth 2.. +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

# mkdir+cd
function take()
{
  if [[ -d $1 ]]; then
    cd $1 && echo -e "\e[1;35m***\e[m\e[1;34m$1\e[m already exists. cd to it"
  else
    mkdir -p $1 && cd $1 && echo -e "\e[1;35m***\e[mCreated \e[1;34m$1\e[m and cd to it"
  fi
}
alias tk='take'


[ -f ~/.local/.zshrc ] && source ~/.local/.zshrc

function git-root() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    cd `pwd`/`git rev-parse --show-cdup`
  fi
}

# Autostart if not already in tmux.
if [[ ! -n $TMUX ]]; then
  tmux attach || tmux new
fi
