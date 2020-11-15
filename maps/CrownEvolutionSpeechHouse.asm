	object_const_def ; object_event constants
	const CROWNEVOLUTIONSPEECHHOUSE_LASS

CrownEvolutionSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CrownEvolutionSpeechHouseLassScript:
	jumptextfaceplayer CrownEvolutionSpeechHouseLassText

CrownEvolutionSpeechHouseLassText:
	text "Tanti anni fa mia"
	line "mamma mi ha par-"
	para "lato di un #-"
	line "MON leggendario"
	para "che appare nel"
	line "cielo come una"
	para "fiamma, lasciando"
	line "dietro a se una"
	cont "scia di cenere."
	para "Questo #MON"
	line "ha creato dalle"
	para "sue ceneri altri"
	line "tre #MON,"
	para "mandandoli in giro"
	line "per la regione."
	para "Fino ad oggi, nes-"
	line "suno ha mai visto"
	cont "quei #MON."
	done

CrownEvolutionSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BIRDON_TOWN, 10
	warp_event  5,  7, BIRDON_TOWN, 10

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownEvolutionSpeechHouseLassScript, -1
