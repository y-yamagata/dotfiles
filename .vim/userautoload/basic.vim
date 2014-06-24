set nobackup
set noswapfile

set hidden

set incsearch
set hlsearch
set ignorecase
set smartcase

set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set termencoding=utf-8

set autoindent
set smartindent
set cindent

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab

set backspace=indent,eol,start
set virtualedit+=block

set completeopt=menuone

if executable('ag')
    set grepprg=ag\ --nogroup\ -iS
    set grepformat=%f:%l:%m
endif

