fx_version 'cerulean'
game 'gta5'

name "lp_pma-circle"
description "lp_pma-circle"
author "LifePeak"
version "1.0.0"
lua54 'yes'

shared_script {
	'@ox_lib/init.lua',
	'config.lua'
}

client_scripts {
	'client/*.lua',
}

files {
	'locales/*.json',
}

dependencies {
	'ox_lib',
	'pma-voice',
}