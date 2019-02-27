export PS1="\[\033[32;1m\][\u@\h \w]\n$ \[\033[0m\]"

# Aliases to save some typing
alias ll='ls -la'

# Personal bin directories
export PATH=~/bin:$PATH:~/vcs/gitlab.com/drcs/course-tools/bin

# Java and JavaFX
export JAVA_HOME=`/usr/libexec/java_home`
export PATH_TO_FX=~/java/javafx-sdk-11.0.1/lib

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home

# Scala
export SCALA_HOME=/usr/local/opt/scala
export PATH=$PATH:$SCALA_HOME/bin

# Hadoop
export PATH=$PATH:~/opt/hadoop/current/bin

# Spark
export SPARK_HOME=~/opt/spark/current
export PATH=$PATH:$SPARK_HOME/bin

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/chris/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/chris/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/chris/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/chris/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# Put homebrew packages in front of out-of-date anaconda packages.
export PATH="/usr/local/bin:$PATH"
