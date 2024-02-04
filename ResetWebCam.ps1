<#function Reset-ObsWebCam {

    param(
$Key = "",
$SceneName = "",
$CameraSourceName = "",
$CameraName = ""
)#>
    #Needed variables
    #OBS Web Socket Key. You can see the websocket password in Tools -> obs-websocket settings -> show connect info
    $websocketKey = 'O4KfB0WrXpsAQs3A'
    #OBS scene name
    $OBSsceneName = 'Battlefield 2042'
    #Webcamera source name in OBS scene
    $ObsCameraSourceName = 'Brio'
    #Webcamrea Friendly Name from Windows Pnp Deivce list, to view all Pnp device run powershell commend Get-PnpDevice
    $WindowsCameraName = 'Logitech BRIO'

    #Checks if OBS powershell module is installed, if not will install module and connect using OBS webscoket key. If already installed it will connect to OBS
    if (!(Get-InstalledModule -Name obs-powershell -ErrorAction SilentlyContinue)) {
        Install-Module obs-powershell -Scope CurrentUser -Force
        Connect-OBS -WebSocketToken $websocketKey
    }
    else {
        Import-Module obs-powershell -PassThru -Force
        #Connect-OBS -WebSocketToken $websocketKey
    }

    #Checks webcam state and if enabled it will be disabled
    if ((Get-OBSSceneItem -SceneName $OBSsceneName | Where-Object sourceName -EQ $ObsCameraSourceName).Enabled -eq $true) {
        Set-OBSSceneItemEnabled -SceneName $OBSsceneName -SceneItemId ((Get-OBSSceneItem -SceneName $OBSsceneName | Where-Object sourceName -EQ $ObsCameraSourceName).SceneItemID) -sceneItemEnabled:$false
    }

    #Checks Webcam USB connection for Error or Unkown status, if true will enable the connection
    if ((Get-PnpDevice -FriendlyName $WindowsCameraName -Class USB).Status -contains 'Error' -or (Get-PnpDevice -FriendlyName $WindowsCameraName -Class USB).Status -contains 'Unknown') {
        Enable-PnpDevice -InstanceId  (Get-PnpDevice -FriendlyName $WindowsCameraName -Class USB).InstanceId -Confirm:$false
    }
    #Checks Webcam MEDIA connection for Error or Unkown status, if true will enable the connection
    elseif ((Get-PnpDevice -FriendlyName $WindowsCameraName -Class MEDIA).Status -contains 'Error' -or (Get-PnpDevice -FriendlyName $WindowsCameraName -Class MEDIA).Status -contains 'Unknown') {
        Enable-PnpDevice -InstanceId  (Get-PnpDevice -FriendlyName $WindowsCameraName -Class MEDIA).InstanceId -Confirm:$false
    }
    #Checks Webcam Image connection for Error or Unkown status, if true will enable the connection
    elseif ((Get-PnpDevice -FriendlyName $WindowsCameraName -Class Image).Status -contains 'Error' -or (Get-PnpDevice -FriendlyName $WindowsCameraName -Class Image).Status -contains 'Unknown') {
        Enable-PnpDevice -InstanceId  (Get-PnpDevice -FriendlyName $WindowsCameraName -Class Image).InstanceId -Confirm:$false
    }

    #Checks webcam state and if disabled it will be enable
    if ((Get-OBSSceneItem -SceneName $OBSsceneName | Where-Object sourceName -EQ $ObsCameraSourceName).Enabled -eq $false) {
        Set-OBSSceneItemEnabled -SceneName $OBSsceneName -SceneItemId ((Get-OBSSceneItem -SceneName $OBSsceneName | Where-Object sourceName -EQ $ObsCameraSourceName).SceneItemID) -sceneItemEnabled
    }
<#>}
Reset-ObsWebCam -Key 'O4KfB0WrXpsAQs3A' -SceneName 'Battlefield 2042' -CameraSourceName "Brio" -CameraName 'Logitech BRIO'#>