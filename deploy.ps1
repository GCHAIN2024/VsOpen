$global:REBUILD_FLAG = $false
if ($args[0] -eq "--fc") { $global:REBUILD_FLAG = $true}

$global:BD_Date = Get-Date -Format "MMddHHmm"
$global:BASE_PATH = "C:\Dev\GCHAIN2024"
$global:SLN_NAME = "GChainVsOpen"
$global:SLN_PATH = $global:BASE_PATH + "\" + $global:SLN_NAME
$global:LATEST_COMMIT=""
$global:CURRENT_COMMIT=""

function Fetch_Compare_Pull {
    git reset --hard HEAD
    git fetch origin

    $global:LATEST_COMMIT = git rev-parse origin/main
    $global:CURRENT_COMMIT = git rev-parse HEAD
    if ($global:LATEST_COMMIT -ne $global:CURRENT_COMMIT) {
        $global:REBUILD_FLAG = $true
        git pull origin main
    } 
}

Write-Output "====Common===="
Set-Location "C:\Dev\Common"
Fetch_Compare_Pull

Write-Output "====JCS===="
Set-Location "C:\Dev\JCS"
Fetch_Compare_Pull

Write-Output "====$global:SLN_NAME===="
Set-Location $global:SLN_PATH
Fetch_Compare_Pull

$global:FOLDER_HASH = $global:BD_Date+$global:LATEST_COMMIT.Substring(0, 7)


if ($global:REBUILD_FLAG) {
    Write-Output "Commit: $global:LATEST_COMMIT New."
    # Execute_Build_n_Deploy
} else {
    Write-Output "Commit: $global:LATEST_COMMIT Same."
}

Write-Output $global:FOLDER_HASH


function Execute_Build_n_Deploy {
    Write-Output "git pull"
    git pull origin main
    Set-Location "Server"
    Write-Output "Build"
    dotnet publish Server.fsproj -o "bin/Publish/$FOLDER_HASH"

    if ($LASTEXITCODE -ne 0) {
        Write-Output "Publish failed."
        exit 1
    }
    Write-Output "Publish succeeded to folder $FOLDER_HASH."

    # 结束 Server.exe 进程
    taskkill /f /im Server.exe

    if ($LASTEXITCODE -ne 0) {
        Write-Output "Failed to kill Server.exe process or process not found."
    } else {
        Write-Output "killed Server.exe Successfully."
    }

    Set-Location "bin/Publish/$FOLDER_HASH"
    Write-Output "Change DIR to $FOLDER_HASH"
    Start-Process -FilePath "Server.exe" -ArgumentList ""
    Write-Output "restart Server.exe"
}

Write-Output "=======DEPLOY FIN======="