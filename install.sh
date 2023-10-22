# install packages
nix-env -iA \
	nixos.zsh \
	nixos.antibody \
	nixos.git \
	nixos.neovim \
	nixos.tmux \
	nixos.stow \
	nixos.yarn \
	nixos.fzf \
	nixos.ripgrep \
	nixos.bat \
	nixos.gnumake \
	nixos.gcc \
	nixos.direnv

# stow dotfiles
stow git
stow nvim
stow tmux
stow zsh

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins 
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install neovim plugins
nvim --headless +PlugInstall +qall

# Use kitty terminal on MacOS
[ `uname -s` = 'Darwin' ] && stow kitty
