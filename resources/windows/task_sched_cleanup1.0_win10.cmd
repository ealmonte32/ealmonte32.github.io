@echo off
echo Cleaning up Task Scheduler...

del /s /q "%windir%\Tasks\G2MUploadTask-*"
del /s /q "%windir%\System32\Tasks\Adobe Acrobat Update*"
del /s /q "%windir%\System32\Tasks\Adobe Flash Player*"
del /s /q "%windir%\System32\Tasks\AdobeAAMUpdater-1*"
del /s /q "%windir%\System32\Tasks\G2MUploadTask-*"
del /s /q "%windir%\System32\Tasks\Intel PTT EK Recertification"
del /s /q "%windir%\System32\Tasks\OneDrive Standalone Update*"
del /s /q "%windir%\System32\Tasks\WPD\*"
del /s /q "%windir%\System32\Tasks\SafeZone*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\Application Experience\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\Autochk\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\CloudExperienceHost\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\Customer Experience Improvement Program\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\DiskDiagnostic\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\Defrag\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\HelloFace\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\Maps\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\MobilePC\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\Maintenance\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\Offline Files\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\Power Efficiency Diagnostics\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\SideShow\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\SharedPC\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\UPnP\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\Windows Media Sharing\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\WindowsBackup\*"
del /s /q "%windir%\System32\Tasks\Microsoft\Windows\Work Folders\*"
del /s /q "%windir%\System32\Tasks\Microsoft\XblGameSave\*"

echo Deleting from Task_Migrated location

del /s /q "%windir%\Tasks\G2MUploadTask-*"
del /s /q "%windir%\System32\Tasks_Migrated\Adobe Acrobat Update*"
del /s /q "%windir%\System32\Tasks_Migrated\Adobe Flash Player*"
del /s /q "%windir%\System32\Tasks_Migrated\AdobeAAMUpdater-1*"
del /s /q "%windir%\System32\Tasks_Migrated\G2MUploadTask-*"
del /s /q "%windir%\System32\Tasks_Migrated\Intel PTT EK Recertification"
del /s /q "%windir%\System32\Tasks_Migrated\OneDrive Standalone Update*"
del /s /q "%windir%\System32\Tasks_Migrated\WPD\*"
del /s /q "%windir%\System32\Tasks_Migrated\SafeZone*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\Application Experience\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\Autochk\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\CloudExperienceHost\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\Customer Experience Improvement Program\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\DiskDiagnostic\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\Defrag\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\HelloFace\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\Maps\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\MobilePC\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\Maintenance\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\Offline Files\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\Power Efficiency Diagnostics\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\SideShow\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\SharedPC\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\UPnP\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\Windows Media Sharing\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\WindowsBackup\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\Windows\Work Folders\*"
del /s /q "%windir%\System32\Tasks_Migrated\Microsoft\XblGameSave\*"

echo Deleting any previous tasks left by Avast AV...
rmdir "%windir%\System32\Tasks\AVAST Software"

echo Deleting the Task Scheduler Cache from registry
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree" /f

echo Done
pause
exit /B