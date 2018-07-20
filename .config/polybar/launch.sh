#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar depend on host
if [[ $(hostname) == 'trustno1' ]]; then
  polybar trustno1 &
elif [[ $(hostname) == 'thinkpad' ]]; then
  if  ~/.local/bin/hdpi; then
    polybar thinkpad-hdpi &
  else
    polybar thinkpad &
  fi
fi

echo "Bars launched..."
