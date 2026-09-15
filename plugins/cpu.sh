#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

TOP_PROCESSES=5
CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)
CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")

TOPPROC=$(ps axo "%cpu,ucomm" | sort -nr | tail +$TOP_PROCESSES | head -n$TOP_PROCESSES | awk '{printf "%.0f%% %s\n", $1, $2}' | sed -e 's/com.apple.//g')

CPU_PERCENT="$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')"

CPU_TEMP=$(smctemp -cf | awk '{printf "%.0f\n", $1}')

COLOR=$WHITE
case "$CPU_PERCENT" in
  [1-5][0-9]) COLOR=$WHITE
  ;;
  [6-7][0-9]) COLOR=$YELLOW
  ;;
  [8][0-9]) COLOR=$ORANGE
  ;;
  [9][0-9]|100) COLOR=$RED
  ;;
esac

TEMP_COLOR=$WHITE
case "$CPU_TEMP" in
  [1-5][0-9]) TEMP_COLOR=$WHITE
  ;;
  [6-7][0-9]) TEMP_COLOR=$YELLOW
  ;;
  [8][0-9]) TEMP_COLOR=$ORANGE
  ;;
  [9][0-9]|100) TEMP_COLOR=$RED
  ;;
esac

sketchybar --set  cpu.percent label="$CPU_PERCENT%" \
                              label.color=$COLOR  \
           --set  cpu.temp    label="${CPU_TEMP}°C" \
                              label.color=$TEMP_COLOR


idx=1
while IFS= read -r line; do
  sketchybar --set cpu.top_process_$idx label="$line"
  idx=$(($idx+1))
done <<< "$TOPPROC"
