################################################################################
# Login shell setup
################################################################################

# from unix.stackexchange 320465, so that tmux panes load both .bashrc and this file
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

#########################
# Ubuntu edits
#########################
