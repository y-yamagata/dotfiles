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

function! SetTextWidth()
    let ftype = getbufvar('%', '&filetype')
    if (ftype ==# 'python') 
        set textwidth=79
    else
        set textwidth=0
    endif
endfunction

augroup Pep8Enviroment
    autocmd BufEnter * call SetTextWidth()
augroup END

