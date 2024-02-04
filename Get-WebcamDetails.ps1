function Get-WebcamState {

    Write-Output "`nCamera Device connection status to Windows"
    #Gets status of camera
    $PnpState = Get-PnpDevice -FriendlyName 'Logitech BRIO'
    Write-Output $PnpState
    #Gets status of camera via wmi call
    #Get-WmiObject Win32_PnPEntity | where {$_.caption -match 'Logitech BRIO'}

    #Var for web cam registry items
    $Webcamdetails = @()
    #Gets Modern Win App keys
    $Webcamdetails += Get-ChildItem -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\
    #gets Win App keys
    $Webcamdetails += Get-ChildItem -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\NonPackaged\
    #Var to store lookup of each key
    $regkeydetails = @()
    #Lookup of each key
    foreach ($Webcamdetail in $Webcamdetails) {
        $regkeydetails += $Webcamdetail | Get-ItemProperty
    }
    #Displays the App with LastUsedTimeStop equal to zero as that will be on that is currently using the camera
    Write-Output "`nChecking if camera is being used at this time and by what app"
    if (!!($regkeydetails | Where-Object LastUsedTimeStop -EQ 0)) {
        $webcamapp = ($regkeydetails | Where-Object LastUsedTimeStop -EQ 0)
        Write-Output $webcamapp
    }
    else {
        Write-Output "`nCamera is not being used at this time"
    }

    #Displays Frame Server Mode registry key
    Write-Output "`nChecking for Frame Server Mode state"   
    $EnableFrameServerModePath = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows Media Foundation\Platform"
    if (!(Get-ItemProperty -Path $EnableFrameServerModePath)) {
        Write-Output "Frame Server Mode registry key is not set" -ForegroundColor Yellow
    }
    else {
        $FrameServerMode = (Get-ItemProperty -Path $EnableFrameServerModePath)
        Write-Output $FrameServerMode  
    }

    #Get the Windows Camera Frame Server service state
    Write-Output "Getting Windows Camera Frame Server service state"
    Write-Output (Get-Service FrameServer)
}
#Run webcam state function and outputs to file for logging
$filename = ("webCamState"+(Get-Date -Format "MM_dd_yyyy_HHmmss")+".txt")
Get-WebcamState 
Get-WebcamState | Out-File S:\OneDrive\Steaming\Stream_Scripts\$filename