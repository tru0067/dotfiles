source ~/.vimrc                        " Source the vim specific settings first.

" Colorscheme.
set termguicolors                      " Set the terminal highlighting to use the gui 24 bit colors.
colorscheme dalak

" Bindings.
" Edit the various config files.
nnoremap <leader>edr :edit ~/dotfiles/vim/.vimrc<CR>
nnoremap <leader>esr :edit ~/.vimrc<CR>
nnoremap <leader>edi :edit ~/dotfiles/vim/init.vim<CR>
nnoremap <leader>esi :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>
" Color 'debugger'.
nnoremap <leader>c :execute 'hi' synIDattr(synID(line("."), col("."), 1), "name")<CR>

