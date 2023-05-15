#!/bin/bash

# Show the disk usage as a stacked item

sketchybar --set disk_percent label=$(df -lh | grep /dev/disk1s2 | awk '{ printf("%02.0f%%\n", $5) }')
