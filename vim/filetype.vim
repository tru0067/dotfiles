" My custom filetype associations.
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.pl setfiletype prolog
augroup END
