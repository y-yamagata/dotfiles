if &compatible
    set nocompatible
endif

if has('vim_starting')
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
endif

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#load_toml('~/.cache/nvim/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.cache/nvim/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

syntax on
filetype plugin on
filetype indent on

runtime! userautoload/*.vim

if filereadable(getcwd() . '/.local.vim')
    set runtimepath+=.

    runtime! .local.vim
endif
