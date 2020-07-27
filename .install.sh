#!/usr/bin/env bash

cat ~/linux-config/.bashrc >> ~/.bashrc
cat ~/linux-config/.vimrc >> ~/.vimrc
rm ~/.bash_ps1 2> /dev/null
source ~/.bashrc
