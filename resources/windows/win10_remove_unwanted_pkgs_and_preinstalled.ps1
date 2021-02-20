Get-AppxPackage -allusers Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsMaps | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Wallet* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Xbox* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.YourPhone* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Zune* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.People* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Windows.ParentalControls* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Print3D* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Advertising.* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Microsoft3DViewer* | Remove-AppxPackage
Get-AppxPackage -allusers *getstarted* | Remove-AppxPackage
Get-AppxPackage -allusers *messaging* | Remove-AppxPackage
Get-AppxPackage -allusers *commsphone* | Remove-AppxPackage
Get-AppxPackage -allusers *windowsphone* | Remove-AppxPackage
Get-AppxPackage -allusers *sway* | Remove-AppxPackage
Get-AppxPackage -allusers *phone* | Remove-AppxPackage
Get-AppxPackage -allusers *people* | Remove-AppxPackage
get-appxpackage -allusers *zunemusic* | remove-appxpackage
get-appxpackage -allusers *zunevideo* | remove-appxpackage
get-appxpackage -allusers *bingfinance* | remove-appxpackage
get-appxpackage -allusers *bingnews* | remove-appxpackage
get-appxpackage -allusers *bingsports* | remove-appxpackage
get-appxpackage -allusers *bingweather* | remove-appxpackage
get-appxpackage -allusers *bing* | remove-appxpackage
get-appxpackage -allusers *onenote* | remove-appxpackage
get-appxpackage -allusers *maps* | remove-appxpackage
get-appxpackage -allusers *xbox* | remove-appxpackage
get-appxpackage -allusers *officehub* | remove-appxpackage
get-appxpackage -allusers *3dbuilder* | remove-appxpackage
get-appxpackage -allusers *xbox* | remove-appxpackage

#these are the apps that get installed for every new user that logs in
#so they need to be removed prior to OS image being created

Remove-AppXProvisionedPackage -Online -PackageName DellInc.DellSupportAssistforPCs_3.2.4.0_x64__htrsf667h5kn2
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.GetHelp_10.1706.20381.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.Getstarted_7.3.20251.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.BingWeather_4.28.10351.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.Messaging_2019.125.32.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.Microsoft3DViewer_6.1903.4012.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.MicrosoftOfficeHub_18.1903.1152.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.MicrosoftSolitaireCollection_4.3.4032.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.MixedReality.Portal_2000.19011.1132.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.Office.OneNote_16001.11601.20066.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.OneConnect_5.1902.361.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.People_2019.305.632.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.Print3D_3.3.791.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.SkypeApp_14.42.60.0_neutral_~_kzf8qxf38zg5c
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.Wallet_2.2.18179.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.WindowsMaps_2019.325.2243.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.Xbox.TCUI_1.24.10001.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.XboxApp_44.44.7002.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.XboxGameOverlay_1.40.23001.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.XboxGamingOverlay_2.26.28001.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.XboxIdentityProvider_12.52.24002.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.XboxSpeechToTextOverlay_1.21.13002.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.YourPhone_2019.426.155.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.ZuneMusic_2019.19031.11411.0_neutral_~_8wekyb3d8bbwe
Remove-AppXProvisionedPackage -Online -PackageName Microsoft.ZuneVideo_2019.19031.11411.0_neutral_~_8wekyb3d8bbwe

#this deletes the Delivery Content Suggested Apps to install entire folder
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Subscriptions\" -Name "*"

#this changes a lot of the default windows 10 suggestions and oem apps installs etc
#this is current user registry so need to find 
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "ContentDeliveryAllowed" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "OemPreInstalledAppsEnabled" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "PreInstalledAppsEnabled" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "PreInstalledAppsEverEnabled" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "SilentInstalledAppsEnabled" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "SystemPaneSuggestionsEnabled" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "OemPreInstalledAppsEnabled" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "OemPreInstalledAppsEnabled" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "SubscribedContent-338389Enabled" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "SubscribedContent-338388Enabled" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "SubscribedContent-353696Enabled" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "SubscribedContent-310093Enabled" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "SubscribedContent-338393Enabled" -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "SubscribedContent-353694Enabled" -Value 0

