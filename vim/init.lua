vim.cmd[[
" This config aims to enhance and extend the default vim experience.
source ~/.vimrc                        " Source the vim specific settings first.

set rtp+=~/dotfiles/vim
set rtp+=~/dotfiles/vim/after

" Colorscheme.
set termguicolors                      " Set the terminal highlighting to use full 24 bit colors.
colorscheme verdurous-darker

" Statusline.
source ~/dotfiles/vim/statusline.vim
set laststatus=3

" Bindings.
" Let Ctrl-W delete the previous WORD.
inoremap <C-W> <C-\><C-O>dB
" Let Ctrl-Backspace delete the previous word.
inoremap <C-H> <C-\><C-O>db
" Let Ctrl-Delete delete the next word.
inoremap <C-Del> <C-\><C-O>dw
" Let Ctrl-J/Ctrl-K move the selected region down/up.
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv
" Correct the last spelling error.
inoremap <C-L> <C-G>u<ESC>[s1z=`]a<C-G>u
nnoremap <C-L> m`[s1z=``
let mapleader=" "
" Open file explorer.
nnoremap <leader>e :Lex<CR>

" Commands.
" See unsaved changes.
command Changes :w !diff % -

" Autocommands.
" Highlight yanks.
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=120}
augroup END
]]

require"packer".startup(function(use)
    use"wbthomason/packer.nvim"
end)
