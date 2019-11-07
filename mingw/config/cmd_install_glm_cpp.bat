@echo off
::===============================================
set PATH=C:\MinGW\bin;%PATH%
set PATH=C:\Program Files\CMake\bin;%PATH%
set "GCYGWIN=C:\cygwin64\bin"
::===============================================
set "GLIB_NAME=glm"
set "GLIB_VERSION=0.9.9.6"
set "GLIB_COMPILER=cpp"
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
set "GLIB_BUILD_DIR=%GLIB_BUILD_NAME%\build\%GLIB_COMPILER%"
set "GLIB_BUILD_PREFIX=%GLIB_BUILD_NAME%\install\%GLIB_COMPILER%"
set "GLIB_DEV_NAME=%GLIB_DEV%\%GLIB_NAME%"
set "GLIB_DEV_DIR=%GLIB_DEV_NAME%\%GLIB_COMPILER%\%GLIB_VERSION%\%GLIB_ARCH%"
::===============================================
set "GLIB_LINK=https://github.com/g-truc/glm/releases/download/0.9.9.6/glm-0.9.9.6.zip"
set "GLIB_ARCHIVE_NAME=glm-0.9.9.6.zip"
set "GLIB_ARCHIVE_SRC=glm"
set "GLIB_SOURCE_DIR=%GLIB_BUILD_SRC%\%GLIB_ARCHIVE_SRC%"
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
    if not exist %GLIB_DEV_DIR% ( mkdir %GLIB_DEV_DIR% )
    cd %GLIB_DEV_DIR%
    if not exist "..\include" ( mkdir "..\include" )
    if not exist ".\lib" ( mkdir ".\lib" )
    if not exist ".\bin" ( mkdir ".\bin" )
    echo. > ./README.md
    echo. > ../README.md
    echo. > ../../README.md
    echo. > ../../../README.md
    if exist "%GLIB_BUILD_PREFIX%\include" ( xcopy /q /s /i /y "%GLIB_BUILD_PREFIX%\include" "..\include" )
    if exist "%GLIB_BUILD_PREFIX%\lib" ( xcopy /q /s /i /y "%GLIB_BUILD_PREFIX%\lib" ".\lib" )
    if exist "%GLIB_BUILD_PREFIX%\lib64" ( xcopy /q /s /i /y "%GLIB_BUILD_PREFIX%\lib64" ".\lib" )
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
