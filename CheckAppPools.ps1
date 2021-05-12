Function CheckAppPools
{
$Computers = Get-Content -path "D:\scripts\servers.txt"

ForEach($Computer in $Computers)
{
"Checking Computer $Computer"
Invoke-Command -ComputerName $Computer -ScriptBlock {Import-Module WebAdministration; Get-ChildItem -path IIS:\AppPools\ | where{($_.state -ne 'Started') -and ($_.Name  -notlike "Empower*") -and ($_.Name  -notlike "LOSWeb") -and ($_.Name  -notlike "PostResponseServices") -and ($_.Name  -notlike ".NET*") -and ($_.Name  -notlike "ASP.NET*")} | Format-Table}
}
""
Write-Host "If no results returned, all App Pools are running." -ForegroundColor Yellow
"" 
}
CheckAppPools