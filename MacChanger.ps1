foreach($line in [System.IO.File]::ReadLines("***filename containing MAC addressess***"))
{
    #Echo "Setting Adapter to MAC address $line"
    $ethname = "Ethernet 3" //change to the correct addapter
    Set-NetAdapter -Name "Ethernet 3" -MacAddress $line -Confirm:$false
    Restart-NetAdapter -Name $ethname
    Start-Sleep -Seconds 50
    $ip = (Get-NetIPAddress -InterfaceAlias $ethname -AddressFamily IPv4).IPv4Address
    if($ip.Split(".")[0] -ne "169"){
        Write-Host "Issued IP Address $ip for MAC address : $line" -ForegroundColor RED
        }
 }
