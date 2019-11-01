@echo off
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
