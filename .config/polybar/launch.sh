#!/usr/bin/env sh

INTERNAL=eDP1

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar depend on host
if [[ $(hostname) == 'trustno1' ]]; then
  polybar trustno1 &
elif [[ $(hostname) == 'thinkpad' ]]; then
  monitors=($(xrandr | grep " connected "| awk '{ print$1 }'))

  if  [[ ${#monitors[@]} -eq 1 && ${monitors[0]} -eq INTERNAL ]]; then
    polybar thinkpad-hdpi &
  elif [ ${#monitors[@]} -eq 3 ]; then
    polybar left &
    polybar right &
  else
    polybar thinkpad &
  fi
fi

echo "Bars launched..."
