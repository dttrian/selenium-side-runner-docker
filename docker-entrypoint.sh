#!/bin/sh

if [ -z "$DELAY_BEFORE_START" ] ; then
    sleep 5
else
    sleep $DELAY_BEFORE_START
fi

if [ -n "$OUTPUT_FORMAT" ] ; then
    OUTPUT_FORMAT="--output-format $OUTPUT_FORMAT"
fi
if [ -z "$SERVER" ] ; then
    SERVER=http://chromedriver:4444
fi
if [ -n "$WORKERS" ] ; then
    WORKERS="-w $WORKERS"
fi
selenium-side-runner $OUTPUT_FORMAT $WORKERS --config-file /sides/.side.yml -s $SERVER --output-directory /root/out /sides/*.side
EXIT_STATUS=$?

if [ -n "$DELAY_BEFORE_STOP" ] ; then
    sleep $DELAY_BEFORE_STOP
fi

if [ -z "$ALWAYS_EXIT_WITH_ZERO" ] ; then
  exit $EXIT_STATUS
fi
exit 0
