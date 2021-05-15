source ~/.vimrc                        " Source the vim specific settings first.

" Colorscheme.
set termguicolors                      " Set the terminal highlighting to use the gui 24 bit colors.
colorscheme verdurous-dark

" Bindings.
" Get the highlight group of the text under the cursor.
nnoremap <leader>c :execute 'hi' synIDattr(synID(line("."), col("."), 1), "name")<CR>

