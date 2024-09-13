@echo off
setlocal enabledelayedexpansion

:: Set the folder path
set "folderPath=C:\Users\WesleyWEN\Downloads"

:: List of extensions to delete
set "extensions=pdf xlsx"

:: Initialize counters
set "foundCount=0"
set "deletedCount=0"

echo Listing files before deletion:
echo.

:: Loop through each extension
for %%x in (%extensions%) do (
    echo Listing files with extension "%%x"
    
    :: Find and list files with the current extension
    for /f "tokens=*" %%F in ('dir /b /a "%folderPath%\*%%x"') do (
        set /a "foundCount+=1"
        echo !foundCount! - %%~nxF
    )

    echo.
)

echo Found %foundCount% files with extensions %extensions%.

:: Pause for confirmation
timeout 5

:: Delete the files
for %%x in (%extensions%) do (
    echo Deleting files with extension "%%x"
    del /f /q "%folderPath%\*%%x"
    if !errorlevel! equ 0 (
        set /a "deletedCount+=foundCount"
    ) else (
        echo Warning: Some files with extension "%%x" could not be deleted.
    )
)

echo Deletion completed.
echo Total files deleted: %deletedCount%

pause



