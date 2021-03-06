if &compatible
    set nocompatible
endif

if has('vim_starting')
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#load_toml('~/.dein.toml', {'lazy': 0})
    call dein#load_toml('~/.dein_lazy.toml', {'lazy': 1})

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
if filereadable(getcwd() . '/.local.vim')
    set runtimepath+=.

    runtime! .local.vim
endif
