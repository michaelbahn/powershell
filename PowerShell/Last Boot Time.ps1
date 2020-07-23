
cls

Function Get-LastBootUpTime { 

$servers = gc  'D:\Powershell-Production-scripts\Scripts\Server-REBOOT.txt'

$ErrorActionPreference = 'Stop' 

Foreach ($server in $servers) {

Try 
{
Get-CimInstance -ClassName win32_operatingsystem  -Property *  -ComputerName $server | select csname, lastbootuptime  | FT -AutoSize  
}

    Catch 
        {

    Write-Warning "System is not reachable : $server" 

        }

    }
}

Get-LastBootUpTime 







