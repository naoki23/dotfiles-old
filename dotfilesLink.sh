#! /bin/sh
# Dropbox 
#ln -fs ~/Dropbox/Share/dotfiles/.bash_profile ~/.bash_profile
#ln -fs ~/Dropbox/Share/dotfiles/.bashrc ~/.bashrc
#ln -fs ~/Dropbox/Share/dotfiles/.vim ~/.vim
#ln -fs ~/Dropbox/Share/dotfiles/.zprofile ~/.zprofile 
#ln -fs ~/Dropbox/Share/dotfiles/.zshrc ~/.zshrc
#ln -fs ~/Dropbox/Share/dotfiles/.zshenv ~/.zshenv
# Github
ln -fs ~/dotfiles/.bash_profile ~/.bash_profile
ln -fs ~/dotfiles/.bashrc ~/.bashrc
ln -fs ~/dotfiles/.vim ~/.vim
ln -fs ~/dotfiles/.zprofile ~/.zprofile 
ln -fs ~/dotfiles/.zshrc ~/.zshrc
ln -fs ~/dotfiles/.zshenv ~/.zshenv

if [ ! -e ~/dotfiles/.vim/bundle/Vundle.vim/ ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
