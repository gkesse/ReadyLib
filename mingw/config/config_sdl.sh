#================================================
GLIB_VERSION="2.0.10"
GLIB_LINK=https://www.libsdl.org/release/SDL2-2.0.10.tar.gz
GLIB_ARCHIVE_NAME=SDL2-2.0.10
#================================================
GLIB_VERSION_NAME=$GLIB_NAME-$GLIB_VERSION
GLIB_VERSION_ARCHIVE=$GLIB_NAME-$GLIB_VERSION.tar.gz
GLIB_VERSION_SRC=$GLIB_BUILD_SRC/$GLIB_VERSION_NAME
GLIB_VERSION_SRC_WIN=$(cygpath -w $GLIB_VERSION_SRC)
#================================================
GLIB_LINK_DOWNLOAD="
wget $GLIB_LINK -O $GLIB_VERSION_ARCHIVE ;
tar xzfv $GLIB_VERSION_ARCHIVE ;
mv $GLIB_ARCHIVE_NAME $GLIB_VERSION_NAME ;
"
#================================================
GLIB_BUILD_RUN="
cmake -G \"Unix Makefiles\" \
-DCMAKE_INSTALL_PREFIX=$GLIB_BUILD_PREFIX \
$GLIB_VERSION_SRC
"
#================================================
GLIB_BUILD_MAKE="
make ;
make install
"
#================================================
GLIB_DEV_INSTALL="
mkdir -p ../include ;
mkdir -p ./lib ;
> ./README.md ;
> ../README.md ;
> ../../README.md ;
cp -rf $GLIB_BUILD_PREFIX/include ../include ;
if [ -d $GLIB_BUILD_PREFIX/lib ] ; then \
cp -rf $GLIB_BUILD_PREFIX/lib ./lib ;
elif [ -d $GLIB_BUILD_PREFIX/lib64 ] ; then \
cp -rf $GLIB_BUILD_PREFIX/lib64 ./lib ; 
fi
"
#================================================
