local playerPed = PlayerPedId()
local currentVehicle = nil
local hasShownNotification = false
local isProcessingExit = false
local hasShownSuccessNotification = false

local function ShowNotification(message, type)
    if not Config.Notifications.enabled then return end
    if Config.Notifications.type == 'ox_lib' and lib then
        lib.notify({title='Engine Control', description=message, type=type or 'info', duration=Config.NotificationDuration})
    else
        SetNotificationTextEntry("STRING")
        AddTextComponentString(message)
        DrawNotification(false, false)
    end
end

local function IsVehicleAllowed(vehicle)
    return not Config.RestrictToEmergency or GetVehicleClass(vehicle) == Config.EmergencyVehicleClass
end

local function SetVehicleLighting(vehicle)
    if Config.EnableHighBeams then
        SetVehicleLights(vehicle, 2)
        SetVehicleFullbeam(vehicle, true)
        SetVehicleLightMultiplier(vehicle, 1.0)
    end
end

local function HandleEngineRunningExit(vehicle)
    if isProcessingExit then return end
    isProcessingExit = true
    Wait(Config.HoldDuration)
    if IsPedInAnyVehicle(playerPed, false) and IsControlPressed(2, Config.ExitKey) and not IsEntityDead(playerPed) then
        SetVehicleEngineOn(vehicle, true, true, false)
        SetVehicleLighting(vehicle)
        TaskLeaveVehicle(playerPed, vehicle, Config.KeepDoorOpen and 256 or 0)
        if not hasShownSuccessNotification then
            ShowNotification(Config.Notifications.messages.success, 'success')
            hasShownSuccessNotification = true
        end
    end
    isProcessingExit = false
end

AddEventHandler('gameEventTriggered', function(name, args)
    local playerId = args[1]
    if playerId ~= PlayerId() then return end
    if name == 'CEventNetworkPlayerEnteredVehicle' then 
        hasShownNotification = false
        hasShownSuccessNotification = false
    elseif name == 'CEventNetworkPlayerLeftVehicle' then 
        hasShownNotification = false 
        hasShownSuccessNotification = false
        currentVehicle = nil 
    end
end)

CreateThread(function()
    while true do
        Wait(Config.CheckInterval or 150)
        playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if vehicle ~= 0 then
            if vehicle ~= currentVehicle then
                currentVehicle = vehicle
                hasShownNotification = false
            end
            if not hasShownNotification then
                ShowNotification(
                    IsVehicleAllowed(vehicle) and Config.Notifications.messages.instruction or Config.Notifications.messages.restricted,
                    IsVehicleAllowed(vehicle) and 'info' or 'warning'
                )
                hasShownNotification = true
            end
            if IsVehicleAllowed(vehicle) and IsControlPressed(2, Config.ExitKey) and not IsEntityDead(playerPed) then
                HandleEngineRunningExit(vehicle)
            end
        else
            if currentVehicle then
                SetVehicleLights(currentVehicle, 0)
                SetVehicleFullbeam(currentVehicle, false)
                SetVehicleLightMultiplier(currentVehicle, 0.0)
            end
            currentVehicle = nil
            hasShownNotification = false
            hasShownSuccessNotification = false
            Wait(500)
        end
    end
end)

