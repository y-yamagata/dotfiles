" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
"let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell/command-history'
\ }

" vim-over
nnoremap <silent>,m :OverCommandLine<CR>%s/

" yankround.vim
let g:yankround_max_history=50
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <Space>p <Plug>(yankround-prev)
nmap <Space>n <Plug>(yankround-next)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

" easybuffer
" let g:easybuffer_toggle_position='HorizontalBelow'
" let g:easybuffer_horizontal_height='&lines/4'
" let g:easybuffer_sort_mode='n'
" nnoremap <silent>eb :EasyBufferToggle<CR>

" vimfiler
let g:vimfiler_as_default_explorer=1
let g:vimfiler_min_cache_files=256
" let g:vimfiler_edit_action='tabopen'
nnoremap <silent><BS><BS> :VimFiler<CR>

" ctrlp
command! CC :ClearAllCtrlPCaches

" ezbuffer
nnoremap <silent>eb :EzBuffer<CR>

