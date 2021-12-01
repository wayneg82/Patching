# Enables Relevant services to enable patching of Windows and MS Office
# Requires the Windows Update PowerShell Module - https://www.powershellgallery.com/packages/PSWindowsUpdate/2.2.0.2

# Enable and Start Services
Write-Host "Enabling and Starting Services"
Set-Service -Name bits -StartupType Automatic
Set-Service -Name wuauserv -StartupType Automatic
Set-Service -Name ClickToRunSvc -DisplayName "Microsoft Office Click-to-Run Service" -StartupType Automatic
Start-Service -Name bits
Start-Service -Name wuauserv
Start-Service -Name ClickToRunSvc
Start-Service -Name AdobeARMservice

# Update Microsoft Edge
# Write-Host "Updating Microsoft Edge"
#

# Update Windows
Write-Host "Updating Windows"
Import-Module PSWindowsUpdate
Get-WUInstall -Install -AcceptAll -IgnoreReboot

# Update Microsoft Office
Write-Host "Updating Microsoft Office"
cd "C:\Program Files\Common Files\microsoft shared\ClickToRun"
.\OfficeC2RClient.exe /update user displaylevel=false forceappshutdown=true

# Sleep for 5 minutes before proceeding with the next task
Write-Host "Waiting for operation to complete"
Start-Sleep -s 300
