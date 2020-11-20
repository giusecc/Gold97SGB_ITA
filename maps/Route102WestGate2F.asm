	object_const_def ; object_event constants
	const ROUTE102WESTGATE2F_FISHER

Route102WestGate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

	
Route102WestGate2FFisherScript:
	faceplayer
	opentext
	checkflag ENGINE_HIVEBADGE
	iftrue .DocksOpen
	writetext DocksClosedText
	waitbutton
	closetext
	end
	
.DocksOpen
	writetext Route102WestGate2FFisherText
	waitbutton
	closetext
	end

Route102WestGate2FFisherText:
	text "Dal MOLO di"
	line "PORTOVEST partono"
	para "i traghetti per"
	line "TECNOPOLI."
	para "Dovresti provare"
	line "a prenderne uno!"
	done
	
DocksClosedText:
	text "Dal MOLO di"
	line "PORTOVEST partono"
	para "i traghetti per"
	line "TECNOPOLI, ma"
	para "ora è chiuso."
	done
	
	
Route102WestGate2FSign:
	jumptext Route102WestGate2FSignText
	
Route102WestGate2FSignText:
	text "<PLAYER> guarda"
	line "attraverso il"
	cont "binocolo!"
	para "Si vede un'isola"
	line "a nord di qui!"
	done

Route102WestGate2FSign2:
	jumptext Route102WestGate2FSign2Text
	
Route102WestGate2FSign2Text:
	text "<PLAYER> guarda"
	line "attraverso il"
	cont "binocolo!"
	para "È la TORRE RADIO"
	line "di PORTOVEST?"
	done
	
Route102WestGate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, ROUTE_102_WEST_GATE, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1,  0, BGEVENT_READ, Route102WestGate2FSign
	bg_event 3,  0, BGEVENT_READ, Route102WestGate2FSign2

	db 1 ; object events
	object_event  3,  3, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route102WestGate2FFisherScript, -1
	
