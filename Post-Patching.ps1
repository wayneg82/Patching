# This script will stop relevant update services/tasks in preperation for image sealing

# Stop and Disable Services
Write-Host "Stopping and Disabling Services"
Stop-Service -Name wuauserv
Stop-Service -Name ClickToRunSvc
Stop-Service -Name AdobeARMservice
Set-Service -Name wuauserv -StartupType Disabled
Set-Service -Name ClickToRunSvc -DisplayName "Microsoft Office Click-to-Run Service" -StartupType Disabled
Set-Service -Name gupdate -DisplayName "Google Update Service (gupdate)" -StartupType Disabled
Set-Service -Name gupdatem -DisplayName "Google Update Service (gupdatem)" -StartupType Disabled
Set-Service -Name edgeupdate -DisplayName "Microsoft Edge Update Service (edgeupdate)" -StartupType Disabled
Set-Service -Name edgeupdatem -DisplayName "Microsoft Edge Update Service (edgeupdatem)" -StartupType Disabled
Set-Service -Name AdobeARMservice -DisplayName "Adobe Acrobat Update Service" -StartupType Disabled

# Disable Scheduled Tasks
Write-Host "Disabling Scheduled Tasks"
Disable-ScheduledTask -TaskName "Adobe Acrobat Update Task"
Disable-ScheduledTask -TaskName "GoogleUpdateTaskMachineCore"
Disable-ScheduledTask -TaskName "GoogleUpdateTaskMachineUA"
Disable-ScheduledTask -TaskName "MicrosoftEdgeUpdateTaskMachineCore"
Disable-ScheduledTask -TaskName "MicrosoftEdgeUpdateTaskMachineUA"
# Disable-ScheduledTask -TaskPath "Microsoft\Windows\Maintenance" -TaskName "WinSAT"

[System.Windows.MessageBox]::Show('Updates disabled, please proceed with sealing tasks')
