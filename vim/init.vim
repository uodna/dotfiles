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

"#####表示設定#####
set title "編集中のファイル名を表示
set tabstop=2 "インデントをスペース2つ分に設定
set smartindent "オートインデント
set autoindent
set number "行番号表示
set list
" colors
syntax on
set termguicolors
set background=dark
colorscheme tender

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

"#####その他設定#####
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

" denite
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

if executable('ag')
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep', '--hidden'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>')
call denite#custom#map('normal', '<C-s>', '<denite:do_action:split>')
call denite#custom#map('insert', '<C-s>', '<denite:do_action:split>')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>')

" call denite#custom#source('_', 'matchers', ['matcher_cpsm'])
call denite#custom#source('_', 'sorters', ['sorter_rank'])

call denite#custom#source('file_old', 'converters', ['converter_relative_word'])
call denite#custom#source('file_old', 'matchers', ['matcher_project_files', 'matcher_cpsm'])

call denite#custom#option('default', 'vertical_preview', 1)

" noremap <silent> <C-p> :<C-u>Denite file_rec<CR>
map <silent> <Leader>p :<C-u>Denite file_rec/git<CR>
map <silent> <Leader>f :<C-u>Denite file_rec<CR>
map <silent> <Leader>o :<C-u>Denite file_old<CR>
map <silent> <Leader>g :<C-u>Denite -no-empty grep<CR>
map <silent> <Leader>a :<C-u>Denite -auto_preview -no-empty grep<CR>
map <silent> <Leader>r :<C-u>Denite -resume<CR>
map <silent> <C-h> :<C-u>Denite -resume -immediately -cursor-pos=-1<CR>
map <silent> <C-l> :<C-u>Denite -resume -immediately -cursor-pos=+1<CR>
map <silent> <Leader>w :<C-u>DeniteCursorWord grep<CR>
map <silent> <Leader>y :<C-u>Denite neoyank<CR>

