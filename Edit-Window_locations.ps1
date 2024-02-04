
# refance artical https://dadoverflow.com/2018/11/18/positioning-windows-with-powershell/

Import-Module S:\OneDrive\Steaming\Stream_Scripts\Set-Window.ps1

Add-Type -AssemblyName System.Windows.Forms
$screens = [System.Windows.Forms.Screen]::AllScreens|sort -Property {$_.WorkingArea.X}

$screen1 = $screen | Where-Object DeviceName -Contains '\\.\DISPLAY1'
$x1 = $screen1.WorkingArea.X
$screen1_width = $screen1.WorkingArea.Width
$screen1_height = $screen1.WorkingArea.Height


$screen2 = $screen | Where-Object DeviceName -Contains '\\.\DISPLAY2'
$x2 = $screen2.WorkingArea.X
$screen2_width = $screen2.WorkingArea.Width
$screen2_height = $screen2.WorkingArea.Height


$running_ubuntu_pids = Get-Process|?{$_.Name -eq "Notepad"}|select Id
$count = 1
foreach($uPid in $running_ubuntu_pids){
    $y = ( ($count - 1) * ($screen2_height) )
    $h = ( $screen2_height )
    Set-Window -ProcessId $running_ubuntu_pids.Id -X $x -Y $y -Width $screen2_width -Height $h -Passthru
    # strangely, on some monitors, the first Set-Window doesn't quite take, but setting it again seems to work
    Set-Window -ProcessId $app.Id -X $x -Y $y -Width $screen_width -Height $h -Passthru
    $count++
}