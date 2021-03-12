#!/usr/bin/env bash

# echo "Starting install"
if ! grep -q '$HOME/linux-config' $HOME/.bashrc; then
	cat $HOME/linux-config/.bashrc >> $HOME/.bashrc
	echo "Installing personal file reference into bashrc"
fi
if ! grep -q 'linux-config' $HOME/.vimrc 2> /dev/null; then
	cat $HOME/linux-config/.vimrc_config >> $HOME/.vimrc
	echo "Installing personal file reference into vimrc"
fi

git config --global color.ui always
git config --global color.branch auto
git config --global color.interactive always
git config --global color.status always
git config --global color.pager true
git config --global color.diff always
git  --git-dir=$HOME/linux-config/.git  --work-tree=$HOME/linux-config/ config user.name "Alejandro Colon"
git  --git-dir=$HOME/linux-config/.git  --work-tree=$HOME/linux-config/ config user.email "Alejandro@alejandroc.com"
git  --git-dir=$HOME/linux-config/.git  --work-tree=$HOME/linux-config/ config --global push.default matching
git  --git-dir=$HOME/linux-config/.git  --work-tree=$HOME/linux-config/ remote add origin https://ajhad1@github.com/Ajhad1/linux-config.git 2>/dev/null
git  --git-dir=$HOME/linux-config/.git  --work-tree=$HOME/linux-config/ remote set-url origin https://ajhad1@github.com/Ajhad1/linux-config.git

mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim_runtime/temp_dirs/undodir

if [ ! -d "$HOME/.vim/syntax" ]; then
	ln -s $HOME/linux-config/.vim/syntax $HOME/.vim/syntax
	echo "Installing syntax files for vim"
fi
if [ ! -f "$HOME/.vim/filetype.vim" ] ; then
	ln -s ~/linux-config/.vim/filetype.vim ~/.vim/filetype.vim
	echo "Installing filetype files for vim"
fi
if [ ! -f "$HOME/.vim/autoload/pathogen.vim" ] ; then
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	echo "Installing pathogen for vim"
fi
if [ ! -d "$HOME/.vim/bundle/vim-json/.git" ]; then
	echo "Installing vim-json for vim"
	git clone -q https://github.com/Ajhad1/vim-json.git $HOME/.vim/bundle/vim-json
else
	git --git-dir=$HOME/.vim/bundle/vim-json/.git --work-tree=$HOME/.vim/bundle/vim-json/ pull -q
	# echo "vim-json is installed...Updating now"
fi
rm ~/.bash_ps1 2> /dev/null
# echo "Sourcing bashrc"
source ~/.bashrc
