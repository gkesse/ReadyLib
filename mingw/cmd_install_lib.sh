GLONG_BIT=$(getconf LONG_BIT)
GLIB_ARCH=cygwin
if [ "$GLONG_BIT" = "64" ] ; then
    GLIB_ARCH=cygwin64
fi
#================================================
GLIB_ROOT_WIN="C:\lib"
GREADYLIB_ROOT_WIN="C:\Users\Admin\Downloads\Programs\ReadyLib"
GCMAKE_ROOT_WIN="C:\Program Files\CMake\bin"
GMINGW_ROOT_WIN="C:\MinGW\bin"
#================================================
GLIB_ROOT=$(cygpath -u $GLIB_ROOT_WIN)
GREADYLIB_ROOT=$(cygpath -u $GREADYLIB_ROOT_WIN)
GCMAKE_ROOT=$(cygpath -u $GCMAKE_ROOT_WIN)
GMINGW_ROOT=$(cygpath -u $GMINGW_ROOT_WIN)
#================================================
GLIB_BUILD=$GLIB_ROOT/build
GLIB_DEV=$GREADYLIB_ROOT/dev
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
    GLIB_DEV_NAME=$GLIB_DEV/$GLIB_NAME
    GLIB_DEV_DIR=$GLIB_DEV_NAME/$GLIB_ARCH
    GLIB_BUILD_SRC=$GLIB_BUILD_NAME/source
    GLIB_BUILD_DIR=$GLIB_BUILD_NAME/build
    GLIB_BUILD_PREFIX=$GLIB_BUILD_NAME/install
    GLIB_CONFIG_NAME=config_$GLIB_NAME.sh
    GLIB_CONFIG_PATH=$GLIB_CONFIG_ROOT/$GLIB_CONFIG_NAME
    GLIB_MAKEFILE_NAME=makefile_$GLIB_NAME.txt
    GLIB_MAKEFILE_PATH=$GLIB_MAKEFILE_ROOT/$GLIB_MAKEFILE_NAME
    source $GLIB_CONFIG_PATH
}
#================================================
function GLib_Download() {
    echo "[ INFO ] telechargement de la librairie...[ $GLIB_NAME ]"
    if [ ! -d "$GLIB_VERSION_SRC" ] ; then
        mkdir -p $GLIB_BUILD_SRC
        cd $GLIB_BUILD_SRC
        eval $GLIB_LINK_DOWNLOAD
    fi
}
#================================================
function GLib_Build() {
    echo "[ INFO ] generation de la librairie...[ $GLIB_NAME ]"
    mkdir -p $GLIB_BUILD_DIR
    cd $GLIB_BUILD_DIR
    eval $GLIB_BUILD_RUN
}
#================================================
function GLib_Make() {
    echo "[ INFO ] construction de la librairie...[ $GLIB_NAME ]"
    cd $GLIB_BUILD_DIR
    eval $GLIB_BUILD_MAKE
}
#================================================
function GLib_Install() {
    echo "[ INFO ] installation de la librairie...[ $GLIB_NAME ]"
    mkdir -p $GLIB_DEV_DIR
    cd $GLIB_DEV_DIR
    eval $GLIB_DEV_INSTALL
}
#================================================
function GLib_Clean() {
    echo "[ INFO ] suppression du repertoire build de la librairie...[ $GLIB_NAME ]"
    #rm -rf $GLIB_BUILD_SRC
    #rm -rf $GLIB_BUILD_DIR
    #rm -rf $GLIB_BUILD
}
#================================================
function GLib_Generate() {
    GLIB_NAME=$1
    GLib_Config
    GLib_Clean
    GLib_Download
    GLib_Build
    GLib_Make
    GLib_Install
}
#================================================
GLib_Create
#GLib_Generate "sdl"
$(cygpath -u "\"C:\Program Files\CMake\bin\cmake.exe\"") -G
#================================================
