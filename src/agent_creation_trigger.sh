#!/bin/sh
RELATIVEHOME="/home/ubuntu"
RELATIVE_PATH_INSTANCES="$RELATIVEHOME/DALI/Examples/advanced/mas/instances"
DALI_HOME=$RELATIVEHOME/DALI/src

XTERM=xterm
tmux_session="agents_session"
EXROOT="$RELATIVEHOME/DALI/Examples/advanced"
SICSTUS_HOME=/usr/local/sicstus4.9.0
PROLOG="$SICSTUS_HOME/bin/sicstus"
CONF_DIR=$EXROOT/conf
INSTANCES_HOME=$EXROOT/mas/instances
TYPES_HOME=$EXROOT/mas/types
BUILD_HOME=build
agent_name=$2

DIR="$EXROOT/conf/mas/$1/"
DIRW="$EXROOT/work/$1/"
if [ ! -d "$DIR" ]; then
  mkdir "$EXROOT/conf/mas/$1"
fi
if [ ! -d "$DIRW" ]; then
  mkdir "$EXROOT/work/$1"
fi



COMFILEOUT="$CONF_DIR/communication_$1.con"

if [ ! -e "$COMFILEOUT" ]; then
    echo "agent('$EXROOT/work/$1/$1_$agent_name','$1_$agent_name','no',italian,['$EXROOT/conf/communication'],['$DALI_HOME/communication_fipa','$DALI_HOME/learning','$DALI_HOME/planasp'],'no','$DALI_HOME/onto/dali_onto.txt',[],'$1')." > "$EXROOT/conf/mas/$1/$1_$2.txt"    
else 
    echo "agent('$EXROOT/work/$1/$1_$agent_name','$1_$agent_name','no',italian,['$EXROOT/conf/communication_$1'],['$DALI_HOME/communication_fipa','$DALI_HOME/learning','$DALI_HOME/planasp'],'no','$DALI_HOME/onto/dali_onto.txt',[],'$1')." > "$EXROOT/conf/mas/$1/$1_$2.txt"
fi

cp $EXROOT/mas/types/$1.txt $DIRW/$1_$agent_name.txt
cd $EXROOT
tmux new-window -t agents_session  -n "$1_$agent_name"  "/bin/bash -c '$RELATIVEHOME/DALI/Examples/advanced/conf/startagentdyn.sh $1_$2.txt $PROLOG $DALI_HOME $1; echo Press Enter to close; read'"




