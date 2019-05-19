# When needing to update a windows computer.
# This script will get find the Windows Update service and start the process if it is not running.
# If the process is running and updates are completed, then the script will stop the service once it is run again.

$service = Get-service -Name wuauserv

if($service.Status -eq 'Running')
{
    Get-Service $service.Name | stop-service
    [System.Console]::Beep()
    Write-host `n "Windows Update service stopped"
}
elseif ($service.Status -eq 'Stopped')
{
    Get-Service $service.Name | start-service
    [System.Console]::Beep()
    Write-host `n "Windows Update service started"
}
else
{
    Write-host `n "Nothing to start"
}