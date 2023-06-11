set rtp^="/home/riku/.opam/5.0.0/share/ocp-indent/vim"

call jetpack#begin()

call jetpack#add('prabirshrestha/vim-lsp')
call jetpack#add('mattn/vim-lsp-settings')
call jetpack#add('prabirshrestha/asyncomplete.vim')
call jetpack#add('prabirshrestha/asyncomplete-lsp.vim')


call jetpack#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})

" color scheme
call jetpack#add('rebelot/kanagawa.nvim')

" ファイラー
call jetpack#add('lambdalisue/fern.vim')
call jetpack#add('lambdalisue/fern-git-status.vim')
call jetpack#add('lambdalisue/nerdfont.vim')
call jetpack#add('lambdalisue/fern-renderer-nerdfont.vim')

" Git操作

call jetpack#add('tpope/vim-fugitive')

call jetpack#add('darrikonn/vim-gofmt', {'do': ":GoUpdateBinaries"})

call jetpack#add('editorconfig/editorconfig-vim')
call jetpack#add('vim-airline/vim-airline')
call jetpack#add('vim-airline/vim-airline-themes')


call jetpack#add('frazrepo/vim-rainbow')

" Git差分表示
call jetpack#add('lewis6991/gitsigns.nvim')

" Telescope ファジーファインダー

call jetpack#add('nvim-lua/plenary.nvim')
call jetpack#add('nvim-telescope/telescope.nvim')

call jetpack#end()

colorscheme kanagawa


set number
set relativenumber


" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set mouse=

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" ================================ keyconfig

let mapleader = "\<Space>"

nnoremap <silent> <leader>rr :source $MYVIMRC<CR>
nnoremap <silent> <leader>O :e $MYVIMRC<CR>


" ============================== LSP
"

if executable('haskell-language-server-wrapper')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'haskell-ls',
      \ 'cmd': { server_info->['haskell-language-server-wrapper', '--lsp']},
      \ 'root_uri':{server_info->lsp#utils#path_to_uri(
      \    lsp#utils#find_nearest_parent_file_directory(
      \      lsp#utils#get_buffer_path(),
      \      ['.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml', '.git'],
      \    ))},
      \ 'allowlist': ['haskell', 'lhaskell'],
      \ })
endif

if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \   'initialization_options': {
        \     'cargo': {
        \       'buildScripts': {
        \         'enable': v:true,
        \       },
        \     },
        \     'procMacro': {
        \       'enable': v:true,
        \     },
        \   },
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    let g:lsp_inlay_hints_enabled = 1
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ================================ vim-airline
let g:ariline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline_theme='bubblegum'


" ================================ vim-rainbow
let g:rainbow_active = 1

" ================================ fern

let g:fern#renderer = "nerdfont"
let g:fern#renderer#nerdfont#indent_markers = 1

" ================================ gitsigns

:lua require('gitsigns').setup()
set signcolumn=yes

" ================================ telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

