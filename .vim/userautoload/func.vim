" 全角スペース表示
if has('syntax')
    syntax enable
    function! ActivateInvisibleIndicator()
        highlight ZenkakuSpace cterm=underline ctermbg=red gui=underline guifg=#FF0000
        match ZenkakuSpace /　/
    endfunction
    augroup InvisibleIndicator
        autocmd!
        autocmd BufEnter * call ActivateInvisibleIndicator()
    augroup END
endif

