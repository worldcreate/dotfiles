zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "b4b4r07/enhancd", use:init.sh, on:junegunn/fzf-bin

# Can manage local plugins
zplug "$HOME/dotfiles/.zsh/.plugin", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
