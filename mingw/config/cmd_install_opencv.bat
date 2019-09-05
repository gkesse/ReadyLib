@echo off
::===============================================
set PATH=C:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin;%PATH%
set PATH=C:\Program Files\CMake\bin;%PATH%
set "GCYGWIN=C:\cygwin64\bin"
::===============================================
set "GLIB_NAME=opencv"
::===============================================
set "GLIB_BUILD=C:\lib\build"
set "GLIB_DEV=C:\Users\Admin\Downloads\Programs\ReadyLib\dev"
::===============================================
set "GLIB_SCRIPT_ROOT=%cd%"
::===============================================
call :GLib_Arch
::===============================================
set "GLIB_BUILD_NAME=%GLIB_BUILD%\%GLIB_NAME%"
set "GLIB_BUILD_SRC=%GLIB_BUILD_NAME%\source"
set "GLIB_BUILD_DIR=%GLIB_BUILD_NAME%\build"
set "GLIB_BUILD_PREFIX=%GLIB_BUILD_NAME%\install"
set "GLIB_DEV_NAME=%GLIB_DEV%\%GLIB_NAME%"
set "GLIB_DEV_DIR=%GLIB_DEV_NAME%\%GLIB_ARCH%"
::===============================================
set "GLIB_LINK=https://github.com/huihut/OpenCV-MinGW-Build/archive/OpenCV-3.4.7.zip"
set "GLIB_ARCHIVE_NAME=OpenCV-3.4.7"
set "GLIB_ARCHIVE_SRC=OpenCV-MinGW-Build-OpenCV-3.4.7"
set "GLIB_SOURCE_DIR=%GLIB_BUILD_SRC%\%GLIB_ARCHIVE_SRC%"
set "GLIB_SOURCE_BIN=%GLIB_SOURCE_DIR%\x86\mingw"
::===============================================
call :GLib_Generate
goto :eof
::===============================================
:GLib_Download
    echo [ INFO ] Telechargement de la librairie...[ %GLIB_NAME% ]
    if not exist %GLIB_BUILD_SRC% ( mkdir %GLIB_BUILD_SRC% )
    cd %GLIB_BUILD_SRC%
    if not exist "%GLIB_ARCHIVE_NAME%.zip" ( %GCYGWIN%\wget %GLIB_LINK% )
    if not exist "%GLIB_ARCHIVE_SRC%" ( %GCYGWIN%\unzip %GLIB_ARCHIVE_SRC% )
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
    echo. > ./README.md
    echo. > ../README.md
    echo. > ../../README.md
    if exist "%GLIB_SOURCE_DIR%\include" ( xcopy /q /s /i /y "%GLIB_SOURCE_DIR%\include" "..\include" )
    if exist "%GLIB_SOURCE_BIN%\lib" ( xcopy /q /s /i /y "%GLIB_SOURCE_BIN%\lib" ".\lib" )
    if exist "%GLIB_SOURCE_BIN%\bin" ( xcopy /q /s /i /y "%GLIB_SOURCE_BIN%\bin" ".\bin" )
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
