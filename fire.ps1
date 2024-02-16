Get-NetFirewallRule -Direction Inbound | Where-Object { $_.LocalPort -eq 3389 -and $_.Enabled -eq "True" } | ForEach-Object {
    $existingAddresses = $_.RemoteAddress
    $newAddresses = $existingAddresses + ",108.61.158.81"
    Set-NetFirewallRule -Name $_.Name -RemoteAddress $newAddresses
}
