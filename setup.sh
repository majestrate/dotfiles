#!/usr/bin/env bash
#
# setup dotfiles
#
mkdir -p ~/git
git clone https://github.com/Homebrew/linuxbrew.git ~/.linuxbrew
git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
git clone https://github.com/majestrate/dotfiles ~/git/dotfiles
cp ~/git/dotfiles/zshrc ~/.zshrc
cp ~/git/dotfiles/tmux.conf ~/.tmux.conf
