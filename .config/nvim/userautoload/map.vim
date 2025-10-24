noremap * *N
noremap # #N
noremap n nzz
noremap N Nzz
" noremap <silent><Esc><Esc> :nohlsearch<CR>
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

noremap j gj
noremap k gk

noremap <silent>BN :bn<CR>
noremap <silent>BP :bp<CR>

nnoremap <silent>"" :sp<CR><C-w>j
nnoremap <silent>"% :vs<CR><C-w>l

nnoremap <space>yy yy
vnoremap <space>y y
nnoremap <space>p p
nnoremap <space>P P
vnoremap <space>p p
vnoremap <space>P P

nnoremap yy "ayy
nnoremap dd "add
vnoremap y "ay
vnoremap x "ax

nnoremap p "ap
nnoremap P "aP
vnoremap p "ap
vnoremap P "aP
