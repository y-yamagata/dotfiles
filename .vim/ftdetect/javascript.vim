func! s:JavascriptCheck()
  let l = getline(1)
  let matches = matchlist(l, '^#!\s*\([^ \t]\+\)')
  if len(matches) > 0
    if match(matches[1], 'env$') > -1 && match(l, 'node\s*$') > -1
      setf javascript
    elseif match(matches[1], 'node$') > -1
      setf javascript
    endif
  endif
endfunc

au BufNewFile,BufRead [^.]*	call s:JavascriptCheck()
