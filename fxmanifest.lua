fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description 'Tonny Visual Hit'
version '1.0'
legacyversion '1.9.1'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@es_extended/locale.lua',
	'server.lua'
}


client_scripts {
	'@es_extended/locale.lua',
	'client.lua'
}

dependency 'es_extended'