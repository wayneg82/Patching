# This script will stop relevant services/tasks in preperation for final image sealing with BISF

# Stop and Disable Services
Write-Host "Stopping and Disabling Services"
Stop-Service -Name bits
Stop-Service -Name wuauserv
Stop-Service -Name ClickToRunSvc
Stop-Service -Name AdobeARMservice
Set-Service -Name bits -StartupType Disabled
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
Disable-ScheduledTask -TaskPath "Microsoft\Windows\Maintenance" -TaskName "WinSAT"

# Clean up Image
#Write-Host "Cleaning up Image"
#Remove-Item -Path "C:\Users\Public\Desktop\*" -Recurse -Force
#Remove-Item -Path $Env:TEMP\* -Recurse -Force
#Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force
#Remove-Item -Path "C:\Windows\SoftwareDistribution\*" -Recurse -Force

# Set Execution Policy
# Write-Host "Setting PowerShell Execution Policy to Restricted"
# Set-ExecutionPolicy Restricted -Force
