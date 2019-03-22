function! s:wrap(seq)
  if mode() == 'c' && stridx('/?', getcmdtype()) < 0
    return a:seq
  endif
  silent! autocmd! vimnoh
  set hlsearch
  return a:seq."\<plug>NohTrailer"
endfunction

function! s:trailer()
  augroup vimnoh
    autocmd!
    autocmd CursorMoved,CursorMovedI * set nohlsearch | autocmd! vimnoh
  augroup END

  let seq = foldclosed('.') != -1 ? 'zv' : ''
  let after = len(maparg("<plug>NohAfter", mode())) ? "\<plug>NohAfter" : ''
  return seq . after
endfunction

function! s:trailer_on_leave()
  augroup vimnoh
    autocmd!
    autocmd InsertLeave * call <sid>trailer()
  augroup END
  return ''
endfunction

function! s:escape(backward)
  return '\V'.substitute(escape(@", '\' . (a:backward ? '?' : '/')), "\n", '\\n', 'g')
endfunction

map      <expr> <plug>NohTrailer <sid>trailer()
imap     <expr> <plug>NohTrailer <sid>trailer_on_leave()
cnoremap        <plug>NohCr      <cr>
noremap         <plug>NohPrev    <c-o>
inoremap        <plug>NohPrev    <nop>

cmap <expr> <cr> <sid>wrap("\<cr>")
map  <expr> n    <sid>wrap('n')
map  <expr> N    <sid>wrap('N')
map  <expr> gd   <sid>wrap('gd')
map  <expr> gD   <sid>wrap('gD')
map  <expr> *    <sid>wrap('*')
map  <expr> #    <sid>wrap('#')
map  <expr> g*   <sid>wrap('g*')
map  <expr> g#   <sid>wrap('g#')
xmap <expr> *    <sid>wrap("y/\<c-r>=<sid>escape(0)\<plug>NohCr\<plug>NohCr")
xmap <expr> #    <sid>wrap("y?\<c-r>=<sid>escape(1)\<plug>NohCr\<plug>NohCr")
