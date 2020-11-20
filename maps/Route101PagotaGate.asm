	object_const_def ; object_event constants
	const ROUTE106PAGOTAGATE_OFFICER
	const ROUTE106PAGOTAGATE_COOLTRAINER_F
	const ROUTE106PAGOTAGATE_YOUNGSTER

Route101PagotaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route101PagotaGateOfficerScript:
	jumptextfaceplayer Route101PagotaGateOfficerText

Route101PagotaGateCooltrainerFScript:
	jumptextfaceplayer Route101PagotaGateCooltrainerFText
	
Route101PagotaGateYoungsterScript:
	jumptextfaceplayer Route101PagotaGateYoungsterText

Route101PagotaGateYoungsterText:
	text "Da qui si arriva"
	line "ad ANCESTRALIA!"
	done

Route101PagotaGateOfficerText:
	text "Ehi!"
	line "Sei venuto per"
	para "la PENTATORRE"
	line "di ANCESTRALIA?"
	done

Route101PagotaGateCooltrainerFText:
	text "Sono andato troppo"
	line "lontano. Dovrei"
	cont "chiamare a casa!"
	done

Route101PagotaGate_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4,  0, PAGOTA_CITY, 9
	warp_event  5,  0, PAGOTA_CITY, 8
	warp_event  4,  7, ROUTE_101N, 2
	warp_event  5,  7, ROUTE_101N, 1
	warp_event  1,  0, ROUTE_101_PAGOTA_GATE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route101PagotaGateYoungsterScript, -1
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route101PagotaGateOfficerScript, -1
	object_event  2,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101PagotaGateCooltrainerFScript, -1
