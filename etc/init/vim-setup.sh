#/bin/bash

bundle_path=$HOME/dotfiles/.vim/bundle
if [ -e $bundle_path ]; then
	mkdir -p $bundle_path
fi

cd $bundle_path
git clone https://github.com/Shougo/neobundle.vim
