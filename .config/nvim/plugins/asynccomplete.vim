" https://github.com/prabirshrestha/asyncomplete.vim
set completeopt=menuone,noinsert,noselect,preview

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
