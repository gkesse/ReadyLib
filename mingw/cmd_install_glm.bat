@echo off
::===============================================
set PATH=C:\MinGW\bin
set PATH=C:\Program Files\CMake\bin;%PATH%
::===============================================
set "GLIB_NAME=glm"
::===============================================
set "GLIB_BUILD=C:\lib\build"
set "GLIB_DEV=C:\Users\Admin\Downloads\Programs\ReadyLib\dev"
::===============================================
set "GCYGWIN=C:\cygwin64\bin"
set "GLIB_SCRIPT_ROOT=%cd%"
::===============================================
call :GLib_Arch
::===============================================
set "GLIB_BUILD_NAME=%GLIB_BUILD%\%GLIB_NAME%"
set "GLIB_BUILD_SRC=%GLIB_BUILD_NAME%\source"
set "GLIB_BUILD_DIR=%GLIB_BUILD_NAME%\build"
set "GLIB_BUILD_PREFIX=%GLIB_BUILD_NAME%\install"
set "GLIB_DEV_DIR=%GLIB_DEV_NAME%\%GLIB_ARCH%"
::===============================================
set "GLIB_LINK=https://github.com/g-truc/glm/releases/download/0.9.9.5/glm-0.9.9.5.zip"
set "GLIB_ARCHIVE_NAME=glm"
set "GLIB_SOURCE_DIR=%GLIB_BUILD_SRC%\%GLIB_ARCHIVE_NAME%"
::===============================================
call :GLib_Generate
goto :eof
::===============================================
:GLib_Download
    echo [ INFO ] Telechargement de la librairie...[ %GLIB_NAME% ]
    if not exist %GLIB_BUILD_SRC% ( mkdir %GLIB_BUILD_SRC% )
    cd %GLIB_BUILD_SRC%
    %GCYGWIN%\wget %GLIB_LINK% -O %GLIB_VERSION_ARCHIVE%
    %GCYGWIN%\unzip %GLIB_VERSION_ARCHIVE%
    cd %GLIB_SCRIPT_ROOT%
goto :eof
::===============================================
:GLib_Build
    echo [ INFO ] Generation de la librairie...[ %GLIB_NAME% ]
    if not exist %GLIB_BUILD_DIR% ( mkdir %GLIB_BUILD_DIR% )
    cd %GLIB_BUILD_DIR%
    cmake -G "MinGW Makefiles" ^
    -DCMAKE_INSTALL_PREFIX=%GLIB_BUILD_PREFIX% ^
    %GLIB_SOURCE_DIR%
    cd %GLIB_SCRIPT_ROOT%
goto :eof
::===============================================
:GLib_Make
    echo [ INFO ] Construction de la librairie...[ %GLIB_NAME% ]
    cd %GLIB_BUILD_DIR%
    mingw32-make
    mingw32-make install
    cd %GLIB_SCRIPT_ROOT%
goto :eof
::===============================================
:GLib_Install
    echo [ INFO ] Installation de la librairie...[ %GLIB_NAME% ]
    if not exist %GLIB_BUILD_DIR% ( mkdir %GLIB_BUILD_DIR% )
    cd %GLIB_DEV_DIR%
    if not exist "../include" ( mkdir "../include" )
    if not exist "./lib" ( mkdir "./lib" )
    > ./README.md ;
    > ../README.md ;
    > ../../README.md ;
    if exist %GLIB_BUILD_PREFIX%\include ( %GCYGWIN%\cp -rf %GLIB_BUILD_PREFIX%\include\* ..\include\* )
    if exist %GLIB_BUILD_PREFIX%\lib ( %GCYGWIN%\cp -rf %GLIB_BUILD_PREFIX%\lib\* .\include\* )
    if exist %GLIB_BUILD_PREFIX%\lib64 ( %GCYGWIN%\cp -rf %GLIB_BUILD_PREFIX%\lib64\* .\include\* )
    cd %GLIB_SCRIPT_ROOT%
goto :eof
::===============================================
:GLib_Arch
set "GLIB_ARCH=mingw"
    if exist "%PROGRAMFILES(X86)%" ( set "GLIB_ARCH=mingw64" )
goto :eof
::===============================================
:GLib_Generate
    ::call :GLib_Download
    ::call :GLib_Build
    ::call :GLib_Make
    call :GLib_Install
goto :eof
::===============================================
