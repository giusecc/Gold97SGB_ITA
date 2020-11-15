	object_const_def ; object_event constants
	const BLUE_FORESTMART_CLERK
	const BLUE_FORESTMART_COOLTRAINER_M
	const BLUE_FORESTMART_BLACK_BELT

BlueForestMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_BLUE_FOREST
	closetext
	end

BlueForestMartCooltrainerMScript:
	jumptextfaceplayer BlueForestMartCooltrainerMText

BlueForestMartBlackBeltScript:
	jumptextfaceplayer BlueForestMartBlackBeltText

BlueForestMartCooltrainerMText:
	text "Non puoi comprare"
	line "REVITALIZZANTE"

	para "MAX, che ridà tut-"
	line "ta la salute ad un"
	cont "#MON esausto."

	para "Attenzione: non"
	line "restituisce i PP,"

	para "PUNTI POTENZA, che"
	line "servono per le"
	cont "mosse."
	done

BlueForestMartBlackBeltText:
	text "REPELLENTE MAX"
	line "tiene alla larga i"
	cont "#MON deboli."

	para "È lo spray REPEL-"
	line "LENTE che dura più"
	cont "a lungo."
	done

BlueForestMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BLUE_FOREST, 4
	warp_event  5,  7, BLUE_FOREST, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestMartClerkScript, -1
	object_event  9,  6, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestMartCooltrainerMScript, -1
	object_event  4,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestMartBlackBeltScript, -1
