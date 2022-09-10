################################################################################
# Baseline shell setup
################################################################################

# Version control dotfiles with `config` instead of `git`
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Prettify the list command
alias ll='ls -lhAG'

source $HOME/.bashrc
