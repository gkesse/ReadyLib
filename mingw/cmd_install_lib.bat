@echo off
::===============================================
set "GLIB_NAME=%1%"
::===============================================
if "%GLIB_NAME%" == "" ( set "GLIB_NAME=all")
::===============================================
call :GLib_Generate
goto :eof
::===============================================
:GLib_Generate
    cd config
    set "GLIB_INSTALL_LIB=cmd_install_%GLIB_NAME%.bat"
    call %GLIB_INSTALL_LIB%
    cd ..
goto :eof
::===============================================
