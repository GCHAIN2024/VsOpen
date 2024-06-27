$global:REBUILD_FLAG = $false
if ($args[0] -eq "--fc") { $global:REBUILD_FLAG = $true}
$SLN_PATH = "C:\Dev\GCHAIN2024\GChainVsOpen"

function Fetch_Compare_Pull {
    Write-Output "git reset fetch"
    git reset --hard HEAD
    git fetch origin

    $LATEST_COMMIT = git rev-parse origin/main
    $CURRENT_COMMIT = git rev-parse HEAD
    if ($LATEST_COMMIT -ne $CURRENT_COMMIT) {
        $global:REBUILD_FLAG = $true
    }
    git pull origin main
}

Write-Output "git fetches"
Set-Location "C:\Dev\Common"
Fetch_Compare_Pull

Write-Output "git pull JCS"
Set-Location "C:\Dev\JCS"
Fetch_Compare_Pull

Write-Output "Change DIR to $SLN_PATH"
Set-Location $SLN_PATH
Fetch_Compare_Pull

$FOLDER_HASH = $LATEST_COMMIT.Substring(0, 7)


if ($global:REBUILD_FLAG) {
    Write-Output "New Commits"
    # Execute_Build_n_Deploy
} else {
    Write-Output "Commits: $CURRENT_COMMIT same."
}




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