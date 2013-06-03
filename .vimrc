set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" github
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
        \ 'windows' : 'make -f make_mingw32.mak',
        \ 'cygwin' : 'make -f make_cygwin.mak',
        \ 'mac' : 'make -f make_mac.mak',
        \ 'unix' : 'make -f make_unix.mak',
    \ },
\ }
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimshell.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.vim.git'
NeoBundle 'git://github.com/tomasr/molokai.git'
NeoBundle 'git://github.com/tsukkee/unite-tag.git'

" vim-script
NeoBundle 'project.tar.gz'

syntax on

filetype plugin on
filetype indent on

runtime! userautoload/*.vim

