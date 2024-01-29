local currentLocationCoords = nil
local currentLocationBlip = nil 
local hasDugAtLocation = false 

CreateThread(function()
    for locationName, locationData in pairs(Config.TreasureLocations) do
        local coords = locationData.coords
        local radius = locationData.radius

        lib.zones.sphere({
            name = locationName,
            coords = coords,
            radius = radius,
            debug = Config.Debug
        })
    end
end)

RegisterNetEvent('possible-treasuremaps:client:UseTreasureItem')
AddEventHandler('possible-treasuremaps:client:UseTreasureItem', function()
    currentLocationCoords = nil
    hasDugAtLocation = false
    
    if Config.Emotes == 'rpemotes' then
        exports["rpemotes"]:EmoteCommandStart("map2")
    else 
        exports.scully_emotemenu:playEmoteByCommand('map2')
    end
    if lib.progressCircle({
        duration = 5000,
        label = 'Search for treasure..',
        useWhileDead = false,
        canCancel = true,
        position = 'bottom',
        disable = {
            move = false,
            car = false,
            mouse = false,
            combat = true
        }
        }) then
        if Config.Emotes == 'rpemotes' then
            exports["rpemotes"]:EmoteCancel(forceCancel)
        else
            exports.scully_emotemenu:cancelEmote()
        end
        TriggerServerEvent('possible-treasuremaps:server:UseTreasureItem')
    end
end)

RegisterNetEvent('possible-treasuremaps:client:MarkTreasureLocation')
AddEventHandler('possible-treasuremaps:client:MarkTreasureLocation', function(coords)
    if currentLocationCoords == nil then
        currentLocationCoords = coords

        currentLocationBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(currentLocationBlip, 112) 
        SetBlipColour(currentLocationBlip, 1)
        SetBlipScale(currentLocationBlip, 0.5)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString('Treasure Location')
        EndTextCommandSetBlipName(currentLocationBlip)
        hasDugAtLocation = false

        lib.notify{
            title = Config.TreasureLocationNotifTitle,
            description = Config.TreasureLocationNotifMessage,
            type = 'info',
            position = Config.NotifPosition,
            icon = 'fa-solid fa-map'
        }
    end
end)

local function IsPlayerInsideAssignedLocation()
    if currentLocationCoords then
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - currentLocationCoords)
        return distance <= 2.0
    end
    return false
end


RegisterNetEvent('possible-treasuremaps:client:UseDigItem')
AddEventHandler('possible-treasuremaps:client:UseDigItem', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    if IsPlayerInsideAssignedLocation() and not hasDugAtLocation then
        if Config.Emotes == 'rpemotes' then
            exports["rpemotes"]:EmoteCommandStart("dig")
        else 
            exports.scully_emotemenu:playEmoteByCommand('dig')
        end
        if lib.progressCircle({
            duration = 5000,
            label = 'Digging for treasure..',
            useWhileDead = false,
            canCancel = true,
            position = 'bottom',
            disable = {
                move = false,
                car = false,
                mouse = false,
                combat = true
            }
            }) then
            if Config.Emotes == 'rpemotes' then
                exports["rpemotes"]:EmoteCancel(forceCancel)
            else
                exports.scully_emotemenu:cancelEmote()
            end
            
            local randomType = math.random(1, 10) 
            local lootTableType

            if randomType == 1 then
                lootTableType = 'Rare'
            else
                lootTableType = 'Common'
            end

            TriggerServerEvent('possible-treasuremaps:server:GiveDigReward', lootTableType)

            hasDugAtLocation = true
            if currentLocationBlip ~= nil then
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentString('')
                EndTextCommandSetBlipName(currentLocationBlip)
                RemoveBlip(currentLocationBlip)
                currentLocationBlip = nil
            end
        end
    elseif hasDugAtLocation then
        lib.notify {
            title = Config.AlreadyDugNotifTitle,
            description = Config.AlreadyDugNotifMessage,
            type = 'error',
            position = Config.NotifPosition,
            icon = 'fa-solid fa-map'
        }
    else
        lib.notify {
            title = Config.KeepSearchingNotifTitle,
            description = Config.KeepSearchingNotifMessage,
            type = 'error',
            position = Config.NotifPosition,
            icon = 'fa-solid fa-map'
        }
    end
end)