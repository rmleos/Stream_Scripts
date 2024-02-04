$USBHubs = Get-WmiObject -Class Win32_USBHub
$PowerMgmt = Get-WmiObject -Class MSPower_DeviceEnable -Namespace root\wmi

ForEach ($Hub in $USBHubs) {
    Write-Host
    Write-Host -Object "Checking USB Hub '$($Hub.Name)'..."
    $VarPowerSettings = $PowerMgmt | Where {$_.InstanceName -like "*$($Hub.DeviceID)*"}
    If (($VarPowerSettings | Measure).Count -eq 1) {
        If (($VarPowerSettings | Select -ExpandProperty Enable) -eq $False) {Write-Host -Object "USB Hub '$($Hub.Name)' already has power saving disabled" -ForegroundColor Green}
        Else {
            Try {
                $VarPowerSettings.Enable = $False
                $Null = $VarPowerSettings.psbase.Put()
                Write-Host -Object "Disabled power saving features for USB Hub '$($Hub.Name)'" -ForegroundColor Green
            }
            Catch {Write-Warning -Message "One or more exceptions occurred when trying to set power saving settings for USB Hub '$($Hub.Name)'"}
        }
    }
    ElseIf (($VarPowerSettings | Measure).Count -gt 1) {Write-Warning -Message "More than one WMI object representing power settings was found for '$($Hub.Name)', no settings have been changed for this device"}
    Else {Write-Warning -Message "No power settings were found for '$($Hub.Name)', please check if the device supports power saving features"}
}