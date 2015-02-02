#!/bin/bash

export PS1='\n\[\e[32m\]\u@\h\[\e[0m\]:\[\e[36m\]\w $(c=$?;e="\[\e[34m\]";if [ $c != 0 ];then e="\[\e[31m\]";fi;echo $e[$c])\[\e[33m\]$(__git_ps1 2>/dev/null)\[\e[0m\]\n\$ '
