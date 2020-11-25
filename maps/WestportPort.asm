	object_const_def ; object_event constants
	const WESTPORTPORT_SAILOR1
;	const WESTPORTPORT_SAILOR2
	const WESTPORTPORT_SAILOR3
	const WESTPORTPORT_FISHING_GURU1
	const WESTPORTPORT_FISHING_GURU2
	const WESTPORTPORT_YOUNGSTER
	const WESTPORTPORT_COOLTRAINER_F

WestportPort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_WESTPORTPORT_LEAVE_SHIP

	db 0 ; callbacks

.DummyScene0:
	end

.LeaveFastShip:
	priorityjump .LeaveFastShipScript
	end

.LeaveFastShipScript:
	applymovement PLAYER, MovementData_0x74a32
	appear WESTPORTPORT_SAILOR1
	setscene SCENE_DEFAULT
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod ALLOY_CITY
	end

WestportPortSailorAtGangwayScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue WestportPortAlreadyRodeScript
	writetext UnknownText_0x74a55
	waitbutton
	closetext
	turnobject WESTPORTPORT_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear WESTPORTPORT_SAILOR1
	waitsfx
	applymovement PLAYER, MovementData_0x74a30
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	clearevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_COOLTRAINERM_SEAN
	clearevent EVENT_BEAT_COOLTRAINERF_CAROL
	clearevent EVENT_BEAT_GENTLEMAN_EDWARD
	clearevent EVENT_BEAT_BEAUTY_CASSIE
	clearevent EVENT_BEAT_PSYCHIC_RODNEY
	clearevent EVENT_BEAT_SUPER_NERD_SHAWN
	clearevent EVENT_BEAT_SAILOR_GARRETT
	clearevent EVENT_BEAT_FISHER_JONAH
	clearevent EVENT_BEAT_BLACKBELT_WAI
.FirstTime:
	clearevent EVENT_FAST_SHIP_DESTINATION_ALLOY
	appear WESTPORTPORT_SAILOR1
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_ENTER_SHIP
	warp FAST_SHIP_1F, 25, 1
	end

WestportPortSailorAtGangwayScriptTeknos:
	faceplayer
	opentext
	writetext UnknownText_0x74a55
	waitbutton
	closetext
	turnobject WESTPORTPORT_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear WESTPORTPORT_SAILOR1
	waitsfx
	applymovement PLAYER, MovementData_0x74a30
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing UP, TEKNOS_PORT, 4, 9
	end

WestportPortAlreadyRodeScript:
	writetext UnknownText_0x74a80
	waitbutton
	closetext
	end

WestportPortWalkUpToShipScript:
	appear WESTPORTPORT_SAILOR1
	turnobject WESTPORTPORT_SAILOR3, RIGHT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .skip
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .skip
	turnobject PLAYER, LEFT
	checkflag ENGINE_HIVEBADGE
	iftrue WestportPortSailorFerryToTeknosScript
	opentext
	writetext WestportPortSailorBeforeHOFText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end
	
.skip:
	end

WestportPortSailorOriginalScript:
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .NextShipMonday
	ifequal SATURDAY, .NextShipMonday
	ifequal TUESDAY, .NextShipFriday
	ifequal WEDNESDAY, .NextShipFriday
	ifequal THURSDAY, .NextShipFriday
.FirstTime:
	writetext UnknownText_0x74a9c
	yesorno
	iffalse WestportPortNotRidingMoveAwayScript
	writetext UnknownText_0x74ada
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext UnknownText_0x74b11
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	applymovement PLAYER, MovementData_0x74a37
	jump WestportPortSailorAtGangwayScript

.NoTicket:
	writetext UnknownText_0x74b41
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.NextShipMonday:
	writetext UnknownText_0x74ba8
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.NextShipFriday:
	writetext UnknownText_0x74bce
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.skip:
	end
	
WestportPortSailorFerryToTeknosScript:
	faceplayer
	opentext
	writetext WestportPortSailorGoToTeknosText
	yesorno
	iffalse .NotGoing
	writetext WestportPortSailorGoToTeknosText2
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a37
	jump WestportPortSailorAtGangwayScriptTeknos
	end
	
	
.NotGoing:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue WestportPortSailorOriginalScript
	writetext WestportPortSailorNotGoingToTeknosText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

WestportPortNotRidingScript:
	writetext UnknownText_0x74af6
	waitbutton
	closetext
	end

WestportPortNotRidingMoveAwayScript:
	writetext UnknownText_0x74af6
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

WestportPortSailorAfterHOFScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue WestportPortAlreadyRodeScript
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .NextShipMonday
	ifequal SATURDAY, .NextShipMonday
	ifequal TUESDAY, .NextShipFriday
	ifequal WEDNESDAY, .NextShipFriday
	ifequal THURSDAY, .NextShipFriday
.FirstTime:
	writetext UnknownText_0x74a9c
	yesorno
	iffalse WestportPortNotRidingScript
	writetext UnknownText_0x74ada
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext UnknownText_0x74b11
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkcode VAR_FACING
	ifequal RIGHT, .Right
	applymovement PLAYER, MovementData_0x74a3f
	jump WestportPortSailorAtGangwayScript

.Right:
	applymovement PLAYER, MovementData_0x74a49
	jump WestportPortSailorAtGangwayScript

.NoTicket:
	writetext UnknownText_0x74b41
	waitbutton
	closetext
	end

.NextShipMonday:
	writetext UnknownText_0x74ba8
	waitbutton
	closetext
	end

