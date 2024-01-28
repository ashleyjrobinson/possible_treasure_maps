local inventory = exports.ox_inventory
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.TreasureMapItem, function(source)
    TriggerClientEvent('possible-treasuremaps:client:UseTreasureItem', source)
end)

QBCore.Functions.CreateUseableItem(Config.DigItem, function(source)
    TriggerClientEvent('possible-treasuremaps:client:UseDigItem', source)
end)

RegisterNetEvent('possible-treasuremaps:server:MarkTreasureZone')
AddEventHandler('possible-treasuremaps:server:MarkTreasureZone', function(playerId, zoneName)
    TriggerClientEvent('possible-treasuremaps:client:MarkTreasureZone', playerId, zoneName)
end)

RegisterNetEvent('possible-treasuremaps:server:UseTreasureItem')
AddEventHandler('possible-treasuremaps:server:UseTreasureItem', function()
    local src = source
	local player = QBCore.Functions.GetPlayer(src)

    if not inventory then
        print("Error: You need ox_invetory to use this resource.")
        return
    end

    local success = inventory:RemoveItem(src, Config.TreasureMapItem, 1)

    if success then
    local locationNames = {}
        for locationName, _ in pairs(Config.TreasureLocations) do
            table.insert(locationNames, locationName)
        end
        
        local randomIndex = math.random(1, #locationNames)
        local randomLocationName = locationNames[randomIndex]
        local coords = Config.TreasureLocations[randomLocationName].coords

        if Config.Debug then
            print("Selected location coordinates:", coords)
        end 
    
        TriggerClientEvent('possible-treasuremaps:client:MarkTreasureLocation', -1, coords, randomLocationName)
    else
        print("Error: Failed to remove item from inventory.")
    end
end)


RegisterNetEvent('possible-treasuremaps:server:GiveDigReward')
AddEventHandler('possible-treasuremaps:server:GiveDigReward', function(lootTableType)
    local src = source
	local player = QBCore.Functions.GetPlayer(src)

    local lootTable

    if lootTableType == "Common" then
        lootTable = Config.CommonLootTables
    else
        lootTable = Config.RareLootTables
    end

    local lootTableNames = {}

    for lootTableName, _ in pairs(lootTable) do
        table.insert(lootTableNames, lootTableName)
    end
        
    local selectedTableName = lootTableNames[math.random(1, #lootTableNames)]
    local selectedTable = lootTable[selectedTableName]

    for _, item in pairs(selectedTable) do
        exports.ox_inventory:AddItem(src, item, 1)
    end

end)



