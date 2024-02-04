#Stops all Zoom processes
$zoomprocess = Get-Process -Name 'Zoom' -ErrorAction SilentlyContinue
if (!!$zoomprocess)
{
    Write-Host "Zoom is runing" -ForegroundColor Yellow
    do
    {
        Stop-Process -Name 'Zoom' -ErrorAction SilentlyContinue
        $zoomprocess = Get-Process -Name 'Zoom' -ErrorAction SilentlyContinue
    }
    until (!$zoomprocess)
    write-Host "Zoom is not running" -ForegroundColor Green
}
else
{
    write-Host "Zoom is not running" -ForegroundColor Green
}

#Stops all Teams processes
$teamsprocess = Get-Process -Name 'Teams' -ErrorAction SilentlyContinue
if (!!$teamsprocess)
{
    Write-Host "Teams is runing" -ForegroundColor Yellow
    do
    {
        Stop-Process -Name 'Teams' -ErrorAction SilentlyContinue
        $teamsprocess = Get-Process -Name 'Teams' -ErrorAction SilentlyContinue
    }
    until (!$teamsprocess)
    write-Host "Teams is not running" -ForegroundColor Green
}
else
{
    write-Host "Teams is not running" -ForegroundColor Green
}

#Stops all Slack processes
$Slackprocess = Get-Process -Name 'Slack' -ErrorAction SilentlyContinue
if (!!$Slackprocess)
{
    Write-Host "Slack is runing" -ForegroundColor Yellow
    do
    {
        Stop-Process -Name 'Slack' -ErrorAction SilentlyContinue
        $Slackprocess = Get-Process -Name 'Slack' -ErrorAction SilentlyContinue
    }
    until (!$Slackprocess)
    write-Host "Slack is not running" -ForegroundColor Green
}
else
{
    write-Host "Slack is not running" -ForegroundColor Green
}

#Stops all Outlook processes
$OUTLOOKprocess = Get-Process -Name 'OUTLOOK' -ErrorAction SilentlyContinue
if (!!$OUTLOOKprocess)
{
    Write-Host "Outlook is runing" -ForegroundColor Yellow
    do
    {
        Stop-Process -Name 'Outlook' -ErrorAction SilentlyContinue
        $OUTLOOKprocess = Get-Process -Name 'OUTLOOK' -ErrorAction SilentlyContinue
    }
    until (!$OUTLOOKprocess)
    write-Host "Outlook is not running" -ForegroundColor Green
}
else
{
    write-Host "Outlook is not running" -ForegroundColor Green
}

#Stops all VS Code processes
$Codeprocess = Get-Process -Name 'Code' -ErrorAction SilentlyContinue
if (!!$Codeprocess)
{
    Write-Host "VS Code is runing" -ForegroundColor Yellow
    do
    {
        Stop-Process -Name 'Code' -ErrorAction SilentlyContinue
        $Codeprocess = Get-Process -Name 'Code' -ErrorAction SilentlyContinue
    }
    until (!$Codeprocess)
    write-Host "VS Code is not running" -ForegroundColor Green
}
else
{
    write-Host "VS Code is not running" -ForegroundColor Green
}

#Stops all powershell ise processes
$powershelliseprocess = Get-Process -Name 'powershell_ise' -ErrorAction SilentlyContinue
if (!!$powershelliseprocess)
{
    Write-Host "Powershell ise is runing" -ForegroundColor Yellow
    do
    {
        Stop-Process -Name 'powershell_ise' -ErrorAction SilentlyContinue
        $powershelliseprocess = Get-Process -Name 'powershell_ise' -ErrorAction SilentlyContinue
    }
    until (!$powershelliseprocess)
    write-Host "Powershell ise is not running" -ForegroundColor Green
}
else
{
    write-Host "Powershell ise is not running" -ForegroundColor Green
}


#Stops all Windows Terminal processes
$WindowsTerminalprocess = Get-Process -Name 'WindowsTerminal' -ErrorAction SilentlyContinue
if (!!$WindowsTerminalprocess)
{
    Write-Host "Windows Terminal is runing" -ForegroundColor Yellow
    do
    {
        Stop-Process -Name 'WindowsTerminal' -ErrorAction SilentlyContinue
        $WindowsTerminalprocess = Get-Process -Name 'WindowsTerminal' -ErrorAction SilentlyContinue
    }
    until (!$WindowsTerminalprocess)
    write-Host "Windows Terminal is not running" -ForegroundColor Green
}
else
{
    write-Host "Windows Terminal is not running" -ForegroundColor Green
}

