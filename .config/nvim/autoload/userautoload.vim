if exists('g:userautoload_loaded')
    finish
endif
let g:userautoload_loaded = 1

function userautoload#activateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermbg=red gui=underline guifg=#FF0000
    match ZenkakuSpace /　/
endfunction

