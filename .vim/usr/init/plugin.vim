" powerline 用の設定
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
" ===================================

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
	call dein#add('Shougo/neomru.vim')
	call dein#add('scrooloose/nerdtree')
	call dein#add('jistr/vim-nerdtree-tabs')
	call dein#add('Xuyuanp/nerdtree-git-plugin')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('justmao945/vim-clang')
	call dein#add('freitass/todo.txt-vim')
	call dein#add('simeji/winresizer')
	call dein#add('fatih/vim-go')
	call dein#add('rust-lang/rust.vim')
	call dein#add('racer-rust/vim-racer')

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

filetype plugin indent on
syntax enable

