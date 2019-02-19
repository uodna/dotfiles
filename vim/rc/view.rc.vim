set title
set tabstop=2
set smartindent
set number
set list
set listchars=tab:>-,trail:-,nbsp:+

syntax on
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
" set cursorline
colorscheme gruvbox

" 挿入モード時に縦棒タイプのカーソル
let &t_SI .= "\e[5 q"
" ノーマルモード時にブロックタイプのカーソル
let &t_EI .= "\e[1 q"
" 置換モード時に下線タイプのカーソル
let &t_SR .= "\e[3 q"
