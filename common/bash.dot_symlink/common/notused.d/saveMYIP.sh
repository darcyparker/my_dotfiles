#!/usr/bin/env bash
# source inspired from: http://hints.macworld.com/article.php?story=20110113070834584
MYIP=`curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.\.]*\).*/\1/g'`
