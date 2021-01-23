syntax on                              " Enable syntax highlighting
filetype plugin indent on              " Enable filetype and plugin specific indenting
" Broad settings
set nocompatible                       " Don't be vi compatible
set noswapfile                         " Don't clutter with .swp files
set nobackup                           " Don't clutter with backups
set undodir=/tmp//                     " Set undofile directory
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
" Formatting options
set formatoptions=r                    " Automatically insert the comment leader when pressing <Enter> in insert mode
set formatoptions+=q                   " Allow formatting with "gq"
set formatoptions+=n                   " Recognize numbered lists when formatting
set formatoptions+=j                   " Remove comment leader when joining lines with "J"
set textwidth=80                       " Use a text width of 80 characters (only used with "gq" with the above formatting settings)
" Visual settings
set number                             " Show line numbers
set relativenumber                     " Show relative line numbers
set ruler                              " Show coordinates in bottom right
set scrolloff=8                        " Keep 8 lines on screen while scrolling
set nowrap                             " Do not visually wrap long lines
set showmatch                          " Highlight matching parenthesis
set colorcolumn=80                     " Put a 80 character column line
" Command line
set showmode                           " Show the current mode
set laststatus=2                       " Always show the status line
set showcmd                            " Show (partial) commands
set cmdheight=2                        " Show two lines for the command line
" Command behaviour
"set wildmenu                           " Show completion options in the status bar
set wildmode=longest,list              " Complete longest matching string, then show available matches
set smartcase                          " Search only case sensitive if mixed case has been entered
set incsearch                          " Incremental search
set hidden                             " Allow windows to be closed without saving them

" Bindings
" Y yanks to end of line (consistent with D and C)
nnoremap Y y$
let mapleader=" "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>e :Lex<CR>
nnoremap <silent><leader>= :vertical resize +5<CR>
nnoremap <silent><leader>- :vertical resize -5<CR>

" File explorer
let g:netrw_browse_split=2             " Open from netrw in new vsplit
let g:netrw_banner=0                   " Don't show netrw banner (toggle with I)
let g:netrw_winsize=25                 " Open netrw with 25% of current buffer

" LaTeX
let g:tex_flavor="latex"               " Use LaTeX rather than TeX as the default for .tex files

