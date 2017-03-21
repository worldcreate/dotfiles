#/bin/bash

is_exists() {
	which "$1" >/dev/null 2>&1
	return $?
}

bundle_path=$HOME/dotfiles/.vim/bundle
dein_path=$HOME/dotfiles/.vim/bundle/repos/github.com/Shougo/

if [ -e $dein_path/dein.vim ]; then
	echo "すでにdein.vimはインストールされています"
	exit 1
fi

if [ ! -e $dein_path ]; then
	mkdir -p $dein_path
fi

if is_exists "git"; then
	cd $dein_path
	git clone https://github.com/Shougo/dein.vim
else
	echo "neobundleのインストールに失敗"
	exit 1
fi
