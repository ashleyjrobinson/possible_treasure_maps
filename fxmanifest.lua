fx_version 'cerulean'

game 'gta5'

author 'Possible'

description 'Possible Treasure Maps - Add treasure maps to loot tables and allow players to go dig locations for loot.'

version '1.0.0'

lua54 'yes'

shared_scripts {
    'shared/*',
    '@ox_lib/init.lua'
}

client_scripts {
    'client/*'
}

server_scripts {
    'server/*'
}