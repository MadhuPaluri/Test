Function CheckDiskSpace
{
$Computers = Get-Content -path "D:\scripts\servers.txt"
ForEach($Computer in $Computers)
{
"Checking Computer $Computer"
Invoke-Command -ComputerName $Computer -ScriptBlock {Get-PSDrive C,D | select Name, @{n= 'Used(GB)' ; e = {"{0:N2}" -f ($_.used/1GB)}}, @{n= 'Free(GB)' ; e = {"{0:N2}" -f ($_.Free/1GB)}}, @{n= 'Total(GB)' ; e = {"{0:N2}" -f (($_.used + $_.Free)/1GB)}}} | ft -auto
}
""
Write-Host "Disk Space" -ForegroundColor Yellow
"" 
}
CheckDiskSpace