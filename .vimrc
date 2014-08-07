if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git', {
    \ 'build' : {
        \ 'windows' : 'make -f make_mingw32.mak',
        \ 'cygwin' : 'make -f make_cygwin.mak',
        \ 'mac' : 'make -f make_mac.mak',
        \ 'unix' : 'make -f make_unix.mak',
    \ },
\ }
NeoBundle 'git://github.com/Shougo/neocomplcache.vim.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'git://github.com/osyo-manga/vim-over.git'
NeoBundle 'git://github.com/LeafCage/yankround.vim.git'
NeoBundle 'git://github.com/kien/ctrlp.vim.git'
" NeoBundle 'git://github.com/troydm/easybuffer.vim.git'
NeoBundle 'git://github.com/tomasr/molokai.git'
NeoBundle 'git://github.com/w0ng/vim-hybrid.git'
NeoBundle 'git://github.com/Shougo/vimfiler.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/vim-scripts/Align.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
" python need
" NeoBundle 'git://github.com/alpaca-tc/alpaca_powertabline.git'
" NeoBundle 'git://github.com/Lokaltog/powerline.git', { 'rtp' : 'powerline/bindings/vim'}
" original plugin
NeoBundle 'git://github.com/y-yamagata/ezbuffer.vim'
NeoBundle 'git://github.com/thinca/vim-qfreplace.git'

syntax on
filetype plugin on
filetype indent on

runtime! userautoload/*.vim

