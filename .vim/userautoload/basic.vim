set nobackup
set noswapfile

set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set termencoding=utf-8

set hidden

set incsearch
set hlsearch
set ignorecase
set smartcase

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

set number
set ruler
set title

set list
set listchars=tab:>-,eol:$

set cmdheight=2
set showcmd
set laststatus=2

colorscheme molokai
"colorscheme desert

augroup InvisibleIndicator
    autocmd!
    autocmd BufEnter * call userautoload#activateInvisibleIndicator()
augroup END

