#! /bin/bash

# Status for dwm

read_temp() {
  read -r temp1 < "/sys/class/hwmon/hwmon0/temp2_input"
  read -r temp2 < "/sys/class/hwmon/hwmon0/temp3_input"

  temp1_calc=$((temp1 / 1000))
  temp2_calc=$((temp2 / 1000))

  echo -e " $temp1_calc $temp2_calc "
}


send_warning() {
  notify-send "BATTERY CRITICAL $bat_perc%"
  sleep 5s
}

read_battery() {
  read -r now < "/sys/class/power_supply/BAT0/energy_now"
  read -r full < "/sys/class/power_supply/BAT0/energy_full"
  read -r status < "/sys/class/power_supply/BAT0/status"

  bat_perc=$(((now * 100) / full))

  bat=""
  if [ "$bat_perc" -le 10 ]; then
    # use warning colors
    bat+="  $bat_perc"
    send_warning
  elif [ "$bat_perc" -le 15 ]; then
    # use urgent colors
    bat+="  $bat_perc"
  elif [ "$bat_perc" -le 25 ]; then
    bat+="  $bat_perc"
  elif [ "$bat_perc" -le 50 ]; then
    bat+="  $bat_perc"
  elif [ "$bat_perc" -le 75 ]; then
    bat+="  $bat_perc"
  else
    bat+="  $bat_perc"
  fi

  case "$status" in
    "Charging") bat+=" ";;
  esac

  echo -e "$bat"
}

read_volume() {
  var=$(amixer get Master)

  vol=""
  case $var in
    *'[on]') var=${var#*[}; var=${var%\%*}; var=${var%\%*}; vol+="$var";;
    *'[off]') vol+="MUTE";;
  esac

  if ([ "$vol" -le 33 ]) 2>/dev/null; then
    vol="  $vol"
  elif ([ "$vol" -le 67 ]) 2>/dev/null; then
    vol="  $vol"
  elif ([ "$vol" -le 100 ]) 2>/dev/null; then
    vol="  $vol"
  elif [ "$vol"=="MUTE" ]; then
    vol="  "
  fi

  echo -e "$vol"
}

echo_date() {
  # istd=$(env TZ=Asia/Kolkata date +'%H:%M')
  var=$(date '+%a %d  %H:%M')
  # echo -e "US $var IN $istd"
  # var=$(date +'%a %d %H:%M')
  echo -e "  ${var}"
}


while true; do
  dstatus="$(read_temp)|$(read_volume) |$(read_battery) |$(echo_date) "
	xsetroot -name "${dstatus^^}"
	sleep 1s
done &
