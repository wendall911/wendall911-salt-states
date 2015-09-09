augroup filetypedetect
    au BufNewFile,BufRead *.as      set filetype=actionscript
    au BufNewFile,BufRead *.mako    set filetype=mako
    au BufNewFile,BufRead *.js      set filetype=javascript syntax=jquery
    au BufNewFile,BufRead *.sjs     set filetype=html
    autocmd! BufNewFile,BufRead *.txt setfiletype text
augroup END
