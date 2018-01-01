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

cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
