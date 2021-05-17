source ~/.vimrc                        " Source the vim specific settings first.

" Colorscheme.
set termguicolors                      " Set the terminal highlighting to use the gui 24 bit colors.
colorscheme verdurous-dark

" Statusline.
set noshowmode
let g:currentmode={
    \ 'n'    : 'Normal',
    \ 'no'   : 'Normal',
    \ 'nov'  : 'Normal',
    \ 'noV'  : 'Normal',
    \ 'no' : 'Normal',
    \ 'niI'  : 'Insert - Normal',
    \ 'niR'  : 'Replace - Normal',
    \ 'niV'  : 'Replace - Normal',
    \ 'v'    : 'Visual',
    \ 'V'    : 'Visual Line',
    \ ''   : 'Visual Block',
    \ 's'    : 'Select',
    \ 'S'    : 'Select Line',
    \ ''   : 'Select Block',
    \ 'i'    : 'Insert',
    \ 'ic'   : 'Insert',
    \ 'ix'   : 'Insert',
    \ 'R'    : 'Replace',
    \ 'Rc'   : 'Replace',
    \ 'Rv'   : 'Replace',
    \ 'Rx'   : 'Replace',
    \ 'c'    : 'Command',
    \ 'cv'   : 'Vim Ex',
    \ 'ce'   : 'Normal Ex',
    \ 'r'    : 'Hit Enter to Continue',
    \ 'rm'   : 'More...',
    \ 'r?'   : 'Confirm?',
    \ '!'    : 'External',
    \ 't'    : 'Terminal'
    \}
"<mode> <filename> <flags>
set statusline=%4*\ %{currentmode[mode(1)]}\ %2*\ %f\ %1*\ %m%q%h%w%r
"<filetype> <percentage through file> <line:column>
set statusline+=%=%y\ %2*\ %p%%\ %l:%c\ 

" Bindings.
" Get the highlight group of the text under the cursor.
nnoremap <leader>c :execute 'hi' synIDattr(synID(line("."), col("."), 1), "name")<CR>

