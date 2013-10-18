# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
#        . ~/.aliases
fi

export SVN_EDITOR=vim
export HISTSIZE=10000
export HISTFILESIZE=2000
# enable the writing of history on the fly, rather than on logout by editing your ~/.bashrc and adding:
# http://superuser.com/questions/649884/clear-terminal-output-of-last-command-only/649891#649891
shopt -s histappend
export PROMPT_COMMAND='history -a'
HISTCONTROL=ignoredups:ingorespace

# to make sure terminals wrap lines correctly after resizing them.
# https://twitter.com/bashtips/status/3779483133
shopt -s checkwinsize

export PATH=$PATH:$HOME/bin

# should be before path, so svn wrapper can work
export PATH=$HOME/bin/svn-tools:$PATH

export PATH=$PATH:$HOME/svn/iotools

export SQLPATH=$HOME/.sqlplus

export GOROOT=/usr/lib64/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/projects/go

export PYTHONPATH=$HOME/pythonpath
# http://stackoverflow.com/questions/10624511/upgrade-python-without-breaking-yum/10624568#10624568
# cd /usr/local/bin && ln -s python2.7 python
export PATH=/usr/local/bin:$PATH

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

# https://gist.github.com/hangtwenty/5547377
export ORACLE_VERSION="10.2.0.5"
export ORACLE_HOME="/usr/lib/oracle/$ORACLE_VERSION/client64"
export PATH=$PATH:"$ORACLE_HOME/bin"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"$ORACLE_HOME/lib"

# http://superuser.com/questions/310914/permanently-change-date-time-format-for-ls
export TIME_STYLE=long-iso

export EDITOR=vim

[ -f ~/.bash_profile_custom ] && . ~/.bash_profile_custom

# get solarized colors for bash
[ -f ~/.configs/dircolors.256dark ] || wget https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark -O ~/.configs/dircolors.256dark
eval `dircolors ~/.configs/dircolors.256dark`

# based on https://raw.github.com/nkulikov/mc-solarized-skin/master/solarized.ini
# improved lines and marked bg to gray
if [ -d $HOME/mc-solarized-skin ]; then
	cd $HOME/mc-solarized-skin && git pull && cd -
else
	git clone https://github.com/rofrol/mc-solarized-skin $HOME/mc-solarized-skin
fi
export MC_SKIN=$HOME/mc-solarized-skin/solarized.ini
