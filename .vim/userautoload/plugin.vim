" netrw
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_alto=1

" project.vim
let g:proj_flags="imstbg"

" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
"let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell/command-history'
\ }

" unite
let g:unite_winheight=5
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_history_yank_limit=100
let g:unite_source_file_mru_limit=200
nnoremap <silent> ,uy :Unite history/yank<CR>
nnoremap <silent> ,ub :Unite buffer<CR>
nnoremap <silent> ,uf :UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :Unite file_mru buffer<CR>
nnoremap <silent> ,ut :Unite tab<CR>

" vimshell
let g:vimshell_prompt=$USER.'% '
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vp :VimShellPop<CR>

" vimfiler
let g:vimfiler_as_default_explorer=1
let g:vimfiler_edit_action='tabopen'

