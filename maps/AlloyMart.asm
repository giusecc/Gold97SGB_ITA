	object_const_def ; object_event constants
	const ALLOYMART_CLERK
	const ALLOYMART_COOLTRAINER_F
	const ALLOYMART_LASS

AlloyMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ALLOY
	closetext
	end

AlloyMartCooltrainerFScript:
	jumptextfaceplayer AlloyMartCooltrainerFText

AlloyMartLassScript:
	jumptextfaceplayer AlloyMartLassText

AlloyMartCooltrainerFText:
	text "I tuoi #MON"
	line "conoscono già"

	para "la mossa per"
	line "portare la gente"
	cont "sull'acqua?"
	done

AlloyMartLassText:
	text "Il mio ragazzo"
	line "è di là dal mare:"
	para "mi ha mandato"
	line "un BUTTERFREE!"

	para "Aveva un MESSAGGIO"
	line "con sé."
	
	para "I tuoi #MON"
	line "sanno usare VOLO?"
	done

AlloyMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 8
	warp_event  5,  7, ALLOY_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyMartClerkScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AlloyMartCooltrainerFScript, -1
	object_event  1,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyMartLassScript, -1
