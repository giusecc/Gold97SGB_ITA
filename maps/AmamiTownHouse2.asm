	object_const_def ; object_event constants
	const AMAMITOWNHOUSE2_GENTLEMAN

AmamiTownHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiTownHouse2GentlemanScript:
	jumptextfaceplayer AmamiTownHouse2GentlemanText

AmamiTownHouse2GentlemanText:
	text "In tempi remoti,"
	line "alcuni uomini"
	para "navigarono fin"
	line "qui dalla terra-"
	para "ferma e abitarono"
	line "le isole."
	para "Il nostro stile"
	line "di vita è molto"
	cont "rilassato."
	done

AmamiTownHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, AMAMI_TOWN, 9
	warp_event  5,  7, AMAMI_TOWN, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  1,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiTownHouse2GentlemanScript, -1
