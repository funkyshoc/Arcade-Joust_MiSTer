@echo off

set    zip=joust.zip
set ifiles=3006-22.10b+3006-23.11b+3006-24.12b+3006-13.1b+3006-14.2b+3006-15.3b+3006-16.4b+3006-17.5b+3006-18.6b+3006-19.7b+3006-20.8b+3006-21.9b+joust.snd+decoder.4+decoder.6
set  ofile=a.joust.rom

rem =====================================
setlocal ENABLEDELAYEDEXPANSION

set pwd=%~dp0
echo.
echo.

if EXIST %zip% (

	!pwd!7za x -otmp %zip%
	if !ERRORLEVEL! EQU 0 ( 
		cd tmp

		copy /b/y %ifiles% !pwd!%ofile%
		if !ERRORLEVEL! EQU 0 ( 
			echo.
			echo ** done **
			echo.
			echo Copy "%ofile%" into root of SD card
		)
		cd !pwd!
		rmdir /s /q tmp
	)

) else (

	echo Error: Cannot find "%zip%" file
	echo.
	echo Put "%zip%", "7za.exe" and "%~nx0" into the same directory
)

echo.
echo.
pause
