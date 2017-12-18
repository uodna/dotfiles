let NERDTreeIgnore=['\.git$[[dir]]', '\.DS_Store$[[file]]', '\.vimsessions$[[dir]]']

call NERDTreeAddKeyMap({
  \ 'key': 'gg',
  \ 'callback': 'NERDTreeDeniteGrep',
  \ 'quickhelpText': 'grep in selected dir',
  \ 'scope': 'Node' })

function! NERDTreeDeniteGrep(node)
  execute 'Denite -no-empty grep -path=' . g:NERDTreeDirNode.GetSelected().path.str()
endfunction
