@echo off
REM 04.15.2026.EA
REM Optimization script for Windows 10/11
REM Suggestion is to run this as the account you will use but for it to be an administrator when it is executed, then lower the account back to regular Standard user.
setlocal
cls

echo Creating Temp directory in system drive..
if not exist "%systemdrive%\Temp" mkdir "%systemdrive%\Temp"

echo Getting Bitlocker Key and saving in Temp
manage-bde -on %systemdrive% -RecoveryKey -RecoveryPassword -SkipHardwareTest "%systemdrive%\Temp"
manage-bde -protectors -get %systemdrive% >> "%systemdrive%\Temp\%computername% BitLocker Recovery Key.txt"


echo Setting Microsoft Edge Enforced Policies via registry.. in case the browser is ever used..
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "AdsSettingForIntrusiveAdsSites" /t REG_DWORD /d 2 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "AlternateErrorPagesEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "ClearCachedImagesAndFilesOnExit" /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "DefaultCookiesSetting" /t REG_DWORD /d 4 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "DefaultSearchProviderEnabled" /t REG_DWORD /d "1" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "DefaultSearchProviderName" /t REG_SZ /d "Google" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "DefaultSearchProviderSearchURL" /t REG_SZ /d "https://www.google.com/search?q={searchTerms}" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "DiagnosticData" /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "ExperimentationAndConfigurationServiceControl" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "HideFirstRunExperience" /t REG_DWORD /d "1" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "HubsSidebarEnabled" /t REG_DWORD /d "0" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "InternetExplorerIntegrationLocalFileShowContextMenu" /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "LocalProvidersEnabled" /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "NetworkPredictionOptions" /t REG_DWORD /d 2 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "NewTabPagePrerenderEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "NewTabPageContentEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "PersonalizationReportingEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "ResolveNavigationErrorsUseWebService" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "RestoreOnStartup" /t REG_DWORD /d "4" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "SearchSuggestEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "SearchFiltersEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "ShowHomeButton" /t REG_DWORD /d "1" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "ShowMicrosoftRewards" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "WebWidgetAllowed" /t REG_DWORD /d 0 /f


echo Disabling unnecessary Tasks from Scheduler..
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /Disable
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /Disable
schtasks /change /TN "\Microsoft\Windows\Application Experience\MareBackup" /Disable
schtasks /change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser Exp" /Disable
schtasks /change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /change /TN "\Microsoft\Windows\Application Experience\PcaPatchDbTask" /Disable
schtasks /change /TN "\Microsoft\Windows\Application Experience\PcaWallpaperAppDetect" /Disable
schtasks /change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /change /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /change /TN "\Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /change /TN "\Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /change /TN "\Microsoft\Windows\Maps\MapsUpdateTask" /Disable
schtasks /change /TN "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Disable
schtasks /change /TN "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /Disable
schtasks /change /TN "\Microsoft\XblGameSave\XblGameSaveTask" /Disable
schtasks /change /TN "\RtHDVBg_PushButton" /Disable
schtasks /change /TN "\Microsoft\Office\Office Automatic Updates 2.0" /Disable
schtasks /change /TN "\Microsoft\Office\Office ClickToRun Service Monitor" /Disable
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /Disable
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /Disable
schtasks /change /TN "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable
schtasks /change /TN "\Microsoft\Windows\CloudRestore\Backup" /Disable
schtasks /change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /change /TN "\Microsoft\Windows\International\Synchronize Language Settings" /Disable
schtasks /change /TN "\Microsoft\Windows\Location\Notifications" /Disable
schtasks /change /TN "\Microsoft\Windows\Location\WindowsActionDialog" /Disable
schtasks /change /TN "\Microsoft\Windows\Maps\MapsToastTask" /Disable
schtasks /change /TN "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Disable
schtasks /Change /TN "\Microsoft\Windows\Offline Files\Background Synchronization" /Disable
schtasks /Change /TN "\Microsoft\Windows\Offline Files\Logon Synchronization" /Disable
schtasks /Change /TN "\Microsoft\Windows\Ras\MobilityManager" /Disable
schtasks /Change /TN "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable
schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\User Profile Service\HiveUploadTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /Disable
schtasks /Change /TN "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /Disable
schtasks /Change /TN "\Microsoft\Windows\Wininet\CacheTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Disable
schtasks /Change /TN "\Microsoft\Windows\Workplace Join\Device-Sync" /Disable
schtasks /Change /TN "\Microsoft\Windows\Workplace Join\Recovery-Check" /Disable


echo Disabling Microsoft telemetry and advertising services via registry..
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v "AllowLinguisticDataCollection" /t REG_DWORD /d "0" /f

echo Disabling Microsoft Copilot, AI related, and other Windows Explorer related things..
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableGraphRecentItems" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" /v "DisableSettingsAgent" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" /v "DisableClickToDo" /t REG_DWORD /d "1" /f

echo Prevent the Recall feature from being used to take screenshots every 5 seconds for AI analysis
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" /v "DisableAIDataAnalysis" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WindowsAI" /v "DisableAIDataAnalysis" /t REG_DWORD /d 1 /f

echo Remove the Gallery sidebar icon from File Explorer
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" /ve /d "Gallery" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" /v "HiddenByDefault" /t REG_DWORD /d 1 /f

echo Remove the Home sidebar icon from File Explorer
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "HubMode" /t REG_DWORD /d 1 /f

echo Disable Folder Options "Show recommended section"
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecommendations /t REG_DWORD /d 0 /f

echo Disable Folder Options "include account-based insights, recent, favorite, and recommended files"
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v ShowCloudFilesInQuickAccess /t REG_DWORD /d 0 /f

echo Disable AI feature in new version of Notepad
reg add "HKLM\SOFTWARE\Policies\WindowsNotepad" /v DisableAIFeatures /t REG_DWORD /d 1 /f

echo Disabling Synchronization of Language Settings scheduled task..
schtasks /change /tn "\Microsoft\Windows\International\Synchronize Language Settings" /disable

echo Disable Rotation sensor
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SensorService" /v Start /t REG_DWORD /d 4 /f

echo Disabling Automatic Updates and Sending of anonymous log.
reg add HKLM\Software\Policies\RealVNC\vncserver /v "EnableAnalytics" /t REG_DWORD /d "0" /f
reg add HKLM\Software\Policies\RealVNC\vncserver /v "EnableAutoUpdateChecks" /t REG_DWORD /d "0" /f

echo Windows 11 Multitasking feature Snap Assist Flyout and Snap Bar disable
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableSnapAssistFlyout" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapAssist" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableSnapBar" /t REG_DWORD /d 0 /f

echo Disable Task View
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowTaskViewButton /t REG_DWORD /d 0 /f

echo Change Start menu layout to show More pins
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Start_Layout /t REG_DWORD /d 1 /f

echo Disable the setting to show recommendations for tips, shortcuts, new apps and more
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Start_IrisRecommendations /t REG_DWORD /d 0 /f

echo Disable Search icon in taskbar since start menu already provides search method as well
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f


echo Removing Unwanted Appx Packages from current Users..
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'AppUp.IntelGraphicsExperience'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.BingNews'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.BingSearch'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.BingWeather'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.Copilot'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.Edge.GameAssist'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.GamingApp'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.MicrosoftOfficeHub'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.MicrosoftSolitaireCollection'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.OutlookForWindows'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.PowerAutomateDesktop'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.StartExperiencesApp'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.Wallet'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.WidgetsPlatformRuntime'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.Windows.DevHome'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.Windows.ParentalControls'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.WindowsMaps'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.Xbox.TCUI'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.XboxGameCallableUI'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.XboxGamingOverlay'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.XboxIdentityProvider'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.XboxSpeechToTextOverlay'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.YourPhone'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.ZuneMusic'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'MicrosoftCorporationII.MicrosoftFamily'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'MicrosoftCorporationII.QuickAssist'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'MicrosoftWindows.Client.WebExperience'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'MicrosoftWindows.CrossDevice'} | Remove-AppxPackage -AllUsers"

echo Removing Unwanted Appx Packages from the OS..
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'AppUp.IntelGraphicsExperience'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.BingNews'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.BingSearch'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.BingWeather'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.Copilot'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.Edge.GameAssist'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.GamingApp'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.MicrosoftOfficeHub'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.MicrosoftSolitaireCollection'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.OutlookForWindows'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.PowerAutomateDesktop'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.StartExperiencesApp'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.Wallet'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.WidgetsPlatformRuntime'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.Windows.DevHome'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.Windows.ParentalControls'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.WindowsMaps'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.Xbox.TCUI'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.XboxGamingOverlay'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.XboxIdentityProvider'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.XboxSpeechToTextOverlay'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.YourPhone'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.ZuneMusic'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MicrosoftCorporationII.MicrosoftFamily'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MicrosoftCorporationII.QuickAssist'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MicrosoftWindows.Client.WebExperience'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MicrosoftWindows.CrossDevice'} | Remove-AppxProvisionedPackage -Online"


echo Set Registry for Windows Update Auto Download and Notify at 11AM Every Sunday
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallDay /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallTime /t REG_DWORD /d 11 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f


echo Adding registry key for Consent Prompt Admin..
reg add HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 1 /f

echo Adding the registry key to disable Win11 context-menu..
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

echo Setting current user taskbar alignment to left..
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /f

echo Restarting Windows Explorer..
taskkill /f /im explorer.exe
start explorer.exe

echo Deleting Windows Temp files.. and startup cleanup..
del /F /S /Q %systemroot%\Temp\*

REM Reboot system
echo Script finished.. you should restart the computer to make sure all registry settings take effect..
set /p rebootnow="Reboot now? (y/n then press enter) " %=%
if /i %rebootnow%==y (shutdown -r -t 05) else (echo Reboot aborted. Make sure to manually reboot when you can.)
