
@echo off
setlocal
set FORCE_FLAG=0
set SLN_PATH="C:\Dev\GCHAIN2024\GChainVsOpen"
if "%~1"=="--fc" set FORCE_FLAG=1


echo Change DIR to %SLN_PATH%
cd /d %SLN_PATH%

echo git reset fetch
git reset --hard HEAD
git fetch origin


for /f %%i in ('git rev-parse origin/main') do set LATEST_COMMIT=%%i
for /f %%i in ('git rev-parse HEAD') do set CURRENT_COMMIT=%%i
SET FOLDER_HASH=%LATEST_COMMIT:~0,7%

if "%FORCE_FLAG%"=="1" (
    goto Force_Execute
) else (
    if "%LATEST_COMMIT%" neq "%CURRENT_COMMIT%" (
        echo Commits not same  OLD: %CURRENT_COMMIT% - NEW: %LATEST_COMMIT%
        goto Execute_Build_n_Deploy
    ) else (
        echo Commits:%CURRENT_COMMIT% same.
    )
)
goto End_Script

:Force_Execute
echo Force flag (--fc) detected. Executing commands unconditionally.

:Execute_Build_n_Deploy
echo git pull
git pull origin main
cd Server
echo Build
dotnet publish Server.fsproj -o "bin/Publish/%FOLDER_HASH%"

IF ERRORLEVEL 1 (
    echo Publish failed.
    exit /b 1
)
echo Publish succeeded to folder %FOLDER_HASH%.

taskkill /f /im Server.exe
IF ERRORLEVEL 1 (
    echo Failed to kill Server.exe process or process not found.
) else (
    echo killed Server.exe Suc
)


cd bin/Publish/%FOLDER_HASH%
echo Change DIR to %FOLDER_HASH%

start "Server" cmd /k "cd /d %SLN_PATH%/Server/bin/Publish/%FOLDER_HASH% && Server.exe"
echo restart Server.exe


:End_Script
@echo =======DEPLOY FIN=======
endlocal