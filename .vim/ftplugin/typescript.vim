if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

if expand("%:e") == "tsx"
    setlocal tabstop=2
    setlocal expandtab
    setlocal softtabstop=2
    setlocal shiftwidth=2
else
    setlocal tabstop=4
    setlocal expandtab
    setlocal softtabstop=4
    setlocal shiftwidth=4
endif
