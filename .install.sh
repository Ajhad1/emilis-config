#!/usr/bin/env bash

if ! grep -q '$HOME/linux-config' $HOME/.bashrc; then
    cat ~/linux-config/.bashrc >> ~/.bashrc
fi
if ! grep -q '$HOME/linux-config' $HOME/.vimrc; then
    cat ~/linux-config/.vimrc >> ~/.vimrc
fi
## cat ~/linux-config/.bashrc >> ~/.bashrc
## cat ~/linux-config/.vimrc >> ~/.vimrc
rm ~/.bash_ps1 2> /dev/null
source ~/.bashrc
