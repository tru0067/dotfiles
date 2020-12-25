syntax on                              " Enable syntax highlighting
filetype plugin indent on              " Enable filetype and plugin specific indenting
" Broad settings
set nocompatible                       " Don't be vi compatible
set noswapfile                         " Don't clutter with .swp files
set nobackup                           " Don't clutter with backups
set undodir=~/.vim/undodir             " Set undofile directory
set undofile                           " Do save undofiles
set encoding=utf-8                     " Encode in UTF-8
set noerrorbells visualbell t_vb=      " No beeps or flashes
" Broad behaviour
set backspace=indent,eol,start         " Allow backspace to behave as expected
set clipboard=unnamed                  " Set clipboard to unnamed to access the system clipboard
set mouse=a                            " Allow usage of the mouse
set autoindent                         " Allow autoindentation
set tabstop=8                          " Display real tabs as 8 spaces
set softtabstop=4                      " Insert up to 4 spaces when tab is pressed
set shiftwidth=4                       " Use 4 spaces for autoindentation and for >>, << and ==
set expandtab                          " Convert tabs to spaces
" Visual settings
set termguicolors                      " Set the terminal highlighting to use the gui 24 bit colors
set number                             " Show line numbers
set relativenumber                     " Show relative line numbers
set ruler                              " Show coordinates in bottom right
set scrolloff=8                        " Keep 8 lines on screen while scrolling
set nowrap                             " Do not visually wrap long lines
set showmatch                          " Highlight matching parenthesis
set colorcolumn=80                     " Put a 80 character column line
colorscheme dalek
" Command line
set showmode                           " Show the current mode
set laststatus=2                       " Always show the status line
set showcmd                            " Show (partial) commands
set cmdheight=2                        " Show two lines for the command line
" Command behaviour
" set wildmenu                           " Show completion options in the status bar
set wildmode=longest,list              " Complete longest matching string, then show available matches
set smartcase                          " Search only case sensitive if mixed case has been entered
set incsearch                          " Incremental search
set hidden                             " Allow windows to be closed without saving them

" Bindings
map Y y$                               " Y yanks to end of line (consistent with D and C)
let mapleader=" "
nnoremap <leader>h :wincmd h<CR>       " Navigate to left window
nnoremap <leader>j :wincmd j<CR>       " Navigate to lower window
nnoremap <leader>k :wincmd k<CR>       " Navigate to upper window
nnoremap <leader>l :wincmd l<CR>       " Navigate to right window
nnoremap <leader>e :Lex<CR>            " Open file explorer
nnoremap <silent><leader>= :vertical resize +5<CR>
nnoremap <silent><leader>- :vertical resize -5<CR>
nnoremap <leader>rce :edit ~/dotfiles/vim/.vimrc<CR>
nnoremap <leader>rcr :source ~/.vimrc<CR>
" TEMPORARY COLOR DEBUGGER
nnoremap <leader>c :execute 'hi' synIDattr(synID(line("."), col("."), 1), "name")<CR>

" File explorer
let g:netrw_browse_split=2             " Open from netrw in new vsplit
let g:netrw_banner=0                   " Don't show netrw banner (toggle with I)
let g:netrw_winsize=25                 " Open netrw with 25% of current buffer

" LaTeX
let g:tex_flavor="latex"               " Use LaTeX rather than TeX as the default for .tex files

" Open new buffers in insert mode.
au BufNewFile * startinsert
au VimEnter * if empty(expand("%")) | startinsert | endif

