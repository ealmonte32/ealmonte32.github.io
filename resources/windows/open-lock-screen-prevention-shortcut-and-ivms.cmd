@echo off
REM 11.01.2023.EA
REM wait 5 seconds then start keep awake and then ivms

timeout /t 5
start /min powershell "C:\Scripts\keep-awake-script.ps1" && start /max "" "C:\Users\Public\Desktop\iVMS-4200 3.8.0.4 Client.lnk"