#!/bin/sh

RELATIVE_PATH_INSTANCES="../Examples/advanced/mas/instances"
DALI_HOME=../../src

XTERM=xterm

touch "$RELATIVE_PATH_INSTANCES/test.txt"
echo $1 > "$RELATIVE_PATH_INSTANCES/test.txt"
EXROOT="../Examples/advanced"
SICSTUS_HOME=/usr/local/sicstus4.9.0
PROLOG="$SICSTUS_HOME/bin/sicstus"

#makeconfig
agent_name="test"
DIR="$EXROOT/conf/mas/$1/"
if [ ! -d "$DIR" ]; then
  mkdir "$EXROOT/conf/mas/$1"
fi
echo "agent('work/$agent_name','$agent_name','no',italian,['conf/communication'],['../../src/communication_fipa','../../src/learning','../../src/planasp'],'no','../../src/onto/dali_onto.txt',[])." > "$EXROOT/conf/mas/$1/$2.txt"
cd ../Examples/advanced
#$XTERM -T "testoh" -hold -e "./conf/startagentdyn.sh test.txt $PROLOG $DALI_HOME $1" &
echo "./conf/startagentdyn.sh test.txt $PROLOG $DALI_HOME $1"  > /tmp/my_named_pipe
