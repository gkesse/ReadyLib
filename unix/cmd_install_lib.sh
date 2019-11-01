#!/bin/bash
#================================================
GLib_Generate() {
    cd config
    GLIB_INSTALL_LIB=cmd_install_$GLIB_NAME.sh
    . $GLIB_INSTALL_LIB
    cd ..
}
#================================================
GLIB_NAME=$1
#================================================
if [ "$GLIB_NAME" = "" ] ; then GLIB_NAME=all ; fi
#================================================
GLib_Generate
#================================================
