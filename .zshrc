########################################
# 共通設定
########################################

########################################
# 環境変数
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export LANG=ja_JP.UTF-8
export TERM=xterm-256color
export EDITOR=nvim
export DOTFILES=$HOME/dotfiles
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
		source "$HOME/.zsh/.zshrc.macos"
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

# zwcがない場合コンパイルする
if [ ! -e $HOME/.zshrc.zwc ]; then
	zcompile ~/.zshrc
fi

# zshrcが更新されたら自動でコンパイルする
if [ $DOTFILES/.zshrc -nt ~/.zshrc.zwc ]; then
	zcompile ~/.zshrc
fi

