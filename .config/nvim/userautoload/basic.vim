set nobackup
set noswapfile
set nofoldenable

set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix

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

set nowrap

" colorscheme molokai
colorscheme desert

augroup InvisibleIndicator
    autocmd!
    autocmd BufEnter * call userautoload#activateInvisibleIndicator()
augroup END

set clipboard+=unnamed
set mouse=

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
