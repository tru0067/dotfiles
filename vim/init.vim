source ~/.vimrc                        " Source the vim specific settings first.

set rtp+=~/dotfiles/vim
set rtp+=~/dotfiles/vim/after

" Colorscheme.
set termguicolors                      " Set the terminal highlighting to use full 24 bit colors.
colorscheme verdurous-dark

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

" Autocommands.
" Highlight yanks.
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=120}
augroup END
