syntax on
colorscheme zenburn

set backspace=indent,eol,start

set hlsearch
set ignorecase
set number
set ruler

set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=0

set title
set showmatch
set autoindent
set smartindent
set smarttab
set cursorline

set encoding=utf-8

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set nocompatible
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/syntastic'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'itchyny/lightline.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
