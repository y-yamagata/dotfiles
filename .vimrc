if &compatible
    set nocompatible
endif

if has('vim_starting')
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#load_toml('~/.vim/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.vim/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'git@github.com:Shougo/neobundle.vim.git'
NeoBundle 'git@github.com:Shougo/vimproc.git', {
    \ 'build': {
        \ 'windows': 'make -f make_mingw32.mak',
        \ 'cygwin': 'make -f make_cygwin.mak',
        \ 'mac': 'make -f make_mac.mak',
        \ 'unix': 'make -f make_unix.mak',
    \ },
\ }

call neobundle#end()

syntax on
filetype plugin on
filetype indent on

runtime! userautoload/*.vim

augroup VimrcLocal
    autocmd!
    autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
    let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
    for i in reverse(filter(files, 'filereadable(v:val)'))
        source `=i`
    endfor
endfunction
