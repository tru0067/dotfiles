" This collection of settings aims to make the vim experience as pleasant as
" possible, while also remaining quite vanilla.
syntax on                              " Enable syntax highlighting.
filetype plugin indent on              " Enable filetype and plugin specific indenting.
" Broad settings.
set nocompatible                       " Don't be vi compatible.
set noswapfile                         " Don't clutter with .swp files.
set nobackup                           " Don't clutter with backups.
set undodir=/tmp//                     " Set undofile directory.
set undofile                           " Do save undofiles.
set encoding=utf-8                     " Encode in UTF-8.
set noerrorbells visualbell t_vb=      " No beeps or flashes.
" Broad behaviour.
set backspace=indent,eol,start         " Allow backspace to behave as expected.
set clipboard=unnamedplus              " Set clipboard to unnamed to access the system clipboard.
set mouse=a                            " Allow usage of the mouse.
" Formatting behaviour.
set textwidth=80                       " Use a text width of 80 characters.
set autoindent                         " Allow autoindentation.
set nojoinspaces                       " Only insert only one space when joining lines.
" Tab behaviour.
set tabstop=8                          " Display real tabs as 8 spaces.
set softtabstop=4                      " Insert up to 4 spaces when tab is pressed.
set shiftwidth=4                       " Use 4 spaces for autoindentation and for >>, << and ==.
set expandtab                          " Convert tabs to spaces.
" Visual settings.
set relativenumber                     " Show relative line numbers.
set number                             " Show the current line's number.
set ruler                              " Show coordinates in bottom right.
set nowrap                             " Do not visually wrap long lines.
set scrolloff=8                        " Keep 8 lines on screen while scrolling.
set sidescrolloff=8                    " Keep 8 columns on screen while scrolling.
set colorcolumn=81                     " Put a column line just after 80 characters.
set foldcolumn=auto                    " Show a column to indicate folds.
" Command line.
set showmode                           " Show the current mode.
set laststatus=2                       " Always show the status line.
set showcmd                            " Show (partial) commands.
set cmdheight=2                        " Show two lines for the command line.
" Command behaviour.
set wildmode=longest,list              " Complete longest matching string, then show available matches.
set incsearch                          " Incremental search.
set hidden                             " Allow windows to be closed without saving them.
" List and listchars behaviour.
set list                               " Use the list chars feature.
set listchars=nbsp:_                   " Non-breaking space.
set listchars+=tab:\|->                " Tabs.
set listchars+=trail:-                 " Trailing spaces.
set listchars+=extends:>               " Text extending past end of window.
set listchars+=precedes:<              " Text preceding past start of window.

" File explorer.
let g:netrw_browse_split=2             " Open from netrw in new vsplit.
let g:netrw_banner=0                   " Don't show netrw banner (toggle with I).
let g:netrw_winsize=25                 " Open netrw with 25% of current buffer.

" LaTeX
let g:tex_flavor="latex"               " Use LaTeX rather than TeX as the default for .tex files.
