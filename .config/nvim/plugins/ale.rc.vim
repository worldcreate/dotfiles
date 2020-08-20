
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END


if executable('eslint_d')
    let g:ale_javascript_eslint_use_global = 1
    let g:ale_javascript_eslint_executable = 'eslint_d'
endif

let g:ale_linters_explicit = 1
let g:ale_linter_aliases = {'jsx': ['javascript']}
let g:ale_linters = {
      \ 'jsx': ['eslint'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tsserver', 'eslint'],
      \}

let g:ale_fixers = {
      \ 'jsx': ['eslint'],
      \ 'javascript': ['eslint']
      \}
let g:ale_sign_error = '❌'
let g:ale_fix_on_save = 1
