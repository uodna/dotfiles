noremap j gj
noremap k gk
noremap <S-h> ^
noremap <S-l> $
noremap ; :
noremap : ;
nnoremap x "_x
vnoremap > >gv
vnoremap < <gv
vnoremap Y y`]

map /  <Plug>(incsearch-forward)\v
map ?  <Plug>(incsearch-backward)\v
map g/ <Plug>(incsearch-stay)\v
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
nnoremap <silent> <ESC> :<C-u>nohlsearch<CR>
nnoremap <silent> <C-c> :<C-u>nohlsearch<CR>

noremap <silent> <Leader>n :<C-u>NERDTreeToggle<CR>
noremap <silent> <Leader>m :<C-u>NERDTreeFind<CR>
let g:NERDTreeMapOpenSplit='<C-s>'
let g:NERDTreeMapOpenVSplit='<C-v>'
let g:NERDTreeMapPreviewSplit='gs'
let g:NERDTreeMapPreviewVSplit='gv'

noremap <silent> <Leader>u :<C-u>MundoToggle<CR>

function! s:tig()
  :tabnew
  :terminal tig
  :startinsert
endfunction

command! Tig call <SID>tig()
noremap <silent> <Leader>t :<C-u>Tig<CR>

cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

tnoremap <M-h> <C-\><C-N><C-w>h
tnoremap <M-j> <C-\><C-N><C-w>j
tnoremap <M-k> <C-\><C-N><C-w>k
tnoremap <M-l> <C-\><C-N><C-w>l
tnoremap <M-w> <C-\><C-N><C-w>w
tnoremap <M-t> <C-\><C-N><C-w>t
tnoremap <M-b> <C-\><C-N><C-w>b
tnoremap <M-p> <C-\><C-N><C-w>p

inoremap <M-h> <C-\><C-N><C-w>h
inoremap <M-j> <C-\><C-N><C-w>j
inoremap <M-k> <C-\><C-N><C-w>k
inoremap <M-l> <C-\><C-N><C-w>l
inoremap <M-w> <C-\><C-N><C-w>w
inoremap <M-t> <C-\><C-N><C-w>t
inoremap <M-b> <C-\><C-N><C-w>b
inoremap <M-p> <C-\><C-N><C-w>p

nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-w> <C-w>w
nnoremap <M-t> <C-w>t
nnoremap <M-b> <C-w>b
nnoremap <M-p> <C-w>p
