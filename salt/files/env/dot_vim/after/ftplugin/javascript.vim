" Set Closure Linter as compiler.
if ! exists('b:current_compiler')
  compiler gjslint
endif
