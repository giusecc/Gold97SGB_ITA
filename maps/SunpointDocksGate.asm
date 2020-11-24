	object_const_def ; object_event constants
	const SUNPOINTDOCKSGATE_OFFICER

SunpointDocksGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SunpointDocksGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	iftrue .NoMoreBadBoat
	writetext SunpointDocksGateOfficerRocketsText
	waitbutton
	closetext
	end

.NoMoreBadBoat:
	writetext SunpointDocksGateOfficerGoodText
	waitbutton
	closetext
	end

SunpointDocksGateOfficerRocketsText:
	text "Sta succedendo"
	line "qualcosa di strano"
	cont "ai MOLI."
	para "Alcuni loschi"
	line "figuri hanno"
	para "portato svariate"
	line "merci da questo"
	cont "passaggio."
	para "Non sembrano"
	line "infrangere la"
	para "legge, quindi"
	line "credo che non sia"
	cont "affare mio…"
	para "Ma mi mettono"
	line "a disagio…"
	done

SunpointDocksGateOfficerGoodText:
	text "I MOLI di ELIOPOLI"
	line "sono sempre"
	cont "trafficati."
	done

SunpointDocksGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, SUNPOINT_DOCKS, 2
	warp_event  5,  0, SUNPOINT_DOCKS, 3
	warp_event  4,  7, SUNPOINT_CITY, 8
	warp_event  5,  7, SUNPOINT_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SunpointDocksGateOfficerScript, -1
