	object_const_def ; object_event constants
	const ROUTE116GATE_SCIENTIST
	const ROUTE116GATE_ROCKET1
	const ROUTE116GATE_ROCKET2

Route116BirdonGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route116BirdonGateRocket1Script:
	opentext
	writetext Route116BirdonGateRocket1Text
	waitbutton
	closetext
	end
	
Route116BirdonGateRocket2Script:
	opentext
	writetext Route116BirdonGateRocket2Text
	waitbutton
	closetext
	end

Route116BirdonGateScientistScript:
	faceplayer
	opentext
	checkevent EVENT_103_SLOWPOKE_SALESMAN
	iftrue .NoBirdonRockets
	writetext Route116BirdonGateScientistText
	waitbutton
	closetext
	end

.NoBirdonRockets:
	writetext Route116BirdonGateScientistTextNoRockets
	waitbutton
	closetext
	end
	
Route116BirdonGateRocket1Text:
	text "Fufufufu…"
	para "Il prossimo lotto"
	line "di CODASLOWPOKE"
	para "dovrebbe arrivare"
	line "presto…"
	done
	
Route116BirdonGateRocket2Text:
	text "Hehehehe…"
	para "Nessuno si"
	line "accorgerà delle"
	para "CODE mancanti"
	line "prima che sia"
	cont "troppo tardi…"
	done

Route116BirdonGateScientistText:
	text "Questi sembrano"
	line "membri del"
	cont "TEAM ROCKET."
	para "Lo sono davvero?"
	para "Vorrei dirgli di"
	line "andarsene, ma"
	para "mi ho paura…"
	done
	
Route116BirdonGateScientistTextNoRockets:
	text "Qui fuori c'è"
	line "un labirinto di"
	para "alberi e grotte"
	line "da attraversare."
	para "Preparati!"
	done

Route116BirdonGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_116, 1
	warp_event  5,  0, ROUTE_116, 2
	warp_event  4,  7, BIRDON_TOWN, 7
	warp_event  5,  7, BIRDON_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route116BirdonGateScientistScript, -1
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route116BirdonGateRocket1Script, EVENT_103_SLOWPOKE_SALESMAN
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route116BirdonGateRocket2Script, EVENT_103_SLOWPOKE_SALESMAN
	
