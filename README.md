# My Personal Configuration Files
Using git I download my personal configuration files to the machines running linux and run a script to install and manage them.
In this way, updating a configuration in one place will update my configurations in all places.

# Run to Import Personal Configuration Files
$ cd ~ && git clone https://github.com/Ajhad1/linux-config.git && ~/linux-config/install.sh && source ~/.bashrc

## Run to Fix origin bug
$ cd ~ && rm -rf linux-config && git clone https://github.com/Ajhad1/linux-config.git && ~/linux-config/install.sh && source ~/.bashrc

## Read more:

Bash prompt with separator (`.bash_ps1`):

- **[LifeHacker](http://lifehacker.com/):** [Add a Handy Separator Between Commands in Your Terminal on Mac OS X and Linux](http://lifehacker.com/5840450/add-a-handy-separator-between-commands-in-your-terminal-on-mac-os-x-and-linux/)
