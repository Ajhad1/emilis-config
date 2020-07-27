#!/usr/bin/env bash

if ! grep -q '$HOME/linux-config' $HOME/.bashrc; then
    cat ~/linux-config/.bashrc >> ~/.bashrc
fi
if ! grep -q 'linux-config' $HOME/.vimrc 2> /dev/null; then
    cat ~/linux-config/.vimrc >> ~/.vimrc
fi
## cat ~/linux-config/.bashrc >> ~/.bashrc
## cat ~/linux-config/.vimrc >> ~/.vimrc
rm ~/.bash_ps1 2> /dev/null
source ~/.bashrc
