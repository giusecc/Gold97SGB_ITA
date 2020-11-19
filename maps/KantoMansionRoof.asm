	object_const_def ; object_event constants
	const KANTOMANSIONROOF_FISHER

KantoMansionRoof_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoMansionRoofFisherScript:
	jumptextfaceplayer KantoMansionRoofFisherText

KantoMansionRoofGraffiti:
	jumptext KantoMansionRoofGraffitiText

KantoMansionRoofFisherText:
	text "Posti alti, li"
	line "adoro!"

	para "Credo che solo le"
	line "nuvole adorino i"

	para "luoghi alti quanto"
	line "me!"
	done

KantoMansionRoofGraffitiText:
	text "Ci sono dei"
	line "graffiti sul muro…"

	para "<PLAYER> aggiunge"
	line "dei baffi!"
	done

KantoMansionRoof_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  1, KANTO_MANSION_3F, 1
	warp_event  6,  1, KANTO_MANSION_3F, 4
	warp_event  2,  7, KANTO_MANSION_ROOF_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  0,  6, BGEVENT_LEFT, KantoMansionRoofGraffiti

	db 1 ; object events
	object_event  1,  3, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoMansionRoofFisherScript, -1
