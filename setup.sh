#! /usr/bin/env sh

INSTALL_DIR=/usr/local/bin/

cd Source
xcodebuild install && mv /tmp/SetLEDs.dst/usr/local/bin/setleds $INSTALL_DIR

echo "Installed in $INSTALL_DIR"

