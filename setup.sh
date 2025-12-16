#!/bin/bash

# Install starship prompt into local bin folder
curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin

# Install zoxide directly into local bin folder
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash -s -- --bin-dir="$HOME/.local/bin"

# Install eza into local bin folder
wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O eza.tar.gz
tar xzvf eza.tar.gz
mv ./eza "$HOME/.local/bin/"
rm eza.tar.gz

# Install VimPlug for vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Move .bashrc to .bashrc.old
mv ~/.bashrc ~/.bashrc.old

# Copy over .bashrc, .vimrc and starship.toml
git clone https://github.com/michael-j-cho/hpc-configs.git
cp -rf hpc-configs/. ~/
rm -rf hpc-configs

source .bashrc
