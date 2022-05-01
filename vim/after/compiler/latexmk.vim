if !(filereadable(expand("%:p:h") . "/Makefile") ||
        \filereadable(expand("%:p:h") . "/makefile"))
    CompilerSet makeprg=latexmk\ -pdf\ \%
endif
