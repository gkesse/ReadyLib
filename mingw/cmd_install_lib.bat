@echo off
::===============================================
set "GLIB_NAME=%1%"
set "GLIB_COMPILER=%2%"
::===============================================
if "%GLIB_NAME%" == "" ( set "GLIB_NAME=all")
::===============================================
if "%GLIB_COMPILER%" == "" ( 
set "GLIB_COMPILER="
) else (
if "%GLIB_COMPILER%" == "c" ( 
set "GLIB_COMPILER="
) else (
set "GLIB_COMPILER=_%GLIB_COMPILER%"
))
::===============================================
call :GLib_Generate
goto :eof
::===============================================
:GLib_Generate
    cd config
    set "GLIB_INSTALL_LIB=cmd_install_%GLIB_NAME%%GLIB_COMPILER%.bat"
    call %GLIB_INSTALL_LIB%
    cd ..
goto :eof
::===============================================
