#!/usr/bin/env bash

echo "Clone succeeded"
echo "Starting install"
if ! grep -q '$HOME/linux-config' $HOME/.bashrc; then
	cat ~/linux-config/.bashrc >> ~/.bashrc
	echo "Inserting personal file reference into bashrc"
fi
if ! grep -q 'linux-config' $HOME/.vimrc 2> /dev/null; then
	cat ~/linux-config/.vimrc_config >> ~/.vimrc
	echo "Inserting personal file reference in vimrc"
fi
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
## if ! grep -q 'pathogen.vim' $HOME/.vim/autoload/pathogen.vim 2> /dev/null; then
if [ ! -f "~/.vim/autoload/pathogen.vim" ] ; then
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	echo "Installing pathogen for vim"
fi
## if ! grep -q 'git' $HOME/.vim/bundle/vim-json 2> /dev/null; then
if [ ! -f "~/.vim/bundle/vim-json/.git" ]; then
	echo "vim-json is not installed...Installing now"
	git clone -q https://github.com/Ajhad1/vim-json.git ~/.vim/bundle/vim-json
else
	git --git-dir=$HOME/.vim/bundle/vim-json/.git --work-tree=$HOME/.vim/bundle/vim-json/ pull
	echo "vim-json is installed...Updating now"
fi
rm ~/.bash_ps1 2> /dev/null
echo "Sourcing bashrc"
source ~/.bashrc
