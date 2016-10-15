#!/bin/sh
for dotfile in .?*; do
    case $dotfile in
        *.elc)
            continue;;
        ..)
            continue;;
        .git)
            continue;;
		.gitignore)
			continue;;
        .vimperator)
            ln -Fis "$PWD/$dotfile/plugin" $HOME/$dotfile/plugin
            ;;
        *)
		if [ ! -e $PWD/$dotfile ]; then
				# 存在しない場合
				ln -Fis "$PWD/$dotfile" $HOME
				echo "$dotfileを$HOMEにリンクを貼ります"
			fi
            ;;
    esac
done
echo "complete!"
