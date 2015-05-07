" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_dictionary_filetype_lists = {
    \'default'  : '',
    \'vimshell' : $HOME . '/.vimshell/command-history'
\}

" vim-over
nnoremap <silent>,m :OverCommandLine<CR>%s/
vnoremap <silent>,m :OverCommandLine<CR>s/

" yankround.vim
let g:yankround_max_history = 50
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <Space>p <Plug>(yankround-prev)
nmap <Space>n <Plug>(yankround-next)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_min_cache_files = 256
nnoremap <silent><BS><BS> :VimFiler<CR>

" ctrlp
command! CC :ClearAllCtrlPCaches
let g:ctrlp_custom_ignore = {
    \'dir' : '\v[\/]\.(git|hg|svn)$',
    \'file': '\v\.(exe|so|dll|pyc|jpg|png)$',
    \'link': 'SOME_BAD_SYMBOLIC_LINKS',
\}

" syntastic
" let g:syntastic_enable_perl_checker = 1
" let g:syntastic_perl_checker = 'perl'

" ezbuffer
nnoremap <silent>eb :EzBuffer<CR>

" gtags
let g:Gtags_OpenQuickfixWindow = 0
nnoremap <silent><C-g><C-g> :Gtags -g<CR>
nnoremap <silent><C-g><C-f> :Gtags -f %<CR>
nnoremap <silent><C-g><C-]> :GtagsCursor<CR>
nnoremap <silent><C-g><C-t> :GtagsRemind<CR>
