	object_const_def ; object_event constants
	const HALLOFFAME_LANCE

HallOfFame_MapScripts:
	db 2 ; scene scripts
	scene_script .EnterHallOfFame ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.EnterHallOfFame:
	priorityjump .EnterHallOfFameScript
	end

.DummyScene:
	end

.EnterHallOfFameScript:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, HallOfFame_WalkUpWithLance
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext HallOfFame_LanceText
	waitbutton
	closetext
	turnobject HALLOFFAME_LANCE, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	setscene SCENE_FINISHED
	pause 15
	writebyte HEALMACHINE_HALL_OF_FAME
	special HealMachineAnim
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_REMATCH_AVAILABLE_FALKNER
	setevent EVENT_REMATCH_AVAILABLE_BUGSY
	setevent EVENT_REMATCH_AVAILABLE_WHITNEY
	setevent EVENT_REMATCH_AVAILABLE_MORTY
	setevent EVENT_REMATCH_AVAILABLE_JASMINE
	setevent EVENT_REMATCH_AVAILABLE_PRYCE
	setevent EVENT_REMATCH_AVAILABLE_OKERA
	setevent EVENT_REMATCH_AVAILABLE_RED
	setevent EVENT_DECO_GOLD_TROPHY
	setevent EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_OAK
	iftrue .SkipPhoneCall
	specialphonecall SPECIALCALL_SSTICKET
.SkipPhoneCall:
	halloffame
	end

HallOfFame_WalkUpWithLance:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step UP
	step_end

HallOfFame_LanceText:
	text "LANCE: Era da un"
	line "bel po' che non"
	cont "entravo qui."

	para "In questo posto"
	line "i CAMPIONI della"

	para "LEGA sono onorati"
	line "per sempre."

	para "Anche i loro"
	line "valorosi #MON"
	cont "possono accedervi."

	para "Oggi assistiamo"
	line "alla nascita di"

	para "un nuovo CAMPIONE,"
	line "un allenatore che"

	para "ha dimostrato"
	line "affetto e fiducia"

	para "verso i suoi"
	line "#MON."

	para "Un allenatore che"
	line "si è fatto strada"

	para "con tenacia e"
	line "determinazione."

	para "Il nuovo CAMPIONE"
	line "della LEGA, che"

	para "ha tutti i tratti"
	line "di una grande"
	cont "personalità."

	para "<PLAYER>, oggi"
	line "proclamo te e"

	para "i tuoi #MON"
	line "CAMPIONI!"
	done

HallOfFame_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 13, LANCES_ROOM, 3
	warp_event  5, 13, LANCES_ROOM, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4, 12, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
