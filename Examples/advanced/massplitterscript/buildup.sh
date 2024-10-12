#!/bin/sh
rm -rf tmp/*
rm -rf build/*
rm -f work/* 
rm -rf conf/mas/*
INSTANCES_HOME=Examples/advanced/mas/instances
TYPES_HOME=Examples/advanced/mas/types
BUILD_HOME=build
CONF_DIR=Examples/advanced/conf
echo "CONFDIR"
ls $CONF_DIR
echo "CONFDIR"
for types_filename in $TYPES_HOME/*.txt
do
	TYPE="${types_filename%.txt}"
    TYPE="${TYPE##*/}"
	COMFILE="$CONF_DIR/communication_${TYPE}_stub.con"
	COMFILEOUT="$CONF_DIR/communication_${TYPE}.con"
	BASEFILE="$CONF_DIR/communication.con"
	if [ ! -e "$COMFILE" ]; then # search for stub file 
		echo $COMFILE
        continue
    fi
	cat $COMFILE $BASEFILE > $COMFILEOUT # creation of the agent communication file out of the stub 
done 
for instance_filename in $INSTANCES_HOME/*.txt
do
	type=$(<$instance_filename) 
	type_filename="$TYPES_HOME/$type.txt"
	instance_base="${instance_filename##*/}"
	echo $type_filename
	cat $type_filename >> "$BUILD_HOME/$instance_base"
done

cp $BUILD_HOME/*.txt Examples/advanced/work