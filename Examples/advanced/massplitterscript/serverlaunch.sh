#!/bin/sh
WAIT="ping -c 4 127.0.0.1"
SICSTUS_HOME=/usr/local/sicstus4.9.0
PROLOG="$SICSTUS_HOME/bin/sicstus"
DALI_HOME=src
$PROLOG --noinfo -l $DALI_HOME/active_server_wi.pl --goal "go(3010,'server.txt')." &  #launch of the catalina server instance



echo Server ready. Starting the MAS....
$WAIT > /dev/null # %WAIT% >nul
read -p "$*"
