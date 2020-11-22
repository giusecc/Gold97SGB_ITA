	object_const_def ; object_event constants
	const ROUTE109ROUTE110GATE_OFFICER

Route109Route110Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route109Route110GateOfficerScript:
	jumptextfaceplayer Route109Route110GateOfficerText

Route109Route110GateOfficerText:
	text "Da dove vieni?"

	para "BORGO SILENTE?"

	para "Il PROF.OAK si è"
	line "trasferito lì,"
	cont "vero?"

	para "Ne hai fatta di"
	line "strada."
	done

Route109Route110Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_109, 3
	warp_event  5,  7, ROUTE_109, 4
	warp_event  4,  0, ROUTE_110, 1
	warp_event  5,  0, ROUTE_110, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route109Route110GateOfficerScript, -1
