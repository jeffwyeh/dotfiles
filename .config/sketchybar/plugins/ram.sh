# Show the RAM usage as a stacked item

sketchybar -m --set ram_percent label=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%02.0f%%\n", 100-$5"%") }')
