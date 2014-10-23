#!/usr/bin/env bash
#There are numerous MSYS distributions.
#See
#  * http://sourceforge.net/projects/mingwbuilds/files/external-binary-packages/
#    * Note: mingwbuilds msys has lots of extras, but many of its tools need to be rebuilt to work properly
#  * http://sourceforge.net/projects/mingw-w64/files/External%20binary%20packages%20%28Win64%20hosted%29/MSYS%20%2832-bit%29/
#    * Seems to work best
#There are numerous mingw-w64 distributions
# See http://www.drangon.org/mingw/

#Reset HOME to MSYS home. (By default I set %HOME% to cygwin's home)
#Note: Not sharing home folders between msys, cygwin and win32 vim anymore because of challenges
#      with permissions and ln -s for paths like /c/* and /cygdrive/c/*
#export HOME=$(echo /home/`whoami | tr 'A-Z' 'a-z'`)

#MSYS usually includes tools such as perl
#If other installations of these tools are installed and in path, they need to be removed
#Use sed to remove unwanted items from path
#export PATH=$(echo $PATH | sed -e 's;PATHTOSTRIP:\?;;g' )
export PATH=$(echo $PATH | sed -e 's;/c/bin/strawberry/c/bin:\?;;g')
export PATH=$(echo $PATH | sed -e 's;/c/bin/strawberry/perl/site/bin:\?;;g')
export PATH=$(echo $PATH | sed -e 's;/c/bin/strawberry/perl/bin:\?;;g')

#Remove current directory from path (starts with '.:', or contains ':.:' or ends with ':.')
export PATH=$(echo $PATH | sed --e 's;^\.:;;' -e 's;:\.:;:;g' -e 's;:\.$;;' )

#Add mingw-w64 bin dir to path
#Note: /etc/fstab for msys mounts appropriate mingw to /mingw-w64
[ -d /MinGW-w64/bin ] && export PATH=/MinGW-w64/bin:$PATH

#msys inside mintty doesn't work well with xterm-256 (try vim for example)
export TERM=xterm

#Linux/Cygwin/mingw32 Colors for ls
export LS_COLORS="di=1;32;40:ln=36;40:so=34;40:pi=34;40:ex=1;35;40:bd=34;40:cd=34;40:su=1;35;40:sg=1;35;40:tw=32;40:ow=32;40:"

# Aliases specific to mingw32
alias ls="ls --color -F"
#which on mingw32 doesn't support many of the switches normally available
#This which() will not be overwritten by which() in bash_common
which () { (alias; declare -f) | /usr/bin/which $@; }
export -f which

alias desktop="cd ~/Desktop"
alias downloads="cd ~/Downloads"
alias mydocs="cd ~/Documents"
alias dropbox="cd ~/Dropbox"
