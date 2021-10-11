#!/bin/bash

# cerner_2tothe5th_2021
#
# Script to manage the task list

task=~/.task

if [ ! -s $task ]; then
    if [[ $# == 0 ]]; then
        echo "No task letf!!"
        touch $task
        exit 1
    fi
else
    if [[ "$1" == "completed" ]] ; then
        sed -i -e "$2d" $task
    fi
fi

if [[ "$1" == "add" ]] ; then
    echo "$2" >> $task
fi

if [ -s $task ]; then
    echo "Task(s):"
    nl $task
else
    echo "No task letf!!"
fi
