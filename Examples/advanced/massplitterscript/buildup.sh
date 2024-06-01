#!/bin/sh
rm -rf tmp/*
rm -rf build/*
rm -f work/* # remove everything if you want to clear agent history
rm -rf conf/mas/*
INSTANCES_HOME=Examples/advanced/mas/instances
TYPES_HOME=Examples/advanced/mas/types
BUILD_HOME=build
# Build agents by creating a file with the instance name containing the type content for each instance.
for instance_filename in $INSTANCES_HOME/*.txt
do
	type=$(<$instance_filename) # agent type name is the content of the instance file
	type_filename="$TYPES_HOME/$type.txt"
	instance_base="${instance_filename##*/}" # e.g. 'mas/instances/agent1.txt' -> 'agent1.txt'
	echo $type_filename
	cat $type_filename >> "$BUILD_HOME/$instance_base"
done

cp $BUILD_HOME/*.txt Examples/advanced/work