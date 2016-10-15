export EDITOR=/usr/bin/vim
export TERM=xterm-256color
eval `dircolors ~/.colorrc`

if [ -f $HOME/dotfiles/git-completion.bash ]; then
	source $HOME/dotfiles/git-completion.bash
fi

if [ -f $HOME/dotfiles/git-prompt.sh ]; then
	source $HOME/dotfiles/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREM=auto

export PS1='[\[\033[0;32m\]\u@\h \[\033[0;34m\]\w\[\033[0m\]]\[\033[36m\]$(__git_ps1)\[\033[00m\]\$ '

alias ls='ls --color'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/riku/.sdkman"
[[ -s "/home/riku/.sdkman/bin/sdkman-init.sh" ]] && source "/home/riku/.sdkman/bin/sdkman-init.sh"
