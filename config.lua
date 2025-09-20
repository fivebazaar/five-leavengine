Config = {}
Config.Updater = true -- Güncellemeleri kontrol et
Config.RestrictToEmergency = false -- Sadece acil durum araçları için aktif
Config.KeepDoorOpen = true -- Çıkarken kapıyı açık bırak
Config.EnableHighBeams = true -- Far açma özelliği
Config.NotificationDuration = 5000 -- Bildirim süresi (ms)

Config.CheckInterval = 100 -- Ana döngü kontrol aralığı (ms)
Config.HoldDuration = 150 -- F tuşuna basma süresi (ms)

Config.ExitKey = 75 -- F tuşu

Config.EmergencyVehicleClass = 18 -- Acil durum araçları sınıfı

Config.Notifications = {
    enabled = true,
    type = 'ox_lib', -- 'native', 'ox_lib', 'custom'
    messages = {
      --native  instruction = 'Hold ~b~F ~w~when exiting to leave engine running.',
      --ox_lib
        instruction = 'Hold F when exiting to leave engine running.',

        success = 'Engine left running!',
        restricted = 'This feature is only available for emergency vehicles.'
    }
}