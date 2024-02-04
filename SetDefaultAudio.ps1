#Powershell module AudioDeviceCmdlets is needed for sciprt to run, run lines 2 & 3 to install module
#    Install-Module -Name AudioDeviceCmdlets -Force -Verbose  
#    get-module -Name "AudioDeviceCmdlets" -ListAvailable | Sort-Object Version | select -last 1 | Import-Module -Verbose

$audiomodule = Get-InstalledModule -Name AudioDeviceCmdlets -ErrorAction SilentlyContinue
if (!$audiomodule)
{
    Install-Module -Name AudioDeviceCmdlets -Force -AllowClobber
    Import-Module -Name AudioDeviceCmdlets
}
else
{
    $importedmodle = Get-Module -Name AudioDeviceCmdlets
    if (!$importedmodle)
    {
        Import-Module -Name AudioDeviceCmdlets
    }
}

#Check the default playback audio device and will set it if incorrect
if ((Get-AudioDevice -Playback).Name -eq "Wave Link System (Elgato Wave:3)")
{
    Write-Host "Default Output Device is set to "(Get-AudioDevice -Playback).Name -ForegroundColor Green
}
else
{
    Write-Host "Default Output Device is not set to "(Get-AudioDevice -Playback).Name -ForegroundColor Yellow
    Get-AudioDevice -List | where Type -like "Playback" | where name -like "Wave Link System (Elgato Wave:3)"  | Set-AudioDevice
    Write-Host "Default Output Device has been set to "(Get-AudioDevice -Playback).Name -ForegroundColor Cyan
}

#Check the Input Communication audio device and will set it if incorrect
if ((Get-AudioDevice -RecordingCommunication).Name -eq "Wave Link MicrophoneFX (Elgato Wave:3)")
{
      Write-Host "Default Input Communication Device is set to "(Get-AudioDevice -RecordingCommunication).Name -ForegroundColor Green  
}
else
{
    Write-Host "Default Input Communication Device is not set to "(Get-AudioDevice -RecordingCommunication).Name -ForegroundColor Yellow 
    Get-AudioDevice -List | where Type -like "Recording" | where name -EQ "Wave Link MicrophoneFX (Elgato Wave:3)"  | Set-AudioDevice
    Write-Host "Default Input Communication Device has been set to "(Get-AudioDevice -RecordingCommunication).Name -ForegroundColor Cyan  
}

#Check the Input audio device and will set it if incorrect
if ((Get-AudioDevice -Recording).Name -eq "Wave Link MicrophoneFX (Elgato Wave:3)")
{
      Write-Host "Default Input Device is set to "(Get-AudioDevice -RecordingCommunication).Name -ForegroundColor Green  
}
else
{
    Write-Host "Default Input Device is not set to "(Get-AudioDevice -RecordingCommunication).Name -ForegroundColor Yellow 
    Get-AudioDevice -List | where Type -like "Recording" | where name -EQ "Wave Link MicrophoneFX (Elgato Wave:3)"  | Set-AudioDevice
    Write-Host "Default Input Device has been set to "(Get-AudioDevice -RecordingCommunication).Name -ForegroundColor Cyan  
}

#Check  if default playback audio device is muted if so it will unmute
if ( (Get-AudioDevice -PlaybackMute) -eq $false)
{
      Write-Host "Default Output Device is not muted" -ForegroundColor Green  
}
else
{
    Write-Host "Default Output Device is muted" -ForegroundColor Yellow
    Set-AudioDevice -PlaybackMute $false
    Write-Host "Default Output Device is now unmuted" -ForegroundColor Cyan  
}

#Check  if Default Input Communication device is muted if so it will unmute
if ( (Get-AudioDevice -RecordingCommunicationMute) -eq $false)
{
      Write-Host "Default Input Communication Device is not muted" -ForegroundColor Green  
}
else
{
    Write-Host "Default Input Communication Device is muted" -ForegroundColor Yellow  
    Set-AudioDevice -RecordingCommunicationMute $false
    Write-Host "Default Input Communication Device is now unmuted" -ForegroundColor Cyan  
}


#Check  if Default Input device is muted if so it will unmute
if ( (Get-AudioDevice -RecordingMute) -eq $false)
{
      Write-Host "Default Input Device is not muted" -ForegroundColor Green  
}
else
{
    Write-Host "Default Input Device is muted" -ForegroundColor Yellow  
    Set-AudioDevice -PlaybackMute $false
    Write-Host "Default Input Device is now unmuted" -ForegroundColor Cyan  
}


if ((Get-Process -Name WaveLink -ErrorAction SilentlyContinue).ProcessName -eq 'WaveLink')
{
    Write-Host "WaveLink is running" -ForegroundColor Green
}
else
{
    Write-Host "WaveLink is not running" -ForegroundColor Yellow
    Start-Process "C:\Program Files\Elgato\WaveLink\WaveLink.exe"
    Write-Host "WaveLink is now running" -ForegroundColor Cyan
}
