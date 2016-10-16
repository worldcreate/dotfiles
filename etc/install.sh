dotfile_remote_address='https://github.com/worldcreate/dotfiles.git'
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
		elif is_exists "curl" || is_exists "wget"; then
			local tarball='https://github.com/worldcreate/dotfiles/archive/master.tar.gz'

			if is_exists "curl"; then
				curl -L $tarball
			fi | tar zxv
			mv $HOME/dotfiles-master $HOME/dotfiles
		else
			echo 'インストールに失敗しました'
			exit 1
		fi
	fi
}

dotfile_init() {
	cd $HOME/dotfiles
	make init
	make deploy
}

dotfile_install() {
	dotfile_download

	dotfile_init
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
