dotfile_remote_address='git@github.com:worldcreate/dotfiles.git'
dotfile_path="$HOME/dotfiles"

is_exists() {
	which "$1" >/dev/null 2>&1
	return $?
}

dotfile_download() {
	if [ -e $dotfile_path ]; then
		echo 'すでにインストール済みです'
		exit 1
	else
		if is_exists "git"; then
			git clone $dotfile_remote_address $dotfile_path
		fi
	fi
}

dotfile_install() {
	dotfile_download
}

logs="
  ____                       ____ _      _
 / ___| _ __   _____      __/ ___(_)_ __| |
 \___ \| '_ \ / _ \ \ /\ / / |  _| | '__| |
  ___) | | | | (_) \ V  V /| |_| | | |  | |
 |____/|_| |_|\___/ \_/\_/  \____|_|_|  |_|
"

echo "$logs"

dotfile_install
