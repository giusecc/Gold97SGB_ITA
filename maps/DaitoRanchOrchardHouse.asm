	object_const_def ; object_event constants
	const DAITO_APPLEFARMER


DaitoRanchOrchardHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AppleFarmerScript:
	jumptextfaceplayer AppleFarmerText
	
AppleFarmerText:
	text "Ma guarda un po'!"
	
	para "Un allenatore"
	line "venuto fin qui"
	cont "per il mio MELETO!"
	
	para "Potrei aver biso-"
	line "gno del tuo aiuto."
	para "Le mie MELE si"
	line "vendono a buon"
	para "prezzo sulla"
	line "terraferma, sono"
	cont "deliziose!"
	
	para "Tuttavia, è sempre"
	line "un problema"
	para "venderle così"
	line "lontano da qui!"
	
	para "Che ne dici di"
	line "darmi una mano e"
	para "venderne un po'"
	line "per me?"
	
	para "Puoi tenerti parte"
	line "del guadagno!"
	para "Non preoccuparti,"
	line "mi prendero la"
	cont "mia percentuale!"
	done


DaitoRanchOrchardHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 4
	warp_event  5,  7, DAITO_RANCH, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 7, 4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AppleFarmerScript, -1
