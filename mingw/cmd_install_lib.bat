@echo off
::===============================================
::===============================================
set "GLIB_BUILD=C:\lib\build"
set "GLIB_DEV=C:\Users\Admin\Downloads\Programs\ReadyLib\dev"
set "GCYGWIN=C:\cygwin64\bin"
::===============================================
set "GLIB_SCRIPT_ROOT=%cd%"
set "GLIB_CONFIG_ROOT=%GLIB_SCRIPT_ROOT%\config"
set "GLIB_MAKEFILE_ROOT=%GLIB_SCRIPT_ROOT%\makefile"
::===============================================
call :GLib_Generate glm
goto :eof 
::===============================================
:GLib_Create
    echo [ INFO ] Creation des repertoires lib...[ lib + build + dev ]
    if not exist %GLIB_BUILD% ( mkdir %GLIB_BUILD% )
    if not exist %GLIB_DEV% ( mkdir %GLIB_DEV% )
    
    echo GLIB_BUILD : %GLIB_BUILD%
    echo GLIB_DEV : %GLIB_DEV%
    echo GCYGWIN : %GCYGWIN%
    echo.
goto :eof
::===============================================
:GLib_Config
    echo [ INFO ] configuration de la librairie...[ %GLIB_NAME% ]
    set "GLIB_BUILD_NAME=%GLIB_BUILD%\%GLIB_NAME%"
    set "GLIB_DEV_NAME=%GLIB_DEV%\%GLIB_NAME%"
    set "GLIB_DEV_DIR=%GLIB_DEV_NAME%\%GLIB_ARCH%"
    set "GLIB_BUILD_SRC=%GLIB_BUILD_NAME%\source"
    set "GLIB_BUILD_DIR=%GLIB_BUILD_NAME%\build"
    set "GLIB_BUILD_PREFIX=%GLIB_BUILD_NAME%\install"
    set "GLIB_CONFIG_NAME=config_%GLIB_NAME%.bat"
    set "GLIB_CONFIG_PATH=%GLIB_CONFIG_ROOT%\%GLIB_CONFIG_NAME%"
    set "GLIB_MAKEFILE_NAME=makefile_%GLIB_NAME%.txt"
    set "GLIB_MAKEFILE_PATH=%GLIB_MAKEFILE_ROOT%\%GLIB_MAKEFILE_NAME%"
    
    echo GLIB_NAME : %GLIB_NAME%
    echo GLIB_SCRIPT_ROOT : %GLIB_SCRIPT_ROOT%
    echo GLIB_CONFIG_ROOT : %GLIB_CONFIG_ROOT%
    echo GLIB_CONFIG_NAME : %GLIB_CONFIG_NAME%
    echo GLIB_CONFIG_PATH : %GLIB_CONFIG_PATH%
    echo.

    call %GLIB_CONFIG_PATH%
goto :eof
::===============================================
:GLib_Download
    echo [ INFO ] telechargement de la librairie...[ %GLIB_NAME% ]
    echo GLIB_LINK : %GLIB_LINK%
    echo GLIB_BUILD_SRC : %GLIB_BUILD_SRC%
    echo GLIB_VERSION_ARCHIVE : %GLIB_VERSION_ARCHIVE%
    echo GLIB_VERSION : %GLIB_VERSION%
    echo GLIB_ARCHIVE_NAME : %GLIB_ARCHIVE_NAME%
    echo GLIB_VERSION_NAME : %GLIB_VERSION_NAME%
    echo.
    
    if not exist %GLIB_BUILD_SRC% ( mkdir %GLIB_BUILD_SRC% )
    cd %GLIB_BUILD_SRC%
    %myvar%
    cd %GLIB_SCRIPT_ROOT%
goto :eof
::===============================================
:GLib_Build
    echo "[ INFO ] generation de la librairie...[ $GLIB_NAME ]"
    mkdir -p $GLIB_BUILD_DIR
    cd $GLIB_BUILD_DIR
    eval $GLIB_BUILD_RUN
goto :eof
::===============================================
:GLib_Make
    echo "[ INFO ] construction de la librairie...[ $GLIB_NAME ]"
    cd $GLIB_BUILD_DIR
    eval $GLIB_BUILD_MAKE
goto :eof
::===============================================
:GLib_Install
    echo "[ INFO ] installation de la librairie...[ $GLIB_NAME ]"
    mkdir -p $GLIB_DEV_DIR
    cd $GLIB_DEV_DIR
    eval $GLIB_DEV_INSTALL
goto :eof
::===============================================
:GLib_Clean
    echo "[ INFO ] suppression du repertoire build de la librairie...[ $GLIB_NAME ]"
    #rm -rf $GLIB_BUILD_SRC
    #rm -rf $GLIB_BUILD_DIR
    #rm -rf $GLIB_BUILD
goto :eof
::===============================================
:GLib_Generate
    set "GLIB_NAME=%1"
    call :GLib_Create
    call :GLib_Config
    call :GLib_Download
goto :eof
::===============================================
:GLib_Arch
set GLIB_ARCH=mingw
    if exist "%PROGRAMFILES(X86)%" ( set GLIB_ARCH=mingw64 )
goto :eof
::===============================================
