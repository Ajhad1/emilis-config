
## Import Personal Configuration Files
if [ -f "$HOME/linux-config/.bash_ps1" ] && [[ $- == *i* ]]; then
    . "$HOME/linux-config/.bash_ps1"
fi
