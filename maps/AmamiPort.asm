	object_const_def ; object_event constants
	const AMAMIPORT_SAILOR1
	const AMAMIPORT_SAILOR2
	const AMAMIPORT_SUPER_NERD

AmamiPort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_AMAMIPORT_LEAVE_SHIP

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.LeaveFastShip:
	priorityjump .LeaveFastShipScript
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_AMAMI
	return

.LeaveFastShipScript:
	applymovement PLAYER, MovementData_0x74ef3
	appear AMAMIPORT_SAILOR1
	setscene SCENE_DEFAULT
;	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
;	setevent EVENT_RETURNED_FUEL_LINE
	setevent EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	clearevent EVENT_WESTPORT_PORT_PASSAGE_POKEFAN_M
	setevent EVENT_FAST_SHIP_FIRST_TIME
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod AMAMI_TOWN
	end

AmamiPortSailorAtGangwayScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue AmamiPortAlreadyRodeScript
	writetext UnknownText_0x74f06
	waitbutton
	closetext
	turnobject AMAMIPORT_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear AMAMIPORT_SAILOR1
	waitsfx
	applymovement PLAYER, MovementData_0x74ef1
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	setevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	clearevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_POKEMANIAC_ETHAN
	clearevent EVENT_BEAT_BURGLAR_COREY
	clearevent EVENT_BEAT_BUG_CATCHER_KEN
	clearevent EVENT_BEAT_GUITARIST_CLYDE
	clearevent EVENT_BEAT_POKEFANM_JEREMY
	clearevent EVENT_BEAT_POKEFANF_GEORGIA
	clearevent EVENT_BEAT_SAILOR_KENNETH
	clearevent EVENT_BEAT_TEACHER_SHIRLEY
	clearevent EVENT_BEAT_SCHOOLBOY_NATE
	clearevent EVENT_BEAT_SCHOOLBOY_RICKY
	setevent EVENT_FAST_SHIP_DESTINATION_ALLOY
	appear AMAMIPORT_SAILOR1
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_ENTER_SHIP
	warp FAST_SHIP_1F, 25, 1
	end

AmamiPortAlreadyRodeScript:
	writetext UnknownText_0x74f31
	waitbutton
	closetext
	end

AmamiPortWalkUpToShipScript:
	turnobject AMAMIPORT_SAILOR2, RIGHT
	checkevent EVENT_RETURNED_FUEL_LINE
	iffalse .StillNeedToReturnPart
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .skip
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .skip
	turnobject PLAYER, LEFT
	opentext
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .NextShipWednesday
	ifequal TUESDAY, .NextShipWednesday
	ifequal THURSDAY, .NextShipSunday
	ifequal FRIDAY, .NextShipSunday
	ifequal SATURDAY, .NextShipSunday
	writetext UnknownText_0x74f4d
	yesorno
	iffalse AmamiPortNotRidingMoveAwayScript
	writetext UnknownText_0x74f8b
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext AmamiPortSSTicketText
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	applymovement PLAYER, MovementData_0x74ef8
	jump AmamiPortSailorAtGangwayScript

.NoTicket:
	writetext UnknownText_0x74ff2
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

.NextShipWednesday:
	writetext UnknownText_0x75059
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

.NextShipSunday:
	writetext UnknownText_0x75080
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

.skip:
	end
	
.StillNeedToReturnPart
	turnobject PLAYER, LEFT
	opentext
	writetext GoGetThePart
	waitbutton
	closetext
	checkitem CARD_KEY
	iftrue .GiveFuelLine
	applymovement PLAYER, MovementData_0x74ef5
	end

.GiveFuelLine
	showemote EMOTE_SHOCK, AMAMIPORT_SAILOR2, 15
	opentext
	writetext YouHaveTheFuelLine
	waitbutton
	closetext
	takeitem CARD_KEY
	applymovement PLAYER, MovementData_0x74ef5
	applymovement AMAMIPORT_SAILOR2, SailorWalksToShipAndBack
	opentext
	writetext ThanksForTheFuelLine
	waitbutton
	closetext
	setevent EVENT_RETURNED_FUEL_LINE
	applymovement AMAMIPORT_SAILOR2, SailorGoesBackToHisSpot
	clearevent EVENT_TELEPORT_GUY
	end

AmamiPortNotRidingScript:
	writetext UnknownText_0x74fa7
	waitbutton
	closetext
	end

AmamiPortNotRidingMoveAwayScript:
	writetext UnknownText_0x74fa7
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

AmamiPortSailorScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue AmamiPortAlreadyRodeScript
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .NextShipWednesday
	ifequal TUESDAY, .NextShipWednesday
	ifequal THURSDAY, .NextShipSunday
	ifequal FRIDAY, .NextShipSunday
	ifequal SATURDAY, .NextShipSunday
	writetext UnknownText_0x74f4d
	yesorno
	iffalse AmamiPortNotRidingScript
	writetext UnknownText_0x74f8b
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext AmamiPortSSTicketText
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	applymovement PLAYER, MovementData_0x74efe
	jump AmamiPortSailorAtGangwayScript

.NoTicket:
	writetext UnknownText_0x74ff2
	waitbutton
	closetext
	end

.NextShipWednesday:
	writetext UnknownText_0x75059
	waitbutton
	closetext
	end

.NextShipSunday:
	writetext UnknownText_0x75080
	waitbutton
	closetext
	end

AmamiPortSuperNerdScript:
	faceplayer
	opentext
	writetext UnknownText_0x750a6
	waitbutton
	closetext
	end

AmamiPortHiddenIron:
	hiddenitem IRON, EVENT_AMAMI_PORT_HIDDEN_IRON
	
SailorWalksToShipAndBack:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step LEFT
	step RIGHT
	step LEFT
	step RIGHT
	step LEFT
	step RIGHT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end
	
SailorGoesBackToHisSpot:
	step LEFT
	turn_head RIGHT
	step_end

MovementData_0x74ef1:
	step DOWN
	step_end

MovementData_0x74ef3:
	step UP
	step_end

MovementData_0x74ef5:
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x74ef8:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74efe:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
ThanksForTheFuelLine:
	text "Grazie, ragazzo!"
	para "La M/N ACQUA è"
	line "di nuovo"
	cont "operativa!"
	para "Non potrò mai"
	line "ringraziarti"
	cont "abbastanza!"
	para "Vai dal CAPITANO"
	line "non appena"
	cont "sarai a bordo."
	para "Sono sicuro che"
	line "ti darà qualcosa"
	cont "per ringraziarti!"
	done
	
YouHaveTheFuelLine:
	text "Ah! Il TUBO!"
	para "Grazie!"
	para "Lascia che lo"
	line "porti"
	cont "all'equipaggio!"
	done
	
GoGetThePart:
	text "Allora, ragazzo"
	line "abbiamo bisogno"
	cont "di un TUBO."
	para "C'è un tipo a"
	line "KUME che ti"
	cont "potrà aiutare."
	para "Portalo qui il"
	line "prima possibile!"
	done

UnknownText_0x74f06:
	text "Siamo in partenza."
	line "Sali a bordo!"
	done

UnknownText_0x74f31:
	text "Mi spiace, ora non"
	line "puoi imbarcarti."
	done

UnknownText_0x74f4d:
	text "Questa è la NAVE"
	line "VELOCE M/N ACQUA."

	para "Vuoi imbarcarti"
	line "ora?"
	done

UnknownText_0x74f8b:
	text "Posso vedere il"
	line "BIGLIETTO NAVE?"
	done

UnknownText_0x74fa7:
	text "Arrivederci!"
	done

AmamiPortSSTicketText:
	text "<PLAYER> mostra"
	line "il BIGL. NAVE."

	para "Benissimo, grazie."
	done

UnknownText_0x74ff2:
	text "<PLAYER> vuole"
	line "mostrare il BIGL."
	cont "NAVE…"

	para "…Ma non ce l'ha!"

	para "Spiacente!"
	line "Puoi imbarcarti"

	para "soltanto se hai"
	line "un BIGL. NAVE."
	done

UnknownText_0x75059:
	text "La NAVE VELOCE"
	line "salperà mercoledì"
	cont "prossimo."
	done

UnknownText_0x75080:
	text "La NAVE VELOCE"
	line "salperà domenica."
	done

UnknownText_0x750a6:
	text "Vieni dalla"
	line "terraferma?"

	para "So che si sono"
	line "molti #MON"
	cont "laggiù."
	done

AmamiPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13,  7, AMAMI_PORT_PASSAGE, 5
	warp_event  7, 17, FAST_SHIP_1F, 1

	db 1 ; coord events
	coord_event  7, 11, SCENE_DEFAULT, AmamiPortWalkUpToShipScript

	db 1 ; bg events
	bg_event 16, 13, BGEVENT_ITEM, AmamiPortHiddenIron

	db 3 ; object events
	object_event  7, 17, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiPortSailorAtGangwayScript, EVENT_AMAMI_PORT_SAILOR_AT_GANGWAY
	object_event  6, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiPortSailorScript, -1
	object_event 11, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiPortSuperNerdScript, -1
