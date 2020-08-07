#!/usr/bin/env bash

if ! grep -q '$HOME/linux-config' $HOME/.bashrc; then
	cat ~/linux-config/.bashrc >> ~/.bashrc
fi
if ! grep -q 'linux-config' $HOME/.vimrc 2> /dev/null; then
	cat ~/linux-config/.vimrc_config >> ~/.vimrc
fi
## cat ~/linux-config/.bashrc >> ~/.bashrc
## cat ~/linux-config/.vimrc >> ~/.vimrc
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
## if ! grep -q 'pathogen.vim' $HOME/.vim/autoload/pathogen.vim 2> /dev/null; then
if [ ! -f "~/.vim/autoload/pathogen.vim" ] ; then
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi
## if ! grep -q 'git' $HOME/.vim/bundle/vim-json 2> /dev/null; then
if [ ! -f "~/.vim/bundle/vim-json" ]; then
	git clone https://github.com/Ajhad1/vim-json.git ~/.vim/bundle/vim-json
else
	git --git-dir=$HOME/.vim/bundle/vim-json/.git --work-tree=$HOME/.vim/bundle/vim-json/ pull
fi
rm ~/.bash_ps1 2> /dev/null
source ~/.bashrc
