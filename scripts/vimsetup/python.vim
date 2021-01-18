" Python specific settings.
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal formatoptions=croql

let b:ale_linters = ['flake8']
let b:ale_fixers = ['autopep8']
let b:ale_warn_about_trailing_whitespace = 1
let g:ale_set_quickfix = 1
let g:ale_enabled = 0
