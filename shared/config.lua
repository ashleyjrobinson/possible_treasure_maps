Config = {}

-- Enable for additional prints and sphere zone debug
Config.Debug = false

-- Define your item and useable items here
Config.TreasureMapItem = 'treasuremap'
Config.DigItem = 'spade'

-- Define your emote menu here - rpemotes or any other string to use scully_emotemenu
Config.Emotes = 'rpemotes'

-- Add as many location as you want here for it to randomly assign on map use
Config.TreasureLocations = {
    Location1 = {
        coords = vector3(493.4, 1439.34, 351.75),
        radius = 2,
    },
    Location2 = {
        coords = vector3(488.03, 1444.48, 351.33),
        radius = 2,
    },
    Location3 = {
        coords = vector3(657.87, 1290.45, 360.1),
        radius = 2,
    },
    Location4 = {
        coords = vector3(1292.0, 4322.65, 38.31),
        radius = 2,
    },
    Location5 = {
        coords = vector3(2841.46, -1513.16, 2.11),
        radius = 2,
    },
}

-- Define your common loot tables here (currently a 1-10 chance the rare table is hit)
Config.CommonLootTables = {
    CommonLoot1 = {
        Item1 = 'phone',
        Item2 = 'phone',
        Item3 = 'phone',
        Item4 = 'phone',
        Item5 = 'phone',
    },
    CommonLoot2 = {
        Item1 = 'radio',
        Item2 = 'iphone',
        Item3 = 'phone',
        Item4 = 'laptop',
        Item5 = 'iphone',
    },
    CommonLoot3 = {
        Item1 = 'baggy',
        Item2 = 'cokebaggy',
        Item3 = 'cokeounce',
        Item4 = 'meth',
        Item5 = 'baggy',
    }
}

-- Define your rare loot tables here
Config.RareLootTables = {
    RareLoot1 = {
        Item1 = 'treasuremap',
        Item2 = 'baggy',
        Item3 = 'phone',
        Item4 = 'radio',
        Item5 = 'lockpick',
    },
    RareLoot2 = {
        Item1 = 'houselockpick',
        Item2 = 'houselockpick',
        Item3 = 'advancedlockpick',
        Item4 = 'advancedlockpick',
        Item5 = 'lockpick',
    },
    RareLoot3 = {
        Item1 = 'houselockpick',
        Item2 = 'houselockpick',
        Item3 = 'advancedlockpick',
        Item4 = 'advancedlockpick',
        Item5 = 'lockpick',
    }
}

-- Notification positon
Config.NotifPosition = "top"

-- Notifcation message for client to indicate blip on navigation
Config.TreasureLocationNotifTitle = "X marks the spot"
Config.TreasureLocationNotifMessage = "A location has been added to your navigation."

-- Notification messages for client after already dug
Config.AlreadyDugNotifTitle = "Already dug"
Config.AlreadyDugNotifMessage = "You have already found your treasure."

-- Notification messages for client not in zone
Config.KeepSearchingNotifTitle = "Keep searching"
Config.KeepSearchingNotifMessage = "You are not at the marked location."