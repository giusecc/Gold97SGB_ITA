	object_const_def ; object_event constants
	const BLUEFORESTROUTE111GATE_OFFICER
	const BLUEFORESTROUTE111GATE_YOUNGSTER

BlueForestRoute111Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestRoute111GateOfficerScript:
	jumptextfaceplayer BlueForestRoute111GateOfficerText

BlueForestRoute111GateYoungsterScript:
	jumptextfaceplayer BlueForestRoute111GateYoungsterText

BlueForestRoute111GateOfficerText:
	text "NIHON è conosciuta"
	line "per le forti"
	cont "correnti a nord."
	para "La zona delle"
	line "ISOLE VORTICOSE è"
	para "il migliore"
	line "esempio di ciò!"
	para "Non andare a nord"
	line "impreparato!"
	done

BlueForestRoute111GateYoungsterText:
	text "Dicono che le"
	line "ISOLE VORTICOSE"
	para "siano piene di"
	line "#MON rari."
	done

BlueForestRoute111Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_111, 3
	warp_event  5,  0, ROUTE_111, 4
	warp_event  4,  7, BLUE_FOREST, 9
	warp_event  5,  7, BLUE_FOREST, 10

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestRoute111GateOfficerScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestRoute111GateYoungsterScript, -1
