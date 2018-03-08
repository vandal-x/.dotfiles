#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar depend on host
if [[ $(hostname) == 'trustno1' ]]; then
  polybar trustno1 &
elif [[ $(hostname) == 'phphater' ]]; then
  # working setup
  polybar phphater &
  polybar phphater2 &
fi

echo "Bars launched..."
