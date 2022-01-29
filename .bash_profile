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

_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true

# Inline dictionary
define () { curl -s "dict://dict.org/d:$1" |& less -F }
