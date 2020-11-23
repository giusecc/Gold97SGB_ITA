	object_const_def ; object_event constants
	const STANDMART_CLERK
	const STANDMART_FISHER
	const STANDMART_COOLTRAINER_F

StandMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StandMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_STAND
	closetext
	end

StandMartFisherScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .StandMartFisherRocketsGone
	writetext StandMartFisherText
	waitbutton
	closetext
	end
	
.StandMartFisherRocketsGone
	writetext StandMartFisherText2
	waitbutton
	closetext
	end

StandMartCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .StandMartCooltrainerFRocketsGone
	writetext StandMartCooltrainerFText
	waitbutton
	closetext
	end
	
.StandMartCooltrainerFRocketsGone
	writetext StandMartCooltrainerFText2
	waitbutton
	closetext
	end

StandMartFisherText:
	text "Mi chiedo se la"
	line "chiusura dello"
	para "ZOO influirà su"
	line "questo #MON-"
	cont "MARKET…"
	done
	
StandMartFisherText2:
	text "Speravo di poter"
	line "comprare dei"
	para "souvenir dello"
	line "ZOO di INERTOPOLI,"
	para "ma questo negozio"
	line "non ne vende."
	done

StandMartCooltrainerFText:
	text "Hai affrontato"
	line "ANGELO?"
	para "È un ragazzo"
	line "cupo, ma è un"
	cont "ottimo lottatore."
	done

StandMartCooltrainerFText2:
	text "Oh! La MEDAGLIA"
	line "CREPUSCOLO!"
	para "È stata una"
	line "dura lotta?"
	done

StandMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, STAND_CITY, 1
	warp_event  5,  7, STAND_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandMartClerkScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandMartFisherScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandMartCooltrainerFScript, -1
