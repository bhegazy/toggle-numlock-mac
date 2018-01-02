#!/usr/bin/env sh

KEYBOARD_NAME_WILDCARD="MasterKeys*"

if setleds -name "$KEYBOARD_NAME_WILDCARD" -v | grep -q "+num"; then
    echo "Turning off numlock"
    setleds -name "$KEYBOARD_NAME_WILDCARD" -num > /dev/null
else
    echo "Turning on numlock"
    setleds -name "$KEYBOARD_NAME_WILDCARD" +num > /dev/null
fi

if [ $? -ne 0 ]; then
    echo "FAILED"
else
    echo "SUCCESS"
fi
