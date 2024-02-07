return {
    Debug = false,
    Framework = "qb", --"qb" for qbx/ qb, "esx" for esx
    TreasureMapItem = 'treasuremap',
    DigItem = 'spade',
    Emotes = 'rpemotes',
    TreasureLocations = {
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
    },
    CommonLootTables = {
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
    },
    RareLootTables = {
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
    },
    NotifPosition = "top",
    NotifIcon = "fa-solid fa-map",
    ProgressPosition = "bottom",
    MapDuration = 5000,
    DigDuration = 5000,
    BlipName = "Treasure Location",
}