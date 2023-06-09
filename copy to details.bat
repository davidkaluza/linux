@echo off
setlocal EnableDelayedExpansion

FOR %%A IN (%*) DO (

	set "FileFullName=%%~nxA"
	set "FileName=!FileFullName:~6!"
	set "path=%~dp0"
	set "FolderName=!FileFullName:~0,5!"
	set "Dir=D:\2-Works\2.1-Fotos\2.1.1-SkulpturenTC\2.1.1.5-Details for Galleries"
	
	ren echo "!Dir!\!FolderName!\!FileName!"

	ren if not exist !FolderName! mkdir "!Dir!\!FolderName!"

	ren copy "!FileFullName!" "!Dir!\!FolderName!\!FileName!"
)
	ren not working yet
	ren magick mogrify -resize 4000x4000 !Dir!\!FolderName!\*.jpg

pause