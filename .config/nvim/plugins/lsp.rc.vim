function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> [e <Plug>(lsp-previous-error)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> ]e <Plug>(lsp-next-error)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> <leader>s <plug>(lsp-document-symbol)
    nmap <buffer> <leader>a <plug>(lsp-code-action)
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
