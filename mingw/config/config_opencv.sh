#================================================
GLIB_VERSION="2.4.13.6"
GLIB_LINK=https://github.com/opencv/opencv/archive/2.4.13.6.zip
GLIB_ARCHIVE_NAME=opencv-2.4.13.6
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
cmake -G \"MSYS Makefiles\" \
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
