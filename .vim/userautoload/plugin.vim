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

" vimshell
let g:vimshell_prompt=$USER.'% '
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vp :VimShellPop<CR>

