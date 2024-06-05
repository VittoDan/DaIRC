#!/bin/sh

RELATIVE_PATH_INSTANCES="../Examples/advanced/mas/instances"
DALI_HOME=../../src

XTERM=xterm
tmux_session="agents_session"
EXROOT="../Examples/advanced"
SICSTUS_HOME=/usr/local/sicstus4.9.0
PROLOG="$SICSTUS_HOME/bin/sicstus"
#makeconfig
agent_name=$2
DIR="$EXROOT/conf/mas/$1/"
DIRW="$EXROOT/work/$1/"
if [ ! -d "$DIR" ]; then
  mkdir "$EXROOT/conf/mas/$1"
fi
if [ ! -d "$DIRW" ]; then
  mkdir "$EXROOT/work/$1"
fi
echo "agent('work/$1/$agent_name','$agent_name','no',italian,['conf/communication'],['../../src/communication_fipa','../../src/learning','../../src/planasp'],'no','../../src/onto/dali_onto.txt',[])." > "$EXROOT/conf/mas/$1/$2.txt"
cp $EXROOT/mas/types/$1.txt $DIRW/$agent_name.txt
cd ../Examples/advanced

tmux new-window -t agents_session  -n "$1_$agent_name"  "/bin/bash -c './conf/startagentdyn.sh $2.txt $PROLOG $DALI_HOME $1; echo Press Enter to close; read'"




