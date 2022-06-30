" Window reposition mappings {{{1
nmap <silent> <C-h> :call functions#winMove('h')<CR>
nmap <silent> <C-j> :call functions#winMove('j')<CR>
nmap <silent> <C-k> :call functions#winMove('k')<CR>
nmap <silent> <C-l> :call functions#winMove('l')<CR>
" 1}}}
function! functions#winMove(key) " {{{2
let t:curwin = winnr()
exec 'wincmd '.a:key
if (t:curwin == winnr())
if (match(a:key,'[jk]'))
wincmd v
else
wincmd s
endif
exec 'wincmd '.a:key
endif
endfunction
" 2}}}
