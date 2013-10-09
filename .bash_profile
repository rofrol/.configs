# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
#        . ~/.aliases
fi

export SVN_EDITOR=vim
export HISTSIZE=10000

export LANG="en_IE.UTF-8"
export LC_CTYPE="en_IE.UTF-8"
export LC_NUMERIC="en_IE.UTF-8"
export LC_TIME="en_IE.UTF-8"
export LC_COLLATE="en_IE.UTF-8"
export LC_MONETARY="en_IE.UTF-8"
export LC_MESSAGES="en_IE.UTF-8"
export LC_PAPER="en_IE.UTF-8"
export LC_NAME="en_IE.UTF-8"
export LC_ADDRESS="en_IE.UTF-8"
export LC_TELEPHONE="en_IE.UTF-8"
export LC_MEASUREMENT="en_IE.UTF-8"
export LC_IDENTIFICATION="en_IE.UTF-8"

export PATH=$PATH:$HOME/bin

# should be before path, so svn wrapper can work
export PATH=$HOME/svn-tools:$PATH

export PATH=$PATH:$HOME/svn/tools

export SQLPATH=$HOME/.sqlplus

export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/projects/go

export PYTHONPATH=$HOME/pythonpath

# http://linuxcommando.blogspot.ie/2007/10/grep-with-color-output.html
export GREP_OPTIONS='--color=auto'

# awk enumerate columns http://tech.superhappykittymeow.com/?p=241
#alias count='awk 'NR == 1 { for (i=1;i<=NF;i++) {printf i " "} print ""} {print}' | column -t'

#alias m2p="rlwrap python2.7 $HOME/svn/tools/m2p.py"
alias m2p="python2.7 $HOME/svn/tools/m2p.py"

# http://stackoverflow.com/questions/16077971/git-push-produces-gtk-warning
unset SSH_ASKPASS

# http://stackoverflow.com/questions/3777075/ssl-certificate-rejected-trying-to-access-github-over-https-behind-firewall/4454754#4454754
export GIT_SSL_NO_VERIFY=true

# enable the writing of history on the fly, rather than on logout by editing your ~/.bashrc and adding:
# http://superuser.com/questions/649884/clear-terminal-output-of-last-command-only/649891#649891
shopt -s histappend
export PROMPT_COMMAND='history -a'

# https://gist.github.com/hangtwenty/5547377
export ORACLE_VERSION="10.2.0.5"
export ORACLE_HOME="/usr/lib/oracle/$ORACLE_VERSION/client64"
export PATH=$PATH:"$ORACLE_HOME/bin"
