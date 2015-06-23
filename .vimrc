if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'git@github.com:Shougo/neobundle.vim.git'
NeoBundle 'git@github.com:Shougo/vimproc.git', {
    \ 'build' : {
        \ 'windows' : 'make -f make_mingw32.mak',
        \ 'cygwin' : 'make -f make_cygwin.mak',
        \ 'mac' : 'make -f make_mac.mak',
        \ 'unix' : 'make -f make_unix.mak',
    \ },
\ }
NeoBundle 'git@github.com:Shougo/neocomplcache.vim.git'
NeoBundle 'git@github.com:scrooloose/syntastic.git'
NeoBundle 'git@github.com:osyo-manga/vim-over.git'
NeoBundle 'git@github.com:LeafCage/yankround.vim.git'
NeoBundle 'git@github.com:kien/ctrlp.vim.git'
NeoBundle 'git@github.com:tomasr/molokai.git'
NeoBundle 'git@github.com:Shougo/vimfiler.vim.git'
NeoBundle 'git@github.com:Shougo/unite.vim.git'
NeoBundle 'git@github.com:vim-scripts/Align.git'
NeoBundle 'git@github.com:thinca/vim-quickrun.git'
NeoBundle 'git@github.com:y-yamagata/ezbuffer.vim'
NeoBundle 'git@github.com:thinca/vim-qfreplace.git'
NeoBundle 'git@github.com:y-yamagata/gtags.vim.git', 'master'
" NeoBundle 'git@github.com:vim-scripts/st.vim.git'
" NeoBundle 'git@github.com:kannokanno/vimtest.git'
" NeoBundle 'git@github.com:kchmck/vim-coffee-script.git'

call neobundle#end()

syntax on
filetype plugin on
filetype indent on

runtime! userautoload/*.vim

