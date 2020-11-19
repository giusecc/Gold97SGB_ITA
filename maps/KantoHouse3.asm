	object_const_def ; object_event constants
	const KANTOHOUSE_3_GRANNY
	const KANTOHOUSE_3_GRAMPS

KantoHouse3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoHouse3Granny:
	jumptextfaceplayer KantoHouse3GrannyText
	
KantoHouse3Gramps:
	jumptextfaceplayer KantoHouse3GrampsText
	
KantoHouse3GrannyText:
	text "Io e mio marito"
	line "viviamo qui da"
	cont "decenni."
	para "Sono così felice"
	line "del tempo passato"
	cont "con lui."
	done
	
KantoHouse3GrampsText:
	text "Io e mia moglie"
	line "eravamo forti"
	cont "allenatori."
	para "Ora trascorriamo"
	line "le nostre giornate"
	para "qui. Non potrei"
	line "essere più"
	cont "felice."
	done

KantoHouse3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 26
	warp_event  5,  7, KANTO_REGION, 26

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse3Granny, -1
	object_event  7,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse3Gramps, -1
