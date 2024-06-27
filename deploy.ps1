$global:SLN_NAME = "GChainVsOpen"
$global:BASE_PATH = "C:\Dev\GCHAIN2024"


$global:REBUILD_FLAG = $false
if ($args[0] -eq "--fc") { $global:REBUILD_FLAG = $true}

$global:BD_Date = Get-Date -Format "YYMMddHHmm"
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

function Execute_Build_n_Deploy {
    dotnet publish "Server/Server.fsproj" -o "Server/bin/Publish/$global:FOLDER_HASH"

    if ($LASTEXITCODE -ne 0) {
        Write-Output "Publish failed."
        exit 1
    }


    Write-Output "Publish succeeded to folder $FOLDER_HASH."

    $pathPattern = "$global:SLN_PATH\Server\bin\Publish\*\server.exe"
    $processes = Get-Process | Where-Object { $_.MainModule.FileName -like $pathPattern }
    foreach ($process in $processes) {
        Stop-Process -Id $process.Id -Force
    }

    if ($LASTEXITCODE -ne 0) {
        Write-Output "Failed to kill Server.exe process or process not found."
    } else {
        Write-Output "killed Server.exe Successfully."
    }
    $publishpath = "$global:SLN_PATH\Server\bin\Publish\$global:FOLDER_HASH"
    Start-Process powershell -ArgumentList  "-NoExit -Command cd $publishpath; .\server.exe"
    Write-Output "restart Server.exe"
}
cd $publishpath

Write-Output "====Common===="
Set-Location "C:\Dev\Common"
Fetch_Compare_Pull

Write-Output "====JCS===="
Set-Location "C:\Dev\JCS"
Fetch_Compare_Pull

Write-Output "====$global:SLN_NAME===="
Set-Location $global:SLN_PATH
Fetch_Compare_Pull

$global:FOLDER_HASH = $global:BD_Date + "_" + $global:LATEST_COMMIT.Substring(0, 7)

Write-Output "====REBUILD===="
if ($global:REBUILD_FLAG) {
    Write-Output "Commit: $global:LATEST_COMMIT Build..."
    Execute_Build_n_Deploy
} else {
    Write-Output "Commit: $global:LATEST_COMMIT Same. Exit."
}





Write-Output "=======DEPLOY FIN======="