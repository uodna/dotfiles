"#####表示設定#####
set title "編集中のファイル名を表示
syntax on "コードの色分け
set tabstop=2 "インデントをスペース2つ分に設定
set smartindent "オートインデント
set number "行番号表示

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

"#####その他設定#####
"set termguicolors
set clipboard=unnamed

" python3 host
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

" key mapping
noremap <silent> <C-p> :<C-u>Denite file_rec<CR>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = expand('~/.cache/dein')
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
endif

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

	let s:toml_dir = resolve(expand('~/.vim/plugins'))
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

