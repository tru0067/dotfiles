source ~/dotfiles/vim/after/ftplugin/Writing.vim
" Set `makeprg` if there is no `Makefile`.
if !filereadable(expand("%:p:h") . "/Makefile")
    setlocal makeprg=pdflatex\ \%
endif
