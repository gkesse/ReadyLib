@echo off
::===============================================
set PATH=C:\cygwin\bin
set PATH=C:\MinGW\bin
set PATH=C:\Program Files\CMake\bin;%PATH%
::===============================================
::bash cmd_install_lib.sh
::===============================================
cd C:\lib\build\sdl\build
cmake -G "MinGW Makefiles" ..\source\sdl-2.0.10\
