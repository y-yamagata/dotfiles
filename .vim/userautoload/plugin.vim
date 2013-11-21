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

" vimshell
let g:vimshell_prompt=$USER.'% '
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vp :VimShellPop<CR>

" vimfiler
let g:vimfiler_as_default_explorer=1
let g:vimfiler_edit_action='tabopen'

" vim-over
nnoremap <silent> ,m :OverCommandLine<CR>%s/

" yankround.vim
let g:yankround_max_history=50
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <Space>p <Plug>(yankround-prev)
nmap <Space>n <Plug>(yankround-next)
nnoremap <silent> g<C-p> :<C-u>CtrlPYankRound<CR>

