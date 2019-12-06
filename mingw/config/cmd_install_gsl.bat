@echo off
::===============================================
set PATH=C:\MinGW\bin;%PATH%
set PATH=C:\Program Files\CMake\bin;%PATH%
set "GCYGWIN=C:\cygwin64\bin"
::===============================================
set "GLIB_NAME=gsl"
set "GLIB_VERSION=2.2.1"
set "GLIB_COMPILER=c"
::===============================================
set "GLIB_BUILD=C:\lib\build"
set "GLIB_DEV=C:\Users\Admin\Downloads\Programs\ReadyLib\dev"
::===============================================
set "GLIB_SCRIPT_ROOT=%cd%"
::===============================================
call :GLib_Arch
::===============================================
set "GLIB_BUILD_NAME=%GLIB_BUILD%\%GLIB_NAME%"
set "GLIB_BUILD_SRC=%GLIB_BUILD_NAME%\source\%GLIB_COMPILER%"
set "GLIB_BUILD_DIR=%GLIB_BUILD_NAME%\build\%GLIB_COMPILER%"
set "GLIB_BUILD_PREFIX=%GLIB_BUILD_NAME%\install\%GLIB_COMPILER%"
set "GLIB_DEV_NAME=%GLIB_DEV%\%GLIB_NAME%"
set "GLIB_DEV_DIR=%GLIB_DEV_NAME%\%GLIB_COMPILER%\%GLIB_VERSION%\%GLIB_ARCH%"
set "GLIB_MAKEFILE_PATH=%GLIB_SCRIPT_ROOT%\makefile\%GLIB_NAME%\%GLIB_COMPILER%\Makefile
::===============================================
set "GLIB_LINK=https://sourceforge.net/projects/gnu-scientific-library-windows/files/gsl-2.2.1_mingw-6.2.0.zip"
set "GLIB_ARCHIVE_NAME=gsl-2.2.1_mingw-6.2.0.zip"
set "GLIB_ARCHIVE_SRC=gsl-2.2.1_mingw-6.2.0"
set "GLIB_ARCHIVE_SRC_NAME=gsl-2.2.1_mingw-6.2.0\gsl-2.2.1-static"
set "GLIB_SOURCE_DIR=%GLIB_BUILD_SRC%\%GLIB_ARCHIVE_SRC_NAME%"
::===============================================
call :GLib_Generate
goto :eof
::===============================================
:GLib_Download
    echo [ INFO ] Telechargement de la librairie...[ %GLIB_NAME% ]
    if not exist %GLIB_BUILD_SRC% ( mkdir %GLIB_BUILD_SRC% )
    cd %GLIB_BUILD_SRC%
    if not exist "%GLIB_ARCHIVE_NAME%" ( %GCYGWIN%\wget %GLIB_LINK% )
    if not exist "%GLIB_ARCHIVE_SRC%" ( %GCYGWIN%\unzip %GLIB_ARCHIVE_NAME% )
    cd %GLIB_SCRIPT_ROOT%
goto :eof
::===============================================
:GLib_Build
    echo [ INFO ] Generation de la librairie...[ %GLIB_NAME% ]
goto :eof
::===============================================
:GLib_Make
    echo [ INFO ] Construction de la librairie...[ %GLIB_NAME% ]
goto :eof
::===============================================
:GLib_Install
    echo [ INFO ] Installation de la librairie...[ %GLIB_NAME% ]
    if not exist %GLIB_DEV_DIR% ( mkdir %GLIB_DEV_DIR% )
    cd %GLIB_DEV_DIR%
    if not exist "..\include" ( mkdir "..\include" )
    if not exist ".\lib" ( mkdir ".\lib" )
    if not exist ".\bin" ( mkdir ".\bin" )
    echo. > ./README.md
    echo. > ../README.md
    echo. > ../../README.md
    echo. > ../../../README.md
    if exist "%GLIB_SOURCE_DIR%\include" ( xcopy /q /s /i /y "%GLIB_SOURCE_DIR%\include" "..\include" )
    if exist "%GLIB_SOURCE_DIR%\lib" ( xcopy /q /s /i /y "%GLIB_SOURCE_DIR%\lib" ".\lib" )
    if exist "%GLIB_SOURCE_DIR%\bin" ( xcopy /q /s /i /y "%GLIB_SOURCE_DIR%\bin" ".\bin" )
    cd %GLIB_SCRIPT_ROOT%
goto :eof
::===============================================
:GLib_Arch
set "GLIB_ARCH=mingw"
    if exist "%PROGRAMFILES(X86)%" ( set "GLIB_ARCH=mingw64" )
goto :eof
::===============================================
:GLib_Generate
    call :GLib_Download
    call :GLib_Build
    call :GLib_Make
    call :GLib_Install
goto :eof
::===============================================
