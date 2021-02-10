	object_const_def ; object_event constants
	const ROUTE106PAGOTAGATE2F_LASS
	const ROUTE106PAGOTAGATE2F_TWIN

Route101PagotaGate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

	
Route101PagotaGate2FLassScript:
	jumptextfaceplayer Route101PagotaGate2FLassText

Route101PagotaGate2FLassText:
	text "Hai mai sentito"
	line "parlare di FRANZ?"
	para "Se si interessa"
	line "a te, c'è sotto"
	para "qualcosa di"
	line "importante."
	done
	
Route101PagotaGate2FTwinScript:
	jumptextfaceplayer Route101PagotaGate2FTwinText

Route101PagotaGate2FTwinText:
	text "Sei un turista?"
	para "Se lo sei è un"
	line "peccato… Non"
	para "tutti possono"
	line "entrare nella"
	cont "PENTATORRE."
	done
	
Route101PagotaGate2FSign:
	jumptext Route101PagotaGate2FSignText
	
Route101PagotaGate2FSignText:
	text "<PLAYER> guarda"
	line "attraverso"
	cont "il binocolo!"
	para "Uauh! Si vede una"
	line "TORRE altissima!"
	done

Route101PagotaGate2FSign2:
	jumptext Route101PagotaGate2FSign2Text
	
Route101PagotaGate2FSign2Text:
	text "<PLAYER> guarda"
	line "attraverso"
	cont "il binocolo!"
	para "Si vede un fiume"
	line "in lontananza."
	done
	
Route101PagotaGate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, ROUTE_101_PAGOTA_GATE, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1,  0, BGEVENT_READ, Route101PagotaGate2FSign
	bg_event 3,  0, BGEVENT_READ, Route101PagotaGate2FSign2

	db 2 ; object events
	object_event  1,  3, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route101PagotaGate2FLassScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101PagotaGate2FTwinScript, -1
	
