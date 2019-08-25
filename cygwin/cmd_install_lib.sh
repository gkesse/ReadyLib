#================================================
GLIB_ROOT=/cygdrive/c/lib
GLIB_BUILD=$GLIB_ROOT/build
GLIB_DEV=$GLIB_ROOT/dev
#================================================
GLIB_SCRIPT_ROOT=$PWD
GLIB_CONFIG_ROOT=$GLIB_SCRIPT_ROOT/config
GLIB_MAKEFILE_ROOT=$GLIB_SCRIPT_ROOT/makefile
#================================================
function GLib_Create() {
    echo "[ INFO ] creation des repertoires lib...[ lib + build + dev ]"
    mkdir -p $GLIB_BUILD
    mkdir -p $GLIB_DEV
}
#================================================
function GLib_Config() {
    echo "[ INFO ] configuration de la librairie...[ $GLIB_NAME ]"
    GLIB_BUILD_NAME=$GLIB_BUILD/$GLIB_NAME
    GLIB_BUILD_SRC=$GLIB_BUILD_NAME/source
    GLIB_BUILD_DIR=$GLIB_BUILD_NAME/build
    GLIB_CONFIG_NAME=config_$GLIB_NAME.sh
    GLIB_CONFIG_PATH=$GLIB_CONFIG_ROOT/$GLIB_CONFIG_NAME
    GLIB_MAKEFILE_NAME=makefile_$GLIB_NAME.txt
    GLIB_MAKEFILE_PATH=$GLIB_MAKEFILE_ROOT/$GLIB_MAKEFILE_NAME
    source $GLIB_CONFIG_PATH
}
#================================================
function GLib_Download() {
    echo "[ INFO ] telechargement de la librairie...[ $GLIB_NAME ]"
    mkdir -p $GLIB_BUILD_SRC
    cd $GLIB_BUILD_SRC
    pwd
    eval $GLIB_LINK_DOWNLOAD
}
#================================================
function GLib_Build() {
    echo "[ INFO ] generation de la librairie...[ $GLIB_NAME ]"
    mkdir -p $GLIB_BUILD_DIR
    cd $GLIB_BUILD_DIR
    pwd
    eval $GLIB_BUILD_RUN
}
#================================================
function GLib_Clean() {
    echo "[ INFO ] suppression du repertoire build de la librairie...[ $GLIB_NAME ]"
    #rm -rf $GLIB_BUILD_SRC
    rm -rf $GLIB_BUILD_DIR
}
#================================================
function GLib_Generate() {
    GLIB_NAME=$1
    GLib_Config
    GLib_Clean
    #GLib_Download
    GLib_Build
}
#================================================
GLib_Create
GLib_Generate "sqlite"
#================================================
