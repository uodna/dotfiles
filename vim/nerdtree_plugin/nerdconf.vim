let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\.git$[[dir]]', '\.DS_Store$[[file]]', '\.vimsessions$[[dir]]']
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

call NERDTreeAddKeyMap({
  \ 'key': 'gG',
  \ 'callback': 'NERDTreeFzfGrep',
  \ 'quickhelpText': 'grep in selected dir',
  \ 'scope': 'Node' })

function! NERDTreeFzfGrep(node)
  let l:absolute_path = g:NERDTreeDirNode.GetSelected().path.str()
  let l:relative_path = substitute(l:absolute_path, getcwd() . '/' , '', 'g')
  execute 'call FZFOpen(":FzfRgPreviewInPath ' . l:relative_path . '")'
endfunction
