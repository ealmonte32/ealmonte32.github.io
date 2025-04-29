@echo off
REM 03.07.2025.EA
REM Clear all HKLM MS Edge policies and then apply specific ones.
cls

REM Check if the computer has already applied this script
if not exist "%programdata%\GAT_Edge_policies" (GOTO GATEDGE) else (exit)

:GATEDGE
REM Deleting HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge
reg delete HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /f

REM reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "AdsSettingForIntrusiveAdsSites" /t REG_DWORD /d 2 /f
REM reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "AlternateErrorPagesEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "ClearCachedImagesAndFilesOnExit" /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "DefaultCookiesSetting" /t REG_DWORD /d 4 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "DefaultSearchProviderEnabled" /t REG_DWORD /d "1" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "DefaultSearchProviderName" /t REG_SZ /d "Google" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "DefaultSearchProviderSearchURL" /t REG_SZ /d "https://www.google.com/search?q={searchTerms}" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "DiagnosticData" /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d 0 /f
REM reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "ExperimentationAndConfigurationServiceControl" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "HideFirstRunExperience" /t REG_DWORD /d "1" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "HubsSidebarEnabled" /t REG_DWORD /d "0" /f
REM reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "InternetExplorerIntegrationLocalFileShowContextMenu" /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "LocalProvidersEnabled" /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "NetworkPredictionOptions" /t REG_DWORD /d 2 /f
REM reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "NewTabPagePrerenderEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "NewTabPageContentEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "PersonalizationReportingEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "ResolveNavigationErrorsUseWebService" /t REG_DWORD /d 0 /f
REM reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "RestoreOnStartup" /t REG_DWORD /d "4" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "SearchSuggestEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "SearchFiltersEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "ShowHomeButton" /t REG_DWORD /d "1" /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "ShowMicrosoftRewards" /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge /v "WebWidgetAllowed" /t REG_DWORD /d 0 /f
echo GAT Edge Policies applied > "%programdata%\GAT_Edge_policies"
exit