#!/bin/bash
# I use the following
# Dracula theme (vim, tmux, and Terminal)
# Hack Font
# Tmux Plugin Manager
# Used to install required items
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
				declare -A osInfo;
				osInfo[/etc/redhat-release]=yum
				osInfo[/etc/arch-release]=pacman
				osInfo[/etc/gentoo-release]=emerge
				osInfo[/etc/SuSE-release]=zypp
				osInfo[/etc/debian_version]=apt-get
				osInfo[/etc/alpine-release]=apk
				for f in ${!osInfo[@]}
				do
						if [[ -f $f ]];then
								echo "Detected package manager: ${osInfo[$f]}"
						fi
				done
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "Detected MacOS, verifying brew"
	if [[ brew != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	elif
		brew install tmux
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
set -g @plugin 'dracula/tmux'

mkdir -p ~/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula
