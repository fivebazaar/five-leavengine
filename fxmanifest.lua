fx_version 'cerulean'
game 'gta5'

description 'Leave Engine Running - Modern & Optimized'
version '1.0.0'
author 'FAXES - Optimized by alpy'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/*.lua'
}

dependencies {
    'ox_lib'
}

lua54 'yes'
