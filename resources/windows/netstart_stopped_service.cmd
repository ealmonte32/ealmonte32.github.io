for /F "tokens=3 delims=: " %%H in ('sc query AnyDesk Service ^| findstr "STATE"') do (
if /I "%%H" NEQ "RUNNING" (net start "AnyDesk Service")
)