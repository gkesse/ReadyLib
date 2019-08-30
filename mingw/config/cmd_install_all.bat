@echo off
::===============================================
set "GLIB_NAME_MAP="
set "GLIB_NAME_MAP=%GLIB_NAME_MAP%;glfw"
set "GLIB_NAME_MAP=%GLIB_NAME_MAP%;glm"
set "GLIB_NAME_MAP=%GLIB_NAME_MAP%;opencv"
::===============================================
call :GLib_Generate
goto :eof
::===============================================
:GLib_Generate
    for %%a in ("*.bat") do (
       if not "%%a" == "cmd_install_all.bat" ( call %%a )
    )
goto :eof
::===============================================
