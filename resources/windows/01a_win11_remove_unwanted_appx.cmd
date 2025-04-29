@echo off
REM 04.10.2025.EA
REM Remove Appx Packages that are unwanted and just take up system resources for every user that logs in.
cls

REM Remove Appx Packages from current Users..
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.BingNews'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.BingSearch'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.BingWeather'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.Copilot'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.GamingApp'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.MicrosoftOfficeHub'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.MicrosoftSolitaireCollection'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.OutlookForWindows'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.PowerAutomateDesktop'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.Wallet'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.WidgetsPlatformRuntime'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.Windows.ParentalControls'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.Xbox.TCUI'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.XboxGameCallableUI'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.XboxGamingOverlay'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.XboxIdentityProvider'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.XboxSpeechToTextOverlay'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.YourPhone'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'Microsoft.ZuneMusic'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'MicrosoftCorporationII.QuickAssist'} | Remove-AppxPackage -AllUsers"
powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq 'MicrosoftWindows.Client.WebExperience'} | Remove-AppxPackage -AllUsers"


REM Remove Appx Packages from the OS..
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.BingNews'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.BingSearch'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.BingWeather'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.Copilot'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.GamingApp'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.MicrosoftOfficeHub'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.MicrosoftSolitaireCollection'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.OutlookForWindows'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.PowerAutomateDesktop'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.Wallet'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.WidgetsPlatformRuntime'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.Windows.DevHome'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.Windows.ParentalControls'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.Xbox.TCUI'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.XboxGamingOverlay'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.XboxIdentityProvider'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.YourPhone'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'Microsoft.ZuneMusic'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MicrosoftCorporationII.QuickAssist'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MicrosoftWindows.Client.WebExperience'} | Remove-AppxProvisionedPackage -Online"
powershell.exe -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MicrosoftWindows.CrossDevice'} | Remove-AppxProvisionedPackage -Online"

echo Done.
pause
exit