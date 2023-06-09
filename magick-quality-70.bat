set progress=0

for %%i in (%*) do (
::magick %%i -quality 70 %%i
set /a progress=progress+1
)

echo %progress%

for %%i in (%*) do (
::magick %%i -quality 70 %%i
set /a progress=progress+1
)

pause