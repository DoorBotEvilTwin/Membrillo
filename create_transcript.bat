@echo off
setlocal enabledelayedexpansion

REM --- Configuration ---
REM Set the name of the subdirectory containing your WAV files.
set "WAV_FOLDER=wavs"

REM Set the name of the output CSV file.
set "OUTPUT_FILE=metadata.csv"
REM --- End Configuration ---

REM Check if the WAV folder exists
if not exist "%WAV_FOLDER%\" (
    echo ERROR: The folder "%WAV_FOLDER%" was not found.
    echo Please make sure this script is in the parent directory of your wavs folder.
    pause
    exit /b
)

REM Delete the old output file if it exists
if exist "%OUTPUT_FILE%" (
    del "%OUTPUT_FILE%"
    echo Deleted existing %OUTPUT_FILE%.
)

echo Creating %OUTPUT_FILE%...

REM Loop through all .wav files in the specified folder
for %%f in ("%WAV_FOLDER%\*.wav") do (
    REM Get the filename and extension
    set "filename=%%~nxf"
    
    REM Write the line in LJSpeech format (e.g., wavs/sample_01.wav|) to the output file
    echo %WAV_FOLDER%/!filename!^|>> "%OUTPUT_FILE%"
)

echo.
echo Done!
echo %OUTPUT_FILE% has been created. You can now open it and add your transcriptions.
pause