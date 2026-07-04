#!/usr/bin/env bash

# Update system
echo "=== Updating system..."
sudo pacman -Syu --noconfirm

# Install packages
sudo pacman -S --needed --noconfirm - < pkgs/pacman

# Install paru
if ! command -v paru &>/dev/null; then
	git clone https://aur.archlinux.org/paru.git
	(cd paru && makepkg -si --noconfirm)
	rm -rf paru
fi

cd ~/dotfiles

paru -S --needed --noconfirm - < pkgs/aur

if ! command -v stow &>/dev/null; then
	sudo pacman -S --needed --noconfirm stow
fi

cd ~/dotfiles
stow -v -t "$HOME" configuration

sudo systemctl enable --now NetworkManager
sudo systemctl enable sddm
sudo systemctl enable tuned

# Prompt to restart
printf "=== Now run:\n\treboot"
echo

# Prompt to login to Git
printf "=== Now run:\n\tgh auth login\n"
echo

printf "=== Now run:\n\tfirefox\nvia drun and install the extensions:
\tVimiumC
\tuBlockOrigin
	"
echo 

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "=== Setting zsh as default shell (optional)"
if [ "$SHELL" != "$(command -v zsh)" ]; then
  chsh -s "$(command -v zsh)"
fi



