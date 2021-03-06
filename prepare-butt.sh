#!/usr/bin/env bash

# Script to replace some settings in the butt-settings before launching butt

envsubst < /home/butt/butt-settings.ini > /home/butt/.buttrc

recordings=/data/recordings
[ -d "$recordings" ] || mkdir "$recordings"

# set timezone
if [ ! -z "$BUTT_TIMEZONE" ]; then
  ln -sf /usr/share/zoneinfo/$BUTT_TIMEZONE /etc/localtime
fi

exec "$@"
