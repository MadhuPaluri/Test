Function CheckCerts
{
$Computers = Get-Content -path "D:\scripts\prodapps.txt"
ForEach($Computer in $Computers)
{
#"Checking Computer $Computer"
Invoke-Command -ComputerName $Computer -ScriptBlock {
$rootthumb = "d69b561148f01c77c54578c10926df5b856976ad"
$interthumb = "ef90b2b86f4756ebe7d36ff3015d63523a0076e9"
$root = [bool](dir cert:\LocalMachine\root  | where {$_.Thumbprint -eq $rootthumb})
$intermediate = [bool](dir cert:\LocalMachine\ca  | where {$_.Thumbprint -eq $interthumb})
Write-Host $Env:Computername " has root cert with thumbprint         " $rootthumb ":" $root
Write-Host $Env:Computername " has intermediate cert with thumbprint " $interthumb ":" $intermediate
Write-Host ""
}
}
""
Write-Host "Check GlobalSign Root and Intermediate" -ForegroundColor Yellow
"" 
}
CheckCerts
