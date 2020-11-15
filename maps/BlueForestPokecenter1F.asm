	object_const_def ; object_event constants
	const BLUE_FORESTPOKECENTER1F_NURSE
	const BLUE_FORESTPOKECENTER1F_GENTLEMAN
	const BLUE_FORESTPOKECENTER1F_TWIN
	const BLUE_FORESTPOKECENTER1F_COOLTRAINER_M

BlueForestPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

BlueForestPokecenter1FGentlemanScript:
	jumptextfaceplayer BlueForestPokecenter1FGentlemanText

BlueForestPokecenter1FTwinScript:
	jumptextfaceplayer BlueForestPokecenter1FTwinText

BlueForestPokecenter1FCooltrainerMScript:
	jumpstd HappinessCheckScript

BlueForestPokecenter1FGentlemanText:
	text "La LEGA #MON si"
	line "trova sulla cima"
	cont "del MONTE FUJI."

	para "Si dice che vi"
	line "siano i migliori"

	para "allenatori di"
	line "tutto il paese."
	done

BlueForestPokecenter1FTwinText:
	text "Volevo far"
	line "imparare una nuova"

	para "mossa al mio"
	line "#MON."

	para "Così ho chiesto"
	line "all'ELIMINAMOSSE"
	para "di fargli scordare"
	line "una mossa MN."
	done

BlueForestPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, BLUE_FOREST, 5
	warp_event  6,  7, BLUE_FOREST, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestPokecenter1FNurseScript, -1
	object_event 10,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestPokecenter1FGentlemanScript, -1
	object_event  1,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestPokecenter1FTwinScript, -1
	object_event 10,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestPokecenter1FCooltrainerMScript, -1
