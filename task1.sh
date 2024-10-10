#!/bin/bash


PIDS=$(pgrep -f "bash infinite.sh")


if [ -z "$PIDS" ]; then
  echo "Process infinite.sh not found."
  exit 1
fi


for PID in $PIDS; do
  kill -9 "$PID"
  if [ $? -eq 0 ]; then
    echo "Process infinite.sh with PID $PID has been killed."
  else
    echo "Failed to kill process infinite.sh with PID $PID."
  fi
done