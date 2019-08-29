@echo off
::===============================================
set "GLIB_VERSION=0.9.9.5"
set "GLIB_LINK=https://github.com/g-truc/glm/releases/download/0.9.9.5/glm-0.9.9.5.zip"
set "GLIB_ARCHIVE_NAME=glm-0.9.9.5"
::===============================================
set "GLIB_VERSION_NAME=%GLIB_NAME%-%GLIB_VERSION%"
set "GLIB_VERSION_ARCHIVE=%GLIB_NAME%-%GLIB_VERSION%.zip"
::===============================================
set "GLIB_LINK_DOWNLOAD= 
%GCYGWIN%\wget %GLIB_LINK% -O %GLIB_VERSION_ARCHIVE%
%GCYGWIN%\unzip %GLIB_VERSION_ARCHIVE%
%GCYGWIN%\mv %GLIB_ARCHIVE_NAME% %GLIB_VERSION_NAME%
"
exit
::===============================================
set "GLIB_BUILD_RUN=
cmake -G \"MSYS Makefiles\" ^
-DCMAKE_INSTALL_PREFIX=%GLIB_BUILD_PREFIX% ^
%GLIB_VERSION_SRC%
"
::===============================================
set "GLIB_BUILD_MAKE=
mingw32-make
mingw32-make install
"
::===============================================
set "GLIB_DEV_INSTALL=
mkdir ../include ;
mkdir ./lib ;
> ./README.md ;
> ../README.md ;
> ../../README.md ;
cp -rf %GLIB_BUILD_PREFIX/include ../include ;
if [ -d %GLIB_BUILD_PREFIX/lib ] ; then \
cp -rf %GLIB_BUILD_PREFIX/lib ./lib ;
elif [ -d %GLIB_BUILD_PREFIX/lib64 ] ; then \
cp -rf %GLIB_BUILD_PREFIX/lib64 ./lib ; 
fi
"
::===============================================
