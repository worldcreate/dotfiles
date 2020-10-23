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
	call dein#begin('~/.vim/bundle/')

	call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

"	call dein#add('Shougo/deoplete.nvim')
	if !has('nvim')
	  call dein#add('roxma/nvim-yarp')
"	  call dein#add('roxma/vim-hug-neovim-rpc')
	endif

	call dein#add('Shougo/vimshell')
	call dein#add('Shougo/vimfiler.vim')
	call dein#add('Shougo/unite.vim')
	call dein#add('Shougo/neomru.vim')
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('mattn/vim-sonictemplate')
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
	call dein#add('Lokaltog/vim-easymotion')
	call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'}) " pythonの高機能な補完機能

	call dein#end()
	call dein#save_state()
endif


filetype plugin indent on
syntax enable

