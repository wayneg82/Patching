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

[System.Windows.MessageBox]::Show('Please proceed with patching')
