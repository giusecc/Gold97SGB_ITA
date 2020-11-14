	const_def 1 ; object constants
	const ALLOYROUTE107GATE_OFFICER

AlloyRoute107Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyRoute107GateOfficerScript:
	jumptextfaceplayer AlloyRoute107GateOfficerText

AlloyRoute107GateOfficerText:
	text "Fai attenzione se"
	line "vuoi attraversare"
	para "l'oceano per ISOLA"
	line "ZUCCHERINO."
	para "Le acque sono"
	line "mosse. Ti serve"
	para "la mossa di"
	line "un #MON."
	done


AlloyRoute107Gate_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4,  0, ROUTE_107, 1
	warp_event  5,  0, ROUTE_107, 2
	warp_event  4,  7, ALLOY_CITY, 10
	warp_event  5,  7, ALLOY_CITY, 12
	warp_event  1,  0, ALLOY_ROUTE_107_GATE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AlloyRoute107GateOfficerScript, -1
	
