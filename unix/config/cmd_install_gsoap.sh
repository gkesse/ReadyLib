#!/bin/bash
#================================================
GLIB_NAME=gsoap
#================================================
GLIB_BUILD=/opt/lib
GLIB_DEV=/home/centos/Programs/ReadyLib/dev
GLIB_COMPILER=c
#================================================
GLIB_SCRIPT_ROOT=$PWD
#================================================
GLIB_ARCH=unix
GLONG_BIT=$(getconf LONG_BIT)
if [ "$GLONG_BIT" = "64" ] ; then
    GLIB_ARCH=unix64
fi
#================================================
GLIB_BUILD_NAME=$GLIB_BUILD/$GLIB_NAME
GLIB_BUILD_SRC=$GLIB_BUILD_NAME/source
GLIB_BUILD_DIR=$GLIB_BUILD_NAME/build
GLIB_BUILD_PREFIX=$GLIB_BUILD_NAME/install
GLIB_DEV_NAME=$GLIB_DEV/$GLIB_NAME
GLIB_DEV_DIR=$GLIB_DEV_NAME/$GLIB_COMPILER/$GLIB_ARCH
GLIB_MAKEFILE_PATH=$GLIB_SCRIPT_ROOT/makefile/$GLIB_NAME/Makefile
#================================================
GLIB_LINK=https://sourceforge.net/projects/gsoap2/files/gsoap-2.7/gsoap_2.7.13.zip
GLIB_ARCHIVE_NAME=gsoap_2.7.13.zip
GLIB_ARCHIVE_SRC=gsoap-2.7
GLIB_SOURCE_DIR=$GLIB_BUILD_SRC/$GLIB_ARCHIVE_SRC
#================================================
GLib_Download() {
    echo "[ INFO ] Telechargement de la librairie...[ $GLIB_NAME ]"
    if [ ! -d $GLIB_BUILD_SRC ] ; then mkdir -p $GLIB_BUILD_SRC ; fi
    cd $GLIB_BUILD_SRC
    if [ ! -f $GLIB_ARCHIVE_NAME ] ; then wget $GLIB_LINK ; fi
    if [ ! -d $GLIB_ARCHIVE_SRC ] ; then unzip $GLIB_ARCHIVE_NAME ; fi
    cd $GLIB_SCRIPT_ROOT
}
#================================================
GLib_Build() {
    echo "[ INFO ] Generation de la librairie...[ $GLIB_NAME ]"
    if [ ! -d $GLIB_BUILD_DIR ] ; then mkdir -p $GLIB_BUILD_DIR ; fi
    cd $GLIB_SOURCE_DIR
    ./configure \
    --prefix=$GLIB_BUILD_DIR
    cd $GLIB_SCRIPT_ROOT
}
#================================================
GLib_Make() {
    echo "[ INFO ] Construction de la librairie...[ $GLIB_NAME ]"
    cd $GLIB_SOURCE_DIR
    make
    make install
    cd $GLIB_SCRIPT_ROOT
}
#================================================
GLib_Install() {
    echo "[ INFO ] Installation de la librairie...[ $GLIB_NAME ]"
    if [ ! -d $GLIB_DEV_DIR ] ; then mkdir -p $GLIB_DEV_DIR ; fi
    cd $GLIB_DEV_DIR
    if [ ! -d ../include ] ; then mkdir -p ../include ; fi
    if [ ! -d ./lib ] ; then mkdir -p ./lib ; fi
    if [ ! -d ./bin ] ; then mkdir -p ./bin ; fi
    echo "" > ./README.md
    echo "" >  ../README.md
    echo "" > ../../README.md
    echo "" > ../../../README.md
    if [ -d $GLIB_BUILD_DIR/include ] ; then cp -rf $GLIB_BUILD_DIR/include/* ../include/ ; fi
    if [ -d $GLIB_BUILD_DIR/lib ] ; then cp -rf $GLIB_BUILD_DIR/lib/* ./lib/ ; fi
    if [ -d $GLIB_BUILD_DIR/bin ] ; then cp -rf $GLIB_BUILD_DIR/bin/* ./bin/ ; fi
    cd $GLIB_SCRIPT_ROOT
}
#================================================
GLib_Generate() {
    GLib_Download
    GLib_Build
    GLib_Make
    GLib_Install
}
#================================================
GLib_Generate
#================================================
