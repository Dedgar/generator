#!/bin/bash -e

# This is useful so we can debug containers running inside of OpenShift that are
# failing to start properly.

if [ "$OO_PAUSE_ON_START" = "true" ] ; then
  echo
  echo "This container's startup has been paused indefinitely because OO_PAUSE_ON_START has been set."
  echo
  while true; do
    sleep 10
  done
fi

echo traffic gen v0.0.1
echo This container hosts the following applications:
echo
echo '/bin/traffic-gen'
echo
echo 'Start the traffic generating process.'
echo '----------------'
/bin/traffic-gen --config=/secrets/config.json

echo The process has ended unexpectedly. Pausing indefinitely for troubleshooting.
while true; do
  sleep 10
done
