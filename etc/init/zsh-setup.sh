#/bin/bash

zplug_install_path=$HOME/dotfiles/.zsh

if [ ! -e $zplug_install_path ]; then
	mkdir -p $zplug_install_path
fi

cd $zplug_install_path

git clone https://github.com/zplug/zplug .zplug
