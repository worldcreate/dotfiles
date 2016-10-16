export EDITOR=/usr/bin/vim
export TERM=xterm-256color
eval `dircolors ~/.colorrc`


# powerlineが導入されているかどうかで表示を変更する
powerline-daemon -h >/dev/null 2>&1

if [ $? = 0 ]; then
	powerline-daemon -q
	. $HOME/.local/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
else
	if [ -f $HOME/dotfiles/bin/git-completion.bash ]; then
		source $HOME/dotfiles/git-completion.bash
	fi

	if [ -f $HOME/dotfiles/bin/git-prompt.sh ]; then
		source $HOME/dotfiles/git-prompt.sh
	fi
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_SHOWSTASHSTATE=true
	GIT_PS1_SHOWUPSTREM=auto

	export PS1='[\[\033[0;32m\]\u@\h \[\033[0;34m\]\w\[\033[0m\]]\[\033[36m\]$(__git_ps1)\[\033[00m\]\$ '

fi


alias ls='ls --color'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
if [ -e $HOME/.sdkman ]; then
	export SDKMAN_DIR="$HOME/.sdkman"
	[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
