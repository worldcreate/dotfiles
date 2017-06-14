
########################################
# function
########################################

# SDKMANの読み込み
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
if [ -e $HOME/.sdkman ]; then
	export SDKMAN_DIR="$HOME/.sdkman"
	[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
	export PATH="$HOME/.jenv/bin:$PATH"
	eval "$(jenv init -)"
	export PATH="$HOME/.local/bin/:$PATH"
fi

# powerlineの読み込み

powerline-daemon -h >/dev/null 2>&1

if [ $? = 0 ]; then
	powerline-daemon -q
	. /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
else
	#######################################
	# vcs_info
	autoload -Uz vcs_info
	autoload -Uz add-zsh-hook

	zstyle ':vcs_info:*' formats '%F{cyan}(%b)%f'
	zstyle ':vcs_info:*' actionformats '%F{red}(%b|%a)%f'

	function _update_vcs_info_msg() {
	    LANG=en_US.UTF-8 vcs_info
	    #RPROMPT="${vcs_info_msg_0_}"
		# プロンプト
		# 1行表示
		#PROMPT="%~ %# "
		# 2行表示
		PROMPT="[%{${fg[green]}%}%n@%m %{${fg[blue]}%}%~%{${reset_color}%}]%{${vcs_info_msg_0_}%}%# "
		[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
			PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
		;

	}
	add-zsh-hook precmd _update_vcs_info_msg

fi
