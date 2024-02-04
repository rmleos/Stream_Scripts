$Userinput = $null
$ScriptRan = $false
if (-Not (Get-Module -ListAvailable -Name 'AudioDeviceCmdlets')) {Install-Module -Name AudioDeviceCmdlets}
$PlaybackDevices = Get-AudioDevice -List | Where-Object {$_.Type -like "Playback"}
$RecordingDevices = Get-AudioDevice -List | Where-Object {$_.Type -like "Recording"}
do
{
    if ($ScriptRan -eq $false)
    {
        do
        {
            $Userinput = $null
            clear
            Write-Host("Please choose which audio device would you like to change:")
            Write-Host("1. Playback Device")
            Write-Host("2. Recording Device")
            Write-Host("")
            [int32]$Userinput = Read-Host
        }
        while ($Userinput -gt 2 -or $Userinput -le 0)

        if ($Userinput -eq 1)
        {
            $Userinput = $null
            $LowestIndex = $PlaybackDevices[0].Index
            $HighestIndex = $PlaybackDevices[$PlaybackDevices.Length -1].Index
            while ($Userinput -gt $HighestIndex -or $Userinput -lt $LowestIndex)
            {
                clear
                Write-Host("Please type the device index you want to use")
                for ($i = 0 ; $i -lt $PlaybackDevices.Length ; $i++)
                {
                    $CurrentDeviceIndex = $(Get-AudioDevice -List | Where-Object {$_.name -Like $PlaybackDevices[$i].name}).index
                    Write-Host($($CurrentDeviceIndex).ToString() + ". " + $($PlaybackDevices[$i]).name)
                }
                Write-Host("")
                [int32]$Userinput = Read-Host
            }
            Set-AudioDevice -Index $Userinput
            $Userinput = $null
        } 

        elseif ($Userinput -eq 2)
        {
            $Userinput = $null
            $LowestIndex = $RecordingDevices[0].Index
            $HighestIndex = $RecordingDevices[$RecordingDevices.Length -1].Index
            while ($Userinput -gt $HighestIndex -or $Userinput -lt $LowestIndex)
            {
                clear
                Write-Host("Please type the device index you want to use")
                for ($i = 0 ; $i -lt $RecordingDevices.Length ; $i++)
                {
                    $CurrentDeviceIndex = $(Get-AudioDevice -List | Where-Object {$_.name -Like $RecordingDevices[$i].name}).index
                    Write-Host($($CurrentDeviceIndex).ToString() + ". " + $($RecordingDevices[$i]).name)
                }
                Write-Host("")
                [int32]$Userinput = Read-Host
            }
            Set-AudioDevice -Index $Userinput
        }
    }
    $ScriptRan = $true
    $Userinput = $null
    clear
    Write-Host("Please choose what to do next:")
    Write-Host("1. Run the script again")
    Write-Host("2. Exit")
    Write-Host("")
    [int32]$Userinput = Read-Host
    if ($Userinput -eq 1)
    {
        $ScriptRan = $false
    }
}
while ($Userinput -eq 1)