# Enables Relevant services to enable patching of Windows and MS Office

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
