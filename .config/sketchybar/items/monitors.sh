#!/bin/bash

# Monitor - disk
sketchybar --add item disk_label right                               \
           --set disk_label    label.font="$HELVETICA_S"             \
                               label=DSK                             \
                               y_offset=6                            \
                               width=0                               \
           --add item disk_percent right                             \
           --set disk_percent  label.font="$HELVETICA_S"             \
                               y_offset=-4                           \
                               update_freq=1                         \
                               script="$HOME/.config/sketchybar/plugins/disk.sh"
                                  
# Monitor - RAM
sketchybar --add item ram_label right                                \
           --set ram_label     label.font="$HELVETICA_S"             \
                               label=RAM                             \
                               y_offset=6                            \
                               width=0                               \
           --add item ram_percent right                              \
           --set ram_percent   label.font="$HELVETICA_S"             \
                               y_offset=-4                           \
                               update_freq=1                         \
                               script="$HOME/.config/sketchybar/plugins/ram.sh"

# Monitor - CPU
sketchybar --add item cpu_label right                                \
           --set cpu_label     label.font="$HELVETICA_S"             \
                               label=CPU                             \
                               y_offset=6                            \
                               width=0                               \
           --add item cpu_percent right                              \
           --set cpu_percent   label.font="$HELVETICA_S"             \
                               y_offset=-4                           \
                               update_freq=1                         \
                               script="$HOME/.config/sketchybar/plugins/cpu.sh"
