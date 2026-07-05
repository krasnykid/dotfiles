#!/usr/bin/env bash

strip_blanks_comments() {
  grep -v '^\s*#' "$1" | grep -v '^\s*$'
}

# Update system
echo "=== Updating system..."
sudo pacman -Syu --noconfirm

# Install packages
sudo pacman -S --needed --noconfirm - <  <(strip_blanks_comments pkgs/pacman)

# Install paru
if ! command -v paru &>/dev/null; then
	git clone https://aur.archlinux.org/paru.git
	(cd paru && makepkg -si --noconfirm)
	rm -rf paru
fi

cd ~/dotfiles

# Install AUR
paru -S --needed --noconfirm - < <(strip_blanks_comments pkgs/aur)

if ! command -v stow &>/dev/null; then
	sudo pacman -S --needed --noconfirm stow
fi

cd ~/dotfiles
stow -v -t "$HOME" configuration

sudo systemctl enable --now NetworkManager
sudo systemctl enable tuned

# Prompt to restart
printf "=== Now run:\n\treboot"
echo

# Prompt to login to GitHub
printf "=== Now run:\n\tgh auth login\n"
echo

# Set default Git editor
git config --global core.editor "nvim"

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Cloning theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestion
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/hlissner/zsh-autopair ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autopair


echo "=== Setting zsh as default shell (optional)"
if [ "$SHELL" != "$(command -v zsh)" ]; then
  chsh -s "$(command -v zsh)"
fi
