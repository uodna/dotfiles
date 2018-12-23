let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-g': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~40%' }

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

" broken
command! -bang -nargs=* FzfAgRaw
  \ call fzf#vim#grep(
  \   'ag --column --line-number --hidden --no-heading --color --smart-case --nobreak '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" broken
command! -bang -nargs=* FzfRgSimple
  \ call fzf#vim#grep(
  \   'rg --column  --line-number --hidden --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, {'--d': ':', '--nth': '2..'}, <bang>0)

noremap <silent> <Leader>p :<C-u>FzfFilesPreview<CR>
noremap <silent> <Leader>g :<C-u>FzfRgPreview<CR>
noremap <silent> <Leader>o :<C-u>FzfHistory<CR>
