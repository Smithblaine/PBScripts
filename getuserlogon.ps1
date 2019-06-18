Get-EventLog security | 
Where-Object {$_.TimeGenerated -gt '6/12/19'} | 
Where-Object {($_.InstanceID -eq 4634) -or ($_.InstanceID -eq 4624)} | 
Select-Object Index,machinename,TimeGenerated,InstanceID,Message | 
Export-csv -LiteralPath C:\Users\Ringo\Desktop\test.csv