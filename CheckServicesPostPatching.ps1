Function CheckServices
{
$Computers = Get-Content -path "D:\scripts\AllLOSAppServer.txt"

ForEach($Computer in $Computers)
{
"Checking Computer $Computer"
Get-Service -Name emp* -ComputerName $Computer | where {($_.Status -notlike "Running") -and ($_.StartType -eq "Automatic")} |select-object status,starttype,displayname | ft -AutoSize
Get-Service -Name sun* -ComputerName $Computer | where {($_.Status -notlike "Running") -and ($_.StartType -eq "Automatic")} |select-object status,starttype,displayname | ft -AutoSize
Get-Service -Name citi* -ComputerName $Computer | where {($_.Status -notlike "Running") -and ($_.StartType -eq "Automatic")} |select-object status,starttype,displayname | ft -AutoSize
}
""
Write-Host "If no results returned, all automatic empower services are running." -ForegroundColor Yellow
"" 
}
CheckServices
Pause