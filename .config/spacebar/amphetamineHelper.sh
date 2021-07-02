#!/bin/bash

if [[ $(pmset -g assertions | grep "Amphetamine") ]]; then
   echo "Hot"
else
   echo "Cold"
fi
