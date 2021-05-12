$serverlist=get-content D:\scripts\servers.txt  
write-output "Server,RAM,Pagefile" 
 
foreach ($server in $serverlist) { 
 
 $physicalmem=get-wmiobject -computer $server Win32_ComputerSystem | % {$_.TotalPhysicalMemory} 
 $Physicalmem=[math]::round($physicalmem/1MB,0) 
 $Pagefilesize=get-wmiobject -computer $server Win32_pagefileusage | % {$_.AllocatedBaseSize} 
 Write-Output "$server,$physicalmem,$pagefilesize" 
 
} 