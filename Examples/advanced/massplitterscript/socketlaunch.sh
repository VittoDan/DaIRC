#!/bin/sh
WAIT="ping -c 4 127.0.0.1"
SICSTUS_HOME=/usr/local/sicstus4.9.0
PROLOG="$SICSTUS_HOME/bin/sicstus"
DALI_HOME=src

$PROLOG --noinfo -l $DALI_HOME/active_socket_handler.pl &

$WAIT > /dev/null # %WAIT% >nul
read -p "$*"
