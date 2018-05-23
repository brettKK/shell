#!/bin/sh

echo '$#:'$#
echo '$0:'$0
echo '$1:'$1
echo '$2:'$2
echo '$*:'$*
echo '$@:'$@

echo '----$* start----'
for i in "$*"
do
	echo $i
done
echo '----$* end----'

echo '----$@ start----'
for i in "$@"
do
	echo $i
done
echo '----$@ end----'
