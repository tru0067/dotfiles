source ~/.vimrc                        " Source the vim specific settings first.

set rtp+=~/dotfiles/vim
set rtp+=~/dotfiles/vim/after

" Colorscheme.
set termguicolors                      " Set the terminal highlighting to use the gui 24 bit colors.
colorscheme verdurous-dark

" Plugins
call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

" UltiSnips
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit=$HOME."/dotfiles/vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

" Statusline.
source ~/dotfiles/vim/statusline.vim

" Bindings.
" Get the highlight group of the text under the cursor.
nnoremap <leader>c :execute 'hi' synIDattr(synID(line("."), col("."), 1), "name")<CR>
