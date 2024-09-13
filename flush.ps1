# Clear the DNS client cache
Clear-DnsClientCache

# Reset the LAN adapter
$adapterName1 = "Ethernet"
#$adapterName2 = "Wi-Fi"
Restart-NetAdapter -Name $adapterName1
#Restart-NetAdapter -Name $adapterName2