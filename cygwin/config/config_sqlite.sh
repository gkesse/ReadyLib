#================================================
GLIB_VERSION="3.29.0"
GLIB_LINK=https://www.sqlite.org/2019/sqlite-amalgamation-3290000.zip
GLIB_ARCHIVE_NAME=sqlite-amalgamation-3290000
#================================================
GLIB_VERSION_NAME=$GLIB_NAME-$GLIB_VERSION
GLIB_VERSION_ARCHIVE=$GLIB_NAME-$GLIB_VERSION.zip
export "GLIB_VERSION_SRC=$GLIB_BUILD_SRC/$GLIB_VERSION_NAME"
#================================================
GLIB_LINK_DOWNLOAD="
wget $GLIB_LINK -O $GLIB_VERSION_ARCHIVE ;
unzip $GLIB_VERSION_ARCHIVE ;
mv $GLIB_ARCHIVE_NAME $GLIB_VERSION_NAME ;
"
#================================================
GLIB_BUILD_RUN="
cp -f $GLIB_MAKEFILE_PATH Makefile ;
make
"
#================================================
GLIB_BUILD_MAKE="
make
"
#================================================
GLIB_DEV_INSTALL="
mkdir -p ../include ;
mkdir -p ./bin ;
mkdir -p ./lib ;
cp -f $GLIB_VERSION_SRC/*.h ../include/ ;
cp -f $GLIB_BUILD_DIR/bin/*.exe ./bin/ ;
cp -f $GLIB_BUILD_DIR/bin/*.a ./lib/
"
#================================================
