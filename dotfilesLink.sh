#! /bin/sh
# Dropbox 
#ln -fs ~/Dropbox/dotfiles/.bash_profile ~/.bash_profile
#ln -fs ~/Dropbox/dotfiles/.bashrc ~/.bashrc
#ln -fs ~/Dropbox/dotfiles/.vim ~/.vim
#ln -fs ~/Dropbox/dotfiles/.zprofile ~/.zprofile 
#ln -fs ~/Dropbox/dotfiles/.zshrc ~/.zshrc
#ln -fs ~/Dropbox/dotfiles/.zshenv ~/.zshenv
# Github
ln -fs ~/dotfiles/.bash_profile ~/.bash_profile
ln -fs ~/dotfiles/.bashrc ~/.bashrc
ln -fs ~/dotfiles/.vim ~/.vim
ln -fs ~/dotfiles/.zprofile ~/.zprofile 
ln -fs ~/dotfiles/.zshrc ~/.zshrc
ln -fs ~/dotfiles/.zshenv ~/.zshenv

if [ ! -e ~/Dropbox/dotfiles/.vim/bundle/Vundle.vim/ ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
