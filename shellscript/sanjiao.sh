#!/bin/bash
# 打印正三角
read -p "read line nums:" Line
for ((i=1; i<=Line; i++))
do
  for ((j=$Line-$i; j>0; j--))
  do
    echo -n " "
  done
  for ((h=1; h<=$((i*2-1)); h++))
  do
    echo -n "*"
  done
  echo
done
