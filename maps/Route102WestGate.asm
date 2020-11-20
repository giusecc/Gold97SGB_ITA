	const_def 1 ; object constants
	const ROUTE102WESTGATE_OFFICER
	const ROUTE102WESTGATE_YOUNGSTER

Route102WestGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route102WestGateOfficerScript:
	jumptextfaceplayer Route102WestGateOfficerText

Route102WestGateOfficerText:
	text "PORTOVEST è una"
	line "metropoli in"
	para "espansione,"
	line "perfetta per gli"
	cont "allenatori."
	done
	
Route102WestGateYoungsterScript:
	jumptextfaceplayer Route102WestGateYoungsterText

Route102WestGateYoungsterText:
	text "Eh!"
	para "Il CENTRO COMMER-"
	line "CIALE di PORTOVEST"
	para "è pieno di forti"
	line "allenatori nei"
	cont "sotterranei!"
	done


Route102WestGate_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  0,  7, WESTPORT_CITY, 3
	warp_event  1,  7, WESTPORT_CITY, 3
	warp_event  8,  7, ROUTE_102, 1
	warp_event  9,  7, ROUTE_102, 1
	warp_event  1,  0, ROUTE_102_WEST_GATE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route102WestGateOfficerScript, -1
	object_event  0,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route102WestGateYoungsterScript, -1

	
