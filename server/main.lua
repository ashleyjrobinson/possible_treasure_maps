local config = require('shared.config')
local ox_inventory = exports.ox_inventory

if config.Framework == "qb" then
    QBCore = exports["qb-core"]:GetCoreObject()
elseif config.Framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()
end

if config.Framework == "qb" then
    QBCore.Functions.CreateUseableItem(config.TreasureMapItem, function(source)
        TriggerClientEvent('possible-treasuremaps:client:UseTreasureItem', source)
    end)

    QBCore.Functions.CreateUseableItem(config.DigItem, function(source)
        TriggerClientEvent('possible-treasuremaps:client:UseDigItem', source)
    end)
elseif config.Framework == "esx" then
    ESX.RegisterUsableItem(config.TreasureMapItem, function(source)
        TriggerClientEvent('possible-treasuremaps:client:UseTreasureItem', source)
    end)

    ESX.RegisterUsableItem(config.DigItem, function(source)
        TriggerClientEvent('possible-treasuremaps:client:UseDigItem', source)
    end)
end

RegisterNetEvent('possible-treasuremaps:server:UseTreasureItem', function()
    local src = source

    if not ox_inventory then
        print("Error: You need ox_invetory to use this resource.")
        return
    end

    local success = ox_inventory:RemoveItem(src, config.TreasureMapItem, 1)

    if success then
        local locationNames = {}
        for locationName, _ in pairs(config.TreasureLocations) do
            table.insert(locationNames, locationName)
        end
        
        local randomIndex = math.random(1, #locationNames)
        local randomLocationName = locationNames[randomIndex]
        local coords = config.TreasureLocations[randomLocationName].coords

        if config.Debug then
            print("Selected location coordinates:", coords)
        end 
    
        TriggerClientEvent('possible-treasuremaps:client:MarkTreasureLocation', src, coords, randomLocationName)
    else
        print("Error: Failed to remove item from inventory.")
    end
end)

RegisterNetEvent('possible-treasuremaps:server:GiveDigReward', function(lootTableType)
    local src = source

    local lootTable

    if lootTableType == "Common" then
        lootTable = config.CommonLootTables
    else
        lootTable = config.RareLootTables
    end

    local lootTableNames = {}

    for lootTableName, _ in pairs(lootTable) do
        table.insert(lootTableNames, lootTableName)
    end
        
    local selectedTableName = lootTableNames[math.random(1, #lootTableNames)]
    local selectedTable = lootTable[selectedTableName]

    for _, item in pairs(selectedTable) do
        if ox_inventory:CanCarryItem(src, item, 1) then
        ox_inventory:AddItem(src, item, 1)
        else
            print("Error: Inventory is full.")
        end
    end
end)
