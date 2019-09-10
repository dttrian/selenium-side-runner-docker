#!/bin/sh

if [ -z "$DELAY_BEFORE_START" ] ; then
    sleep 5
else
    sleep $DELAY_BEFORE_START
fi

if [ -n "$OUTPUT_FORMAT" ] ; then
    OUTPUT_FORMAT="--output-format $OUTPUT_FORMAT"
fi
selenium-side-runner $OUTPUT_FORMAT --config-file /sides/.side.yml -s http://chromedriver:4444 --output-directory /root/out /sides/*.side
EXIT_STATUS=$?
if [ -z "$ALWAYS_EXIT_WITH_ZERO" ] ; then
  exit $EXIT_STATUS
fi
exit 0

