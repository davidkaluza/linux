@echo off

echo """"""""""""""""""""""""
echo " RaspberryPi 1	= 1 "
echo " RaspberryPi 2	= 2 "
echo " RaspberryPi 3	= 3 "
echo " NanoPiNeo	= 4 "
echo " NanoPiAir	= 5 "
echo """"""""""""""""""""""""

set /p input1="Enter a value: "
echo %input1%

echo checking internet connection
Ping www.google.nl -n 1 -w 1000
cls
if errorlevel 1 (set internet=Not connected to internet) else (set internet=Connected to internet)

echo %internet%

echo Checking connection
ping -n 1 www.google.com >nul
if errorlevel 1 (
  cls
  set "%internet%"=="Not connected to internet"
  echo %internet%
  pause>nul
  exit
)

set "%internet%"=="Connected to internet"
echo %internet%
pause>nul
pause

@setlocal enableextensions enabledelayedexpansion
@echo off
set ipaddr=%1
:loop
set state=up
ping -n 1 !ipaddr! >nul: 2>nul:
if not !errorlevel!==0 set state=down
echo.Link is !state!
if "!state!"=="up" (
  goto :endloop
)