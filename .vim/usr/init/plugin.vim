" dein.vimの設定
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundle/')
	call dein#begin(expand('~/.vim/bundle/'))

	call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

	call dein#add('Shougo/vimshell')
	call dein#add('Shougo/vimfiler.vim')
	call dein#add('Shougo/unite.vim')
	call dein#add('scrooloose/nerdtree')
	call dein#add('jistr/vim-nerdtree-tabs')
	call dein#add('Xuyuanp/nerdtree-git-plugin')
	call dein#add('airblade/vim-gitgutter')

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

filetype plugin indent on
syntax enable

