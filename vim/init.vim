filetype plugin indent on

let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'
let g:mapleader = "\<Space>"

let s:rc_dir = resolve(expand('~/.vim/rc'))

function! s:source_rc(path) abort
  let l:abspath = resolve(expand(s:rc_dir . '/' . a:path))
  execute 'source' fnameescape(l:abspath)
endfunction

augroup MyAutoCmd
  autocmd!
augroup END

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
  let s:toml_dir = expand(s:rc_dir . '/plugins')
  call dein#begin(s:dein_dir, [expand('<sfile>')] + split(glob(s:toml_dir . '/*.toml'), '\n'))

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

if has('vim_starting')
  call dein#call_hook('source')
endif

" view
set title
set tabstop=2
set smartindent
set autoindent
set number
set list
syntax on
set termguicolors
set background=dark
"set cursorline
colorscheme tender
hi Visual guibg=#005f87
let g:airline_theme = 'tender'

" search
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

" misc
set clipboard=unnamed
"set mouse=a
set iskeyword+=-

" key mappings
noremap j gj
noremap k gk
noremap <S-h> ^
noremap <S-l> $
" noremap ; :
nnoremap x "_x
vnoremap > >gv
vnoremap < <gv
nnoremap <silent> <ESC> :nohlsearch<CR>

map <silent> <Leader>n :<C-u>NERDTreeToggle<CR>
