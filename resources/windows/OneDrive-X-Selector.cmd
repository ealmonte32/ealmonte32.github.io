@echo off
REM 4.8.2022.EA

GOTO MAINMENU
:MAINMENU
cls
echo.
echo ==============================
echo  OneDrive - Glatt Group
echo  X: Drive Destination Selector
echo ==============================
echo.
echo  Main Menu:
echo   1. Set X: target to --^> OneDrive - Glatt Group\Desktop
echo   2. Set X: target to --^> OneDrive - Glatt Group\Documents
echo   3. Set X: target to --^> OneDrive - Glatt Group (Entire Directory)
echo   4. Set X: target to --^> Custom Location (only with help from IT)
echo   5. Remove the X: drive
echo   6. Exit
echo.
echo.

REM Check if X: drive already exists..
if exist X: (
echo  **** Warning ****
echo  This program has detected that you already have the X: letter mapped to something.
echo  Continue only if advised by IT to do so.
echo.
)

REM Check if the user has a OneDrive - Glatt Group directory..
if not exist "%systemdrive%\Users\%username%\OneDrive - Glatt Group" (
echo  *** The program has determined that you do not currently have "OneDrive - Glatt Group" set up on your computer.
echo  *** Please contact the IT department about this.
echo.
pause
exit
)

set /p chooseDest=" Type a number from the Main Menu, then press Enter: " %=%
if /i %chooseDest%==1 (GOTO ONEDRIVEDESKTOP)
if /i %chooseDest%==2 (GOTO ONEDRIVEDOCS)
if /i %chooseDest%==3 (GOTO ONEDRIVEDIR)
if /i %chooseDest%==4 (GOTO CUSTOM)
if /i %chooseDest%==5 (GOTO REMOVEX)
if /i %chooseDest%==6 (exit)

REM exit if no correct option was selected
echo.
echo Sorry, but %chooseDest% is not an option.
echo Try again...
timeout 5
GOTO MAINMENU

:ONEDRIVEDESKTOP
net use X: /d /y
cls
echo.
echo X: set to target OneDrive - Glatt Group\Desktop directory..
net use X: "\\%computername%\C$%homepath%\OneDrive - Glatt Group\Desktop" /persistent:yes
pause
exit

:ONEDRIVEDOCS
net use X: /d /y
cls
echo.
echo X: set to target OneDrive - Glatt Group\Documents directory..
net use X: "\\%computername%\C$%homepath%\OneDrive - Glatt Group\Documents" /persistent:yes
pause
exit

:ONEDRIVEDIR
net use X: /d /y
cls
echo.
echo X: set to target OneDrive - Glatt Group directory..
net use X: "\\%computername%\C$%homepath%\OneDrive - Glatt Group" /persistent:yes
pause
exit

:CUSTOM
net use X: /d /y
cls
echo.
echo You have chosen the Custom Location option. Remember, UNC paths only (e.g. \\binzen.glatt.de\gat\..)
echo.
echo Copy the full UNC path of the destination folder, paste it here, then press Enter..
set /p customDest="Custom Path: " %=%
echo.
echo Mapping X: drive to %customDest% ...
net use X: "%customDest%" /persistent:yes
if %ERRORLEVEL% NEQ 0 (GOTO TRYAGAIN) else (echo Done..)
pause
exit

:TRYAGAIN
echo.
echo *** Error during drive mapping, please check the path and make sure its UNC.
echo.
set /p tryagain="Would you like to try again? (y/n) " %=%
if /i %tryagain%==y (GOTO CUSTOM) else (exit)


:REMOVEX
echo.
net use X: /d /y
echo Virtual/Mapped drive X: has been removed..
pause
GOTO MAINMENU
