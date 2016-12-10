REM This simple script will add logo from _logo directory to each image located in 'in' directory.
REM Converted images will be stored in 'out' directory.
REM Current version: 1.0 by Adam Taciak @ 2016
REM To run this script, you need to install imagemagick first:
REM https://www.imagemagick.org/script/binary-releases.php

REM Configuration section
SET magick="C:\Program Files\ImageMagick-7.0.3-Q16\magick.exe"

@echo off
CLS

FOR %%i IN ("in\*.jpg", "in\*.jpeg") DO (CALL :convert "%%i")
ECHO "Convertion has been completed"
PAUSE
EXIT

REM Subroutines
:convert
SETLOCAL ENABLEDELAYEDEXPANSION
SET input=%1
SET output=%1
SET output=%output:in=out%
ECHO "Converting %input%"
START /b "" %magick% "composite" "_logo\logo.jpg" %input% "-gravity" "southeast" "-compose" "src-over" %output%
EXIT /b
