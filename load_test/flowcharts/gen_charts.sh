#!/bin/zsh

python3 gen_flow.py

for ((i=1;i<=5;i++));
do 
   echo $i
   diagrams flowchart session$i.flowchart session$i.svg
done
