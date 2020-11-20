	object_const_def ; object_event constants
	const ROUTE101_COOLTRAINER_M1
	const ROUTE101_YOUNGSTER
	const ROUTE101_TEACHER1
	const ROUTE101_FRUIT_TREE
	const ROUTE101_POKE_BALL

Route101_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE101_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE101_CATCH_TUTORIAL

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end



Route101Tutorial1:
	turnobject ROUTE101_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE101_COOLTRAINER_M1, 15
	applymovement ROUTE101_COOLTRAINER_M1, DudeMovementData1a
	turnobject PLAYER, DOWN
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial1
	closetext
	follow ROUTE101_COOLTRAINER_M1, PLAYER
	applymovement ROUTE101_COOLTRAINER_M1, DudeMovementData1b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE101_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE101_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Route101Tutorial2:
	turnobject ROUTE101_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE101_COOLTRAINER_M1, 15
	applymovement ROUTE101_COOLTRAINER_M1, DudeMovementData2a
	turnobject PLAYER, DOWN
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial2
	closetext
	follow ROUTE101_COOLTRAINER_M1, PLAYER
	applymovement ROUTE101_COOLTRAINER_M1, DudeMovementData2b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE101_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE101_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Script_RefusedTutorial1:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	setscene SCENE_ROUTE101_NOTHING
	end

Script_RefusedTutorial2:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	setscene SCENE_ROUTE101_NOTHING
	end

CatchingTutorialDudeScript:
	faceplayer
	opentext
	checkcode VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .BoxFull
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_OAK2
	iffalse .BoxFull
	writetext CatchingTutorialRepeatText
	yesorno
	iffalse .Declined
	closetext
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

.BoxFull:
	writetext CatchingTutorialBoxFullText
	waitbutton
	closetext
	end

.Declined:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	end

Route101YoungsterScript:
	jumptextfaceplayer Route101YoungsterText

Route101TeacherScript:
	jumptextfaceplayer Route101TeacherText


Route101Sign1:
	jumptext Route101Sign1Text


SilentHillsEntranceSign:
	jumptext SilentHillsEntranceSignText
	
DebugSign:
;	setflag ENGINE_RADIO_CARD
;	setflag ENGINE_ZEPHYRBADGE
;	setflag ENGINE_HIVEBADGE
;	setflag ENGINE_PLAINBADGE
;	setflag ENGINE_FOGBADGE
 ;	setflag ENGINE_MINERALBADGE
;	setflag ENGINE_STORMBADGE
;	setflag ENGINE_RISINGBADGE
;	setflag ENGINE_GLACIERBADGE
;	giveitem HM_FLY
;	giveitem HM_WATERFALL
;	giveitem HM_SURF
;	giveitem HM_CUT
;	giveitem HM_STRENGTH
;	giveitem HM_WHIRLPOOL
;	giveitem TM_FLASH
;	giveitem HM_ROCK_SMASH
	giveitem RARE_CANDY, 99
	giveitem RARE_CANDY, 99
	giveitem RARE_CANDY, 99
	giveitem RARE_CANDY, 99
	giveitem RARE_CANDY, 99
	giveitem RARE_CANDY, 99
	giveitem MASTER_BALL, 99
;	giveitem HELIX_FOSSIL
;	giveitem DOME_FOSSIL
;	giveitem LONG_TONGUE
;	giveitem LONG_VINE
;	giveitem OLD_AMBER
;	giveitem APPLE, 10
;	giveitem SNAKESKIN
;	giveitem PRETTY_TAIL
;	giveitem EARTHEN_CLAY
;	giveitem STIMULUS_ORB
;	giveitem CONFUSE_CLAW
;	giveitem FOCUS_ORB
;	giveitem CALM_SEED
;	giveitem WATER_TAIL
;	giveitem FIRE_TAIL
;	giveitem THUNDER_TAIL
;	giveitem WISDOM_ORB
;	giveitem DETECT_ORB
;	giveitem ENERGY_WALL
;	giveitem STEEL_SHELL
;	giveitem POWER_WINGS
	givepoke CRUISEAL, 5
	givepoke HAPPA, 5
	givepoke FARFETCH_D, 5
	givepoke KOTORA, 5
	givepoke WOLFAN, 5
	jumptext DebugSignText
	end

Route101FruitTree:
	fruittree FRUITTREE_ROUTE_101

Route101Potion:
	itemball POTION
	

DudeMovementData1a:
	step UP
	step UP
	step_end

DudeMovementData2a:
	step UP
	step_end

DudeMovementData1b:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end

DudeMovementData2b:
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end
	
DebugSignText:
	text "Cartello debug"
	done

CatchingTutorialBoxFullText:
	text "I #MON si"
	line "nascondono"
	cont "nell'erba alta."

	para "Nessuno sa quando"
	line "usciranno…"
	done

CatchingTutorialIntroText:
	text "Ehi!"

	para "Sembri un allena-"
	line "tore alle prime"
	cont "armi!"
	
	para "Scommetto che vuoi"
	line "catturare qualche"
	cont "#MON!"

	para "Vuoi che ti mostri"
	line "come fare?"
	done

CatchingTutorialDebriefText:
	text "Si fa così!"

	para "Se indebolisci un"
	line "#MON, sarà più"
	cont "facile prenderlo!"
	done

CatchingTutorialDeclinedText:
	text "Oh. Capisco."

	para "Se vuoi prendere"
	line "tanti #MON"

	para "dovrai camminare"
	line "a lungo."
	done

CatchingTutorialRepeatText:
	text "Come? Vuoi che"
	line "ti mostri come"
	para "catturare i"
	line "#MON?"
	done

Route101YoungsterText:
	text "Ciao! Come stanno"
	line "i tuoi #MON?"

	para "Se sono deboli,"
	line "stai lontano"
	cont "dall'erba alta."
	done

Route101TeacherText:
	text "Vedi quei salti?"
	line "Fanno un po' paura"
	cont "ma ti permettono"

	para "di trovare molte"
	line "scorciatoie."
	done

Route101Sign1Text:
	text "PERCORSO 101"

	para "BORGO SILENTE -"
	line "ANCESTRALIA"
	
	para "PIANE SILENTI"
	line "in mezzo."
	done

SilentHillsEntranceSignText:
	text "PIANE SILENTI"
	
	para "Ingresso a"
	line "sinistra."
	done

Route101_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8,  8, SILENT_HILLS, 8
	warp_event  8,  9, SILENT_HILLS, 9

	db 2 ; coord events
	coord_event 23,  8, SCENE_ROUTE101_CATCH_TUTORIAL, Route101Tutorial1
	coord_event 23,  9, SCENE_ROUTE101_CATCH_TUTORIAL, Route101Tutorial2

	db 3 ; bg events
	bg_event 20,  8, BGEVENT_READ, Route101Sign1
	bg_event 12,  7, BGEVENT_READ, SilentHillsEntranceSign
	bg_event 16,  2, BGEVENT_READ, DebugSign

	db 5 ; object events
	object_event 23, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CatchingTutorialDudeScript, -1
	object_event 12,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route101YoungsterScript, -1
	object_event 17,  7, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route101TeacherScript, -1
	object_event 22,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route101FruitTree, -1
	object_event 23,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route101Potion, EVENT_ROUTE_101_POTION
