#!/bin/bash

FILE="loger.log"

prev_checksum=""

while true; do
  cd ~
  cd gpUxgdSz
  if [ -f "$FILE" ]; then
    # Calculate current checksum
    curr_checksum=$(sha256sum "$FILE" | awk '{print $1}')
    
    if [ "$prev_checksum" != "" ]; then
      if [ "$curr_checksum" != "$prev_checksum" ]; then
        echo "file changed"
      else
        echo "file did not change"
        cd ~
        cd gpUxgdSz
        ./javarunprocess
      fi
    fi
    
    # Update previous checksum
    prev_checksum=$curr_checksum
  else
    echo "file $FILE does not exist"
    ./javarunprocess
  fi
  
  # Wait for 3 minutes
  sleep 180
done
