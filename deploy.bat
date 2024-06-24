
@echo off
setlocal
set FORCE_FLAG=0
set SLN_PATH="C:\Dev\GCHAIN2024\GChainVsOpen"
if "%~1"=="--fc" set FORCE_FLAG=1


echo Change DIR to %SLN_PATH%
cd /d %SLN_PATH%

echo git reset & git fetch
git reset --hard HEAD
git fetch origin


for /f %%i in ('git rev-parse origin/main') do set LATEST_COMMIT=%%i
for /f %%i in ('git rev-parse HEAD') do set CURRENT_COMMIT=%%i

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
echo git pull & to Server folder & Build
git pull origin main
cd Server
dotnet publish Server.fsproj -o "bin/Publish/%LATEST_COMMIT%"

IF ERRORLEVEL 1 (
    echo Publish failed.
    exit /b 1
)
echo Publish succeeded to folder %LATEST_COMMIT%.

taskkill /f /im Server.exe
IF ERRORLEVEL 1 (
    echo Failed to kill Server.exe process or process not found.
) else (
    echo killed Server.exe Suc
)


cd bin/Publish/%LATEST_COMMIT%
echo Change DIR to %LATEST_COMMIT%

start "Server%LATEST_COMMIT%" cmd /k "C:\Dev\GCHAIN2024\GChainVsOpen\Server\bin\Publish\%commitHash%\Server.exe"
echo restart Server.exe


:End_Script
@echo =======DEPLOY FIN=======
endlocal