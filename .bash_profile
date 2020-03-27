# export PATH="/Users/admin/anaconda3/bin:$PATH"  # commented out by conda initialize

alias onedrive-sync='/Users/dtork/bin/sync-to-onedrive.sh'
alias config='/usr/local/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias rpi='ssh pi@192.168.1.177'
alias python='/usr/local/bin/python3'
alias ll='ls -lhAG'

# PS1 prompt
# https://stackoverflow.com/questions/4133904/ps1-line-with-git-current-branch-and-colors
function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dtork/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dtork/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dtork/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dtork/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