.NextShipFriday:
	writetext UnknownText_0x74bce
	waitbutton
	closetext
	end

WestportPortSailorBeforeHOFScript:

	end



WestportPortFishingGuru1Script:
	faceplayer
	opentext
	writetext WestportPortFishingGuru1Text
	waitbutton
	closetext
	turnobject WESTPORTPORT_FISHING_GURU1, UP
	end

WestportPortFishingGuru2Script:
	faceplayer
	opentext
	writetext WestportPortFishingGuru2Text
	waitbutton
	closetext
	turnobject WESTPORTPORT_FISHING_GURU2, UP
	end

WestportPortYoungsterScript:
	faceplayer
	opentext
	writetext WestportPortYoungsterText
	waitbutton
	closetext
	turnobject WESTPORTPORT_YOUNGSTER, DOWN
	end

WestportPortCooltrainerFScript:
	faceplayer
	opentext
	writetext WestportPortCooltrainerFText
	waitbutton
	closetext
	turnobject WESTPORTPORT_COOLTRAINER_F, DOWN
	end

WestportPortHiddenProtein:
	hiddenitem PROTEIN, EVENT_WESTPORT_PORT_HIDDEN_PROTEIN

MovementData_0x74a30:
	step DOWN
	step_end

MovementData_0x74a32:
	step UP
	step_end

MovementData_0x74a34:
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x74a37:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74a3f:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74a49:
	step UP
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

WestportPortSailorNotGoingToTeknosText:
	text "Vieni da noi"
	line "un'altra volta!"
	done

WestportPortSailorGoToTeknosText:
	text "Benvenuto ai MOLI"
	line "di PORTOVEST."
	para "Vuoi prendere un"
	line "traghetto per"
	cont "TECNOPOLI?"
	done

WestportPortSailorGoToTeknosText2:
	text "Ok! In partenza"
	line "per TECNOPOLI."
	done

UnknownText_0x74a55:
	text "Stiamo per"
	line "partire. Sali"
	cont "a bordo."
	done

UnknownText_0x74a80:
	text "Scusa, non puoi"
	line "salire ora."
	done

UnknownText_0x74a9c:
	text "Facciamo viaggi"
	line "anche verso le"
	para "ISOLE SUDOC-"
	line "CIDENTALI."
	para "Vuoi andare lì?"
	done

UnknownText_0x74ada:
	text "Posso vedere"
	line "il BIGL.NAVE?"
	done

UnknownText_0x74af6:
	text "Speriamo di"
	line "rivederti!"
	done

UnknownText_0x74b11:
	text "<PLAYER> mostra"
	line "il BIGL.NAVE."

	para "Perfetto."
	line "Grazie!"
	done

UnknownText_0x74b41:
	text "<PLAYER> prova"
	line "a mostrare il"
	cont "BIGL.NAVE…"

	para "… Ma non ce"
	line "l'ha!"

	para "Mi spiace!"
	line "I viaggi per le"
	para "isole richiedono"
	line "un BIGL.NAVE."
	done

UnknownText_0x74ba8:
	text "Il prossimo"
	line "viaggio per"
	para "PORTOVEST partirà"
	line "lunedì."
	para "Oggi ci sono"
	line "solo traghetti"
	cont "per TECNOPOLI."
	done

UnknownText_0x74bce:
	text "Il prossimo"
	line "viaggio per"
	para "PORTOVEST partirà"
	line "venerdì."
	para "Oggi ci sono"
	line "solo traghetti"
	cont "per TECNOPOLI."
	done

WestportPortFishingGuru1Text:
	text "Gli SHELLDER"
	line "si trovano"
	para "facilmente qui."

	para "Sono molto rari"
	line "altrove."
	done

WestportPortFishingGuru2Text:
	text "Hai un AMO?"

	para "AMI differenti"
	line "servono per #-"
	cont "MON differenti."
	done

WestportPortYoungsterText:
	text "La M/N ACQUA usa"
	line "propulsori per"
	cont "solcare le onde!"
	done

WestportPortCooltrainerFText:
	text "Ci sono molti"
	line "#MON sulle"
	cont "ISOLE."

	para "Vorrei andarci…"
	done

WestportPortSailorBeforeHOFText:
	text "Ci dispiace, i"
	line "MOLI di PORTOVEST"
	para "sono chiusi per"
	line "manutenzione."
	para "Sembri un"
	line "allenatore forte."
	para "Hai già sfidato"
	line "RAFFAELLO?"
	para "Perché non lo"
	line "sfidi e torni"
	cont "più tardi?"
	para "Potremmo aver"
	line "finito il nostro"
	cont "lavoro per allora."
	done


WestportPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  7, WESTPORT_PORT_PASSAGE, 5
	warp_event  7, 23, FAST_SHIP_1F, 1

	db 1 ; coord events
	coord_event  7, 15, SCENE_DEFAULT, WestportPortWalkUpToShipScript

	db 1 ; bg events
	bg_event  1, 22, BGEVENT_ITEM, WestportPortHiddenProtein

	db 6 ; object events
	object_event  7, 23, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortSailorAtGangwayScript, EVENT_WESTPORT_PORT_SAILOR_AT_GANGWAY
;	object_event  6, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortSailorBeforeHOFScript, EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  6, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortSailorAfterHOFScript, -1
	object_event  4, 12, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortFishingGuru1Script, EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  3,  9, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortFishingGuru2Script, EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  2, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortYoungsterScript, EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event 11, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortCooltrainerFScript, EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
