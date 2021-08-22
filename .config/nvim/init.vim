if &compatible
    set nocompatible
endif

if has('vim_starting')
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
endif

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

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
