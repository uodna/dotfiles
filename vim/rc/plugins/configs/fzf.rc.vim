let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-g': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Files command with preview window
command! -bang -nargs=? -complete=dir FzfFilesPreview
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'ctrl-l'), <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* FzfRgPreview
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --no-heading --color=always --smart-case '.shellescape(<q-args>), 2,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', 'ctrl-l'),
  \   <bang>0)

command! -bang -nargs=* FzfRgPreviewInPath
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --no-heading --color=always --smart-case -e "" '.shellescape(<q-args>), 2,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', 'ctrl-l'),
  \   <bang>0)

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

noremap <silent> <Leader>p :<C-u> call FZFOpen(':FzfFilesPreview')<CR>
noremap <silent> <Leader>g :<C-u> call FZFOpen(':FzfRgPreview')<CR>
noremap <silent> <Leader>o :<C-u> call FZFOpen(':FzfHistory')<CR>
