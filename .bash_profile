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

# Put homebrew packages in front of out-of-date anaconda packages.
export PATH="/usr/local/bin:$PATH"
