#!/bin/sh
# Script for launching user interaction script 
WAIT="ping -c 4 127.0.0.1"
SICSTUS_HOME=/usr/local/sicstus4.9.0
PROLOG="$SICSTUS_HOME/bin/sicstus"
DALI_HOME=src
$PROLOG --noinfo -l $DALI_HOME/active_user_wi.pl --goal utente.  
echo Launching agents instances...
$WAIT > /dev/null # %WAIT% > nul
read -p "$*"
