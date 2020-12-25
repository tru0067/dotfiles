source ~/dotfiles/vim/.vimrc           " Source the vim compatible settings first.

" Colorscheme.
set termguicolors                      " Set the terminal highlighting to use the gui 24 bit colors
colorscheme dalek

" Bindings.
nnoremap <leader>rce :edit ~/dotfiles/vim/.vimrc<CR>
nnoremap <leader>rcr :source ~/.vimrc<CR>
" Color 'debugger'
nnoremap <leader>c :execute 'hi' synIDattr(synID(line("."), col("."), 1), "name")<CR>

