export PATH="/Users/admin/anaconda3/bin:$PATH"

alias onedrive-sync='/Users/admin/bin/sync-to-onedrive.sh'
alias config='/usr/local/bin/git --git-dir=/Users/admin/.cfg/ --work-tree=/Users/admin'

# added by Anaconda3 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/admin/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    \eval "$__conda_setup"
#else
#    if [ -f "/Users/admin/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/admin/anaconda3/etc/profile.d/conda.sh"
#        CONDA_CHANGEPS1=false conda activate base
#    else
#        \export PATH="/Users/admin/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda init <<<

PS1='\[\033]0;$MSYSTEM:\w\007
\033[32m\]\u@\h \[\033[33m\w\033[1;36m\]$(fast_git_ps1)\033[0m\]
$ '

