" Vim compiler file
" Compiler:     Closure Linter
" (http://code.google.com/closure/utilities/docs/linter_howto.html)
" Maintainer:   Wendall Cada <wendallc@83864.com>
"
" DEPENDENCIES:
"  - closure linter
"  (http://code.google.com/closure/utilities/docs/linter_howto.html). 
"
" CONFIGURATION:
"   The optional closure lint configuration can be specified in g:gjslint_config. 
"
" USAGE:
"   :make [{gjslint-args}]
"

if exists('current_compiler')
    finish
endif
let current_compiler = 'gjslint'

if exists(':CompilerSet') != 2		" older Vim always used :setlocal
    command -nargs=* CompilerSet setlocal <args>
endif

let s:scriptDir = expand('<sfile>:p:h')
execute 'CompilerSet makeprg=gjslint\ --nojsdoc\ --max_line_length=120\ $*\ $*\ \"%\"'
unlet s:scriptDir

CompilerSet errorformat=%A%f(%l):\ %m,%-Z%p^,%-C%.%#,%-G

" vim: set sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
