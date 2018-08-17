noremap j gj
noremap gj j
noremap k gk
noremap gk k
noremap <S-h> ^
noremap <S-l> $
noremap ; :
noremap : ;
nnoremap x "_x
vnoremap > >gv
vnoremap < <gv
vnoremap Y y`]
inoremap <C-c> <ESC>

map /  <Plug>(incsearch-forward)
map ? <Plug>(incsearch-fuzzy-/)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
nnoremap <silent> <ESC> :<C-u>nohlsearch<CR>
nnoremap <silent> <C-c> :<C-u>nohlsearch<CR>

" incsearch.vim x fuzzy x vim-easymotion
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Leader>/ incsearch#go(<SID>config_easyfuzzymotion())

noremap <silent> <Leader>n :<C-u>NERDTreeToggle<CR>
noremap <silent> <Leader>N :<C-u>NERDTreeFind<CR>
let g:NERDTreeMapOpenSplit='<C-g>'
let g:NERDTreeMapOpenVSplit='<C-v>'
let g:NERDTreeMapPreviewSplit='gs'
let g:NERDTreeMapPreviewVSplit='gv'

noremap <silent> <Leader>u :<C-u>MundoToggle<CR>

function! s:tig()
  :tabnew
  :terminal tig
  :startinsert
endfunction

function! s:tigthis(path)
  :tabnew
  execute 'terminal tig' expand(a:path)
  :startinsert
endfunction

command! Tig call <SID>tig()
command! Tt call <SID>tigthis(@%)
noremap <silent> <Leader>t :<C-u>Tig<CR>

nmap , <Plug>(easymotion-overwin-f2)
map <C-j> <Plug>(easymotion-j)
map <C-k> <Plug>(easymotion-k)

cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <C-d> <Del>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-n> <Down>
inoremap <C-p> <Up>

tnoremap <M-h> <C-\><C-N><C-w>h
tnoremap <M-j> <C-\><C-N><C-w>j
tnoremap <M-k> <C-\><C-N><C-w>k
tnoremap <M-l> <C-\><C-N><C-w>l
tnoremap <M-w> <C-\><C-N><C-w>w
tnoremap <M-t> <C-\><C-N><C-w>t
tnoremap <M-b> <C-\><C-N><C-w>b
tnoremap <M-p> <C-\><C-N><C-w>p
tnoremap <M-c> <C-\><C-N><C-w>c

inoremap <M-h> <C-\><C-N><C-w>h
inoremap <M-j> <C-\><C-N><C-w>j
inoremap <M-k> <C-\><C-N><C-w>k
inoremap <M-l> <C-\><C-N><C-w>l
inoremap <M-w> <C-\><C-N><C-w>w
inoremap <M-t> <C-\><C-N><C-w>t
inoremap <M-b> <C-\><C-N><C-w>b
inoremap <M-p> <C-\><C-N><C-w>p
inoremap <M-c> <C-\><C-N><C-w>c

nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-w> <C-w>w
nnoremap <M-t> <C-w>t
nnoremap <M-b> <C-w>b
nnoremap <M-p> <C-w>p
nnoremap <M-c> <C-w>c

nnoremap <silent> <C-a> :tabNext<CR>
nnoremap <silent> <C-x> :quit<CR>
tnoremap <silent> <C-x> <C-\><C-N>:quit<CR>
nnoremap <silent> <C-w>n :vnew<CR>
nnoremap <C-w>t <C-w>T

nmap <silent> <leader>d <Plug>DashSearch

