" ローカルセッション保存ディレクトリ
let g:local_session_directory = getcwd() . '/.vimsessions'

function! s:ConfigureSessionAutoSave()
  " session保存ディレクトリを設定
  let g:session_directory = g:local_session_directory
  " 終了時に自動保存
  let g:session_autosave = 'yes'
  " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
  let g:session_autoload = 'yes'
  " 1分間に1回自動保存
  let g:session_autosave_periodic = 1
  " fontとcolor設定を再読込する
  let g:session_persist_font = 0
  let g:session_persist_colors = 0
  let g:session_lock_enabled = 0

  set sessionoptions-=help
endfunction

function! s:ConfigureNoSessionAutoSave()
  let g:session_autosave = 'no'
  let g:session_autoload = 'no'
endfunction

" すでにローカルセッションが存在すれば自動保存
if filewritable(g:local_session_directory . '/default.vim')
  call s:ConfigureSessionAutoSave()
else
  call s:ConfigureNoSessionAutoSave()
endif

function! s:StartSessionAutoSave() abort
  call s:ConfigureSessionAutoSave()
  call mkdir(g:session_directory, 'p')
  :SaveSession
endfunction

command! SS call <SID>StartSessionAutoSave()

function! s:StopSessionAutoSave() abort
  call s:ConfigureNoSessionAutoSave()
  :DeleteSession
endfunction

command! DS call <SID>StopSessionAutoSave()
