#!/bin/bash

read op
case $op in
  C)
  echo "copy"
  ;;
  D)
  echo "delete"
  ;;
  *)
  echo "unknow"
esac

var=1
while ((var<100))
do
  echo $var
  ((var=var*2))
done
