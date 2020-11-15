	object_const_def ; object_event constants
	const CROWN_HOUSE_2_POKEFAN_M

CrownHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
CrownHouse2PokefanMScript:
	jumptextfaceplayer CrownHouse2PokefanMText
	
CrownHouse2PokefanMText:
	text "È bello vedere"
	line "tutti gli aspiran-"
	para "ti campioni che"
	line "passano da questa"
	cont "città."
	para "La LEGA attira"
	line "tutti gli allena-"
	cont "tori più forti."
	done
	
CrownHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CROWN_CITY, 7
	warp_event  5,  7, CROWN_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownHouse2PokefanMScript, -1
