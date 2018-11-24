export PS1="\[\033[32;1m\][\u@\h \w]\n$ \[\033[0m\]"

# Aliases to save some typing
alias ll='ls -la'

# A personal bin directory
export PATH=~/bin:$PATH:~/vcs/github.com/csimpkins/course-tools/bin

# Source the .bash_profile in case other apps modify shell variables there
. .bash_profile
