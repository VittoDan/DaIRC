#!/bin/sh
WAIT="ping -c 4 127.0.0.1"
SICSTUS_HOME="/usr/local/sicstus4.9.0"
PROLOG="$SICSTUS_HOME/bin/sicstus"
DALI_HOME="./src"
BUILD_HOME="./build"
tmux_session="agents_session"
AGENTPIPE=/tmp/agentpipe
# Create a new tmux session with a single window
tmux new-session -d -s $tmux_session -n "main"

# Launch agents in separate panes within the same tmux window
first_pane=true

mkfifo $AGENTPIPE
for agent_filename in $BUILD_HOME/*
do
    agent_base="${agent_filename##*/}"
    echo "Agente: $agent_base"
    
    if $first_pane; then
        # Use the first pane for the first agent
        tmux send-keys -t $tmux_session "Examples/advanced/conf/makeconf.sh $agent_base $DALI_HOME; $WAIT > /dev/null; Examples/advanced/conf/startagent.sh $agent_base $PROLOG $DALI_HOME" C-m
        first_pane=false
    else
        # Split the window to create a new pane for each subsequent agent
        tmux split-window -t $tmux_session -h
        tmux send-keys -t $tmux_session "Examples/advanced/conf/makeconf.sh $agent_base $DALI_HOME; $WAIT > /dev/null; Examples/advanced/conf/startagent.sh $agent_base $PROLOG $DALI_HOME" C-m
        tmux select-layout -t $tmux_session tiled
    fi
    sleep 2s
done

# Create a new pane for the user instance script
tmux split-window -t $tmux_session -v "/bin/bash -c 'Examples/advanced/massplitterscript/userinstance.sh; echo Press Enter to close; read'"
tmux select-layout -t $tmux_session tiled

# Attach to the tmux session
tmux attach -t $tmux_session

while true; do
    read -r command < $AGENTPIPE
    tmux send-keys -t $tmux_session "$command" C-m
done
