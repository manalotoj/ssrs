#
# powershell script to deploy zip file to inetpub root directory
#

# create install folder if it does not already exist
$folderPath = "c:\install"
if (-not (Test-Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath | Out-Null
    Write-Host "Folder created at: $folderPath"
}
else {
    Write-Host "Folder already exists at: $folderPath"
}

# download install file
$filePath = "$folderPath\File.zip"
$url = "https://github.com/manalotoj/ssrs/raw/main/deploy.zip"
Invoke-WebRequest -Uri $url -outFile $filePath

# unblock and unzip install file
$destinationPath = "C:\inetpub\wwwroot"
Unblock-File -Path $filePath
Expand-Archive -Path $filePath -DestinationPath $destinationPath -Force
