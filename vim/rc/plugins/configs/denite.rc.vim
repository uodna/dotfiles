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
call denite#custom#map('normal', '<C-g>', '<denite:do_action:split>')
call denite#custom#map('insert', '<C-g>', '<denite:do_action:split>')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>')
call denite#custom#map('insert', '<C-b>', '<Left>')
call denite#custom#map('insert', '<C-f>', '<Right>')
call denite#custom#map('insert', '<C-a>', '<S-Left>')
call denite#custom#map('insert', '<C-e>', '<S-Right>')

call denite#custom#source('_', 'matchers', ['matcher/fuzzy'])
call denite#custom#source('_', 'sorters', ['sorter_rank'])

call denite#custom#source('file_old', 'converters', ['converter_relative_word'])
call denite#custom#source('file_old', 'matchers', ['matcher_project_files', 'matcher/fuzzy'])

call denite#custom#source('file_mru', 'converters', ['converter_relative_word'])
call denite#custom#source('file_mru', 'matchers', ['matcher_project_files', 'matcher/fuzzy'])

call denite#custom#option('default', 'highlight_mode_insert', 'Visual')
call denite#custom#option('default', 'highlight_mode_normal', 'Visual')
call denite#custom#option('default', 'highlight_matched_char', 'Constant')
call denite#custom#option('default', 'highlight_matched_range', 'Constant')
call denite#custom#option('default', 'vertical_preview', 1)

noremap <silent> <Leader>p :<C-u>Denite file_rec/git<CR>
noremap <silent> <Leader>P :<C-u>Denite -auto-preview file_rec/git<CR>
noremap <silent> <Leader>f :<C-u>Denite file_rec<CR>
noremap <silent> <Leader>o :<C-u>Denite file_old<CR>
noremap <silent> <Leader>j :<C-u>Denite -immediately -cusor-pos=+1 file_old<CR>
noremap <silent> <Leader>g :<C-u>Denite -no-empty grep<CR>
noremap <silent> <Leader>G :<C-u>Denite -auto-preview -no-empty grep<CR>
noremap <silent> <Leader>r :<C-u>Denite -resume<CR>
noremap <silent> <C-h> :<C-u>Denite -resume -immediately -cursor-pos=-1<CR>
noremap <silent> <C-l> :<C-u>Denite -resume -immediately -cursor-pos=+1<CR>
noremap <silent> <Leader>w :<C-u>DeniteCursorWord grep<CR>
noremap <silent> <Leader>y :<C-u>Denite neoyank<CR>
noremap <silent> <Leader>l :<C-u>Denite line<CR>
noremap <silent> <Leader>b :<C-u>Denite buffer<CR>
noremap <silent> <Leader>m :<C-u>Denite file_mru -cursor-pos=+1<CR>

