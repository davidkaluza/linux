@echo off

::echo %date:~-4%-%date:~3,2%-%date:~0,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%
set datetime=%date:~-4%-%date:~3,2%-%date:~0,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%

::echo %datetime%
::echo %username%

mkdir C:\Users\%username%\Documents\BACKUP\%datetime%
xcopy C:\Users\%username%\Desktop\*.xlsx C:\Users\%username%\Documents\BACKUP\%datetime%\ /H
xcopy C:\Users\%username%\Desktop\*.docx C:\Users\%username%\Documents\BACKUP\%datetime%\ /H
