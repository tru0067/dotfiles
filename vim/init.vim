" This config aims to enhance and extend the default vim experience.
source ~/.vimrc                        " Source the vim specific settings first.

set rtp+=~/dotfiles/vim
set rtp+=~/dotfiles/vim/after

" Colorscheme.
set termguicolors                      " Set the terminal highlighting to use full 24 bit colors.
colorscheme verdurous-darker

" Plugins
call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
call plug#end()

" UltiSnips
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit=$HOME."/dotfiles/vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

" TreeSitter.
lua <<EOF
require'nvim-treesitter.configs'.setup{
    ensure_installed = {"julia", "latex", "lua", "python", "query"},
    highlight = {enable = true}
}
EOF

" Statusline.
source ~/dotfiles/vim/statusline.vim

" Bindings.
" Y yanks to end of line (consistent with D and C).
nnoremap Y y$
" Let Ctrl-W delete the previous WORD.
inoremap <C-W> <C-\><C-O>dB
" Let Ctrl-Backspace delete the previous word.
inoremap <C-H> <C-\><C-O>db
" Let Ctrl-Delete delete the next word.
inoremap <C-Del> <C-\><C-O>dw
" Let Ctrl-J/Ctrl-K move the selected region down/up.
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv
let mapleader=" "
" Open file explorer.
nnoremap <leader>e :Lex<CR>
" See unsaved changes.
nnoremap <leader>C :w !diff % -<CR>
" Add quotes around visual selection.
" TODO: Would like to have a version of this that does not pollute the jumplist,
"       and which places the cursor back at the same position.
vnoremap <leader>" <ESC>`<i"<ESC>`>a"<ESC>

" Autocommands.
" Highlight yanks.
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=120}
augroup END
