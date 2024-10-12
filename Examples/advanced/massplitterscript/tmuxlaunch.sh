#!/bin/sh
WAIT="ping -c 4 127.0.0.1"
SICSTUS_HOME="/usr/local/sicstus4.9.0"
PROLOG="$SICSTUS_HOME/bin/sicstus"
DALI_HOME="./src"
BUILD_HOME="./build"
tmux_session="agents_session"
AGENTPIPE=/tmp/agentpipe # Probably useless thus far, attempt of a previous communication idea between processes IPC might be a good idea for DALI
# Create a new tmux session with a single window
tmux new-session -d -s $tmux_session -n "main"
tmux split-window -t $tmux_session -v "/bin/bash -c 'Examples/advanced/massplitterscript/socketlaunch.sh; echo Press Enter to close; read'"
tmux split-window -t $tmux_session -v "/bin/bash -c 'Examples/advanced/massplitterscript/nodeserver.sh ; echo Press Enter to close; read'"
# Launch agents in separate panes within the same tmux window
first_pane=true

mkfifo $AGENTPIPE # Probably useless thus far, attempt of a previous communication idea between processes IPC might be a good idea for DALI
for agent_filename in $BUILD_HOME/* # Creation of static agents 
do
    agent_base="${agent_filename##*/}"
    echo "Agente: $agent_base"
    tmux split-window -t $tmux_session -h        
    tmux send-keys -t $tmux_session "Examples/advanced/conf/makeconf.sh $agent_base $DALI_HOME; $WAIT > /dev/null; Examples/advanced/conf/startagent.sh $agent_base $PROLOG $DALI_HOME" C-m
    tmux select-layout -t $tmux_session tiled

    sleep 2s
done

# Create a new pane for the user instance script
tmux split-window -t $tmux_session -h "/bin/bash -c 'Examples/advanced/massplitterscript/userinstance.sh; echo Press Enter to close; read'"
tmux select-layout -t $tmux_session tiled

# Attach to the tmux session
tmux attach -t $tmux_session
sleep 2s
$WAIT > /dev/null
for agent_filename in $BUILD_HOME/*
do
	agent_base="${agent_filename##*/}"
    echo "Agente: $agent_base"
    tmux new-window -t $tmux_session  -n "$agent_base"  "/bin/bash -c 'Examples/advanced/conf/startagentdyn.sh $agent_base $PROLOG $DALI_HOME $1; echo Press Enter to close; read'"
    sleep 2s
    $WAIT > /dev/null # %WAIT% >nul
done




# Part below probably useless thus far, attempt of a previous communication idea between processes IPC might be a good idea for DALI
# while true; do
#     read -r command < $AGENTPIPE
#     tmux send-keys -t $tmux_session "$command" C-m
# done

