#/bin/bash

is_exists() {
	which "$1" >/dev/null 2>&1
	return $?
}

bundle_path=$HOME/dotfiles/.vim/bundle
if [ ! -e $bundle_path ]; then
	mkdir -p $bundle_path
fi

cd $bundle_path

if is_exists "git"; then
	git clone https://github.com/Shougo/neobundle.vim
elif is_exists "curl"; then
	curl https://github.com/Shougo/neobundle.vim/archive/master.tar.gz | tar zxv
else
	echo "neobundleのインストールに失敗"
	exit 1
fi
