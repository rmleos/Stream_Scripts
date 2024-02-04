$snapprocess = Get-Process -Name 'Snap Camera' -ErrorAction SilentlyContinue
if (!!$snapprocess)
{
    Write-Host "Snap Camera is runing" -ForegroundColor Yellow
    do
    {
        Stop-Process -Name 'Snap Camera' -ErrorAction SilentlyContinue
        $snapprocess = Get-Process -Name 'Snap Camera' -ErrorAction SilentlyContinue
    }
    until (!$snapprocess)
    write-Host "Snap Camera is not running" -ForegroundColor Green
}
else
{
    write-Host "Snap Camera is not running" -ForegroundColor Green
}