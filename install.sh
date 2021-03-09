#!/usr/bin/env bash

echo "Starting install"
if ! grep -q '$HOME/linux-config' $HOME/.bashrc; then
	cat $HOME/linux-config/.bashrc >> $HOME/.bashrc
	echo "Installing personal file reference into bashrc"
fi
if ! grep -q 'linux-config' $HOME/.vimrc 2> /dev/null; then
	cat $HOME/linux-config/.vimrc_config >> $HOME/.vimrc
	echo "Installing personal file reference into vimrc"
fi
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/syntax
mkdir -p ~/.vim_runtime/temp_dirs/undodir
cp -Ru ~/linux-config/.vim/syntax/* ~/.vim/syntax
echo "Installing syntax files for vim"
## if ! grep -q 'pathogen.vim' $HOME/.vim/autoload/pathogen.vim 2> /dev/null; then
if [ ! -f "$HOME/.vim/autoload/pathogen.vim" ] ; then
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	echo "Installing pathogen for vim"
fi
## if ! grep -q 'git' $HOME/.vim/bundle/vim-json 2> /dev/null; then
if [ ! -d "$HOME/.vim/bundle/vim-json/.git" ]; then
	echo "Installing vim-json for vim"
	git clone -q https://github.com/Ajhad1/vim-json.git $HOME/.vim/bundle/vim-json
else
	git --git-dir=$HOME/.vim/bundle/vim-json/.git --work-tree=$HOME/.vim/bundle/vim-json/ pull
	echo "vim-json is installed...Updating now"
fi
rm ~/.bash_ps1 2> /dev/null
echo "Sourcing bashrc"
source ~/.bashrc
