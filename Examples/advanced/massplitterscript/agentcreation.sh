#!/bin/sh
WAIT="ping -c 4 127.0.0.1"
PROLOG="$SICSTUS_HOME/bin/sicstus"
DALI_HOME=../../../src
BUILD_HOME=build
# Launch agents
for agent_filename in $BUILD_HOME/*
do
	agent_base="${agent_filename##*/}"
    echo "Agente: $agent_base"
    $XTERM -e "./conf/makeconf.sh $agent_base $DALI_HOME" &
    $XTERM -T "$agent_base" -hold -e "./conf/startagent.sh $agent_base $PROLOG $DALI_HOME" &
    sleep 2s
    $WAIT > /dev/null # %WAIT% >nul
done

