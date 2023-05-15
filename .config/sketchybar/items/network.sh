#!/bin/bash

sketchybar --add item network_up left                                            \
           --set network_up    label.font="$HELVETICA_S"                         \
                               icon.font="$FONT_AWESOME_S"                       \
                               icon=                                            \
                               icon.highlight_color=$RED                         \
                               icon.padding_right=4                              \
                               y_offset=6                                        \
                               update_freq=2                                     \
                               width=0                                           \
                               script="$HOME/.config/sketchybar/plugins/network.sh"  \
           --add item network_down left                                          \
           --set network_down  label.font="$HELVETICA_S"                         \
                               icon.font="$FONT_AWESOME_S"                       \
                               icon=                                            \
                               icon.highlight_color=$BLUE                        \
                               icon.padding_right=4                              \
                               width=65                                          \
                               y_offset=-4