#Stops all Spotify processes
$Spotifyprocess = Get-Process -Name 'Spotify' -ErrorAction SilentlyContinue
if (!!$Spotifyprocess)
{
    Write-Host "Spotify is runing" -ForegroundColor Yellow
    do
    {
        Stop-Process -Name 'Spotify' -ErrorAction SilentlyContinue
        $Spotifyprocess = Get-Process -Name 'Spotify' -ErrorAction SilentlyContinue
    }
    until (!$Spotifyprocess)
    write-Host "Spotify is not running" -ForegroundColor Green
}
else
{
    write-Host "Spotify is not running" -ForegroundColor Green
}

#Stops all Spotify processes
$RemoteDesktopManagerFreeprocess = Get-Process -Name 'RemoteDesktopManagerFree' -ErrorAction SilentlyContinue
if (!!$RemoteDesktopManagerFreeprocess)
{
    Write-Host "RemoteDesktop Manager Free is runing" -ForegroundColor Yellow
    do
    {
        Stop-Process -Name 'RemoteDesktopManagerFree' -ErrorAction SilentlyContinue
        $RemoteDesktopManagerFreeprocess = Get-Process -Name 'RemoteDesktopManagerFree' -ErrorAction SilentlyContinue
    }
    until (!$RemoteDesktopManagerFreeprocess)
    write-Host "RemoteDesktop Manager Free is not running" -ForegroundColor Green
}
else
{
    write-Host "RemoteDesktop Manager Free is not running" -ForegroundColor Green
}


#Starts WaveLink software if not running
$WaveLinkprocess = Get-Process -Name 'WaveLink' -ErrorAction SilentlyContinue
if (!$WaveLinkprocess)
{
    Write-Host "WaveLink is not runing" -ForegroundColor Yellow
    do
    {
        Start-Process -FilePath "C:\Program Files\Elgato\WaveLink\WaveLink.exe" -ErrorAction SilentlyContinue
        $WaveLinkprocess = Get-Process -Name 'WaveLink' -ErrorAction SilentlyContinue
    }
    until (!!$WaveLinkprocess)
    write-Host "WaveLink is running" -ForegroundColor Green
}
else
{
    write-Host "WaveLink is running" -ForegroundColor Green
}

#Starts iCUE software if not running
$iCUEprocess = Get-Process -Name 'iCUE' -ErrorAction SilentlyContinue
if (!$iCUEprocess)
{
    Write-Host "iCUE is not runing" -ForegroundColor Yellow
    do
    {
        Restart-Service -Name CorsairService
        Start-Process -FilePath 'C:\Program Files\Corsair\CORSAIR iCUE 4 Software\iCUE.exe' -ErrorAction SilentlyContinue
        $iCUEprocess = Get-Process -Name 'iCUE' -ErrorAction SilentlyContinue
    }
    until (!!$iCUEprocess)
    write-Host "iCUE is running" -ForegroundColor Green
}
else
{
    write-Host "iCUE is running" -ForegroundColor Green
}

#Starts Opera software if not running
$operaprocess = Get-Process -Name 'opera' -ErrorAction SilentlyContinue
if (!$operaprocess)
{
    Write-Host "opera is not runing" -ForegroundColor Yellow
    do
    {
        Start-Process -FilePath "C:\Users\Rick\AppData\Local\Programs\Opera GX\launcher.exe" -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 5
        $operaprocess = Get-Process -Name 'opera' -ErrorAction SilentlyContinue
    }
    until (!!$operaprocess)
    write-Host "opera is running" -ForegroundColor Green
}
else
{
    write-Host "opera is running" -ForegroundColor Green
}


#Starts OBS software if not running
$obs64process = Get-Process -Name 'obs64' -ErrorAction SilentlyContinue
if (!$obs64process)
{
    Write-Host "OBS is not runing" -ForegroundColor Yellow
    do
    {
        Start-Process "obs64.exe" -WorkingDirectory "C:\Program Files\obs-studio\bin\64bit"  -Verb runas
        Start-Sleep -Seconds 15
        $obs64process = Get-Process -Name 'obs64' -ErrorAction SilentlyContinue
    }
    until (!!$obs64process)
    write-Host "OBS is running" -ForegroundColor Green
}
else
{
    write-Host "OBS is running" -ForegroundColor Green
}
