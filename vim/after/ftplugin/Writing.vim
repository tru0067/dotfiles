" Use vim's spell checking feature.
setlocal spell
" Formatting options:
" t     Auto-wrap text using textwidth.
" c     Auto-wrap comments using textwidth, inserting the comment leader.
" r     Automatically insert the comment leader with <Enter> in insert mode.
" o     Automatically insert the comment leader with "o" or "O" in normal mode.
" q     Allow formatting with "gq".
" n     Recognize numbered lists when formatting.
" j     Remove comment leader when joining lines with "J".
" l     Lines already longer than textwidth are not automatically broken.
setlocal formatoptions=tcroqnjl
