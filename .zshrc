########################################
# 共通設定
########################################

########################################
# 環境変数
export LANG=ja_JP.UTF-8
export TERM=xterm-256color
export EDITOR=/usr/bin/vim
eval `dircolors ~/.colorrc`

# 各設定ファイルの読み込み
for f ($HOME/.zsh/init/*.zshrc) {source $f;}

########################################
# OS 別の設定
########################################
#
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        ;;
    linux*)
        #Linux用の設定
		source "$HOME/.zsh/.zshrc.linux"
        ;;
	cygwin | msys)
		#Win用の設定ファイルを読み込む
		source "$HOME/.zsh/.zshrc.win"
		;;
esac

