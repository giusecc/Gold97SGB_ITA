	object_const_def ; object_event constants
	const NANJO_FOREST_YOUNGSTER
	const NANJO_FOREST_BUG_CATCHER
	const NANJO_FOREST_SILVER
	const NANJO_FOREST_ITEMBALL_1
	const NANJO_FOREST_ITEMBALL_2
	const NANJO_FOREST_ITEMBALL_3
	const NANJO_FOREST_ITEMBALL_4
	const NANJO_FOREST_TREE_1
	const NANJO_FOREST_TREE_2

NanjoForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeekSZ
	
.CheckDayOfWeekSZ:
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WednesdaySZ
.disapearSZSilver
	disappear NANJO_FOREST_SILVER
	return
	
.WednesdaySZ
	checkevent EVENT_EXPLODING_TRAP_16
	iftrue .disapearSZSilver
	appear NANJO_FOREST_SILVER
	return

WisdomOrbYoungsterScript:
	faceplayer
	checkevent EVENT_EXPLODING_TRAP_12
	iftrue .AlreadyGaveWisdomOrb
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .TryGivingWisdomOrb
.NoWisdomOrbYet
	opentext
	writetext NoWisdomOrbYetText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.TryGivingWisdomOrb
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .NoWisdomOrbYet
	checkevent EVENT_EXPLODING_TRAP_11
	iffalse .SetUpWisdomOrb
	opentext
	writetext HeresWisdomOrbText
	waitbutton
	verbosegiveitem WISDOM_ORB
	iffalse .NoOrbFull
	writetext WhatDoesWisdomOrbDoText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_12
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.NoOrbFull
	closetext
	end
	
.SetUpWisdomOrb
	opentext
	writetext NoWisdomOrbYetText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_11
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.AlreadyGaveWisdomOrb
	opentext
	writetext AlreadyGaveWisdomOrbText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
WisdomOrbBugCatcherScript:
	faceplayer
	opentext
	writetext WisdomOrbBugCatcherText
	waitbutton
	closetext
	turnobject NANJO_FOREST_BUG_CATCHER, RIGHT
	end
	
NanjoFruitTree1:
	fruittree FRUITTREE_KIKAI_STRAIT
	
NanjoFruitTree2:
	fruittree FRUITTREE_TROPICAL_ISLAND_JUNGLE
	
NanjoForestSilverScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .TalkToSilverAfterBattle
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	writetext NanjoForestSilverBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .Happa
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CRUISEAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Cruise:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_HAPPA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Happa:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_16
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	playmapmusic
	end
	
.TalkToSilverAfterBattle
	faceplayer
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	end
	

NanjoForestMaxRevive:
	itemball MAX_REVIVE

NanjoForestUltraBall:
	itemball ULTRA_BALL

NanjoForestFullHeal:
	itemball FULL_HEAL

NanjoForestFullRestore:
	itemball FULL_RESTORE
	
NanjoForestSign:
	jumptext NanjoForestSignText
	
NanjoForestSign2:
	jumptext NanjoForestSign2Text
	
NanjoForestSignText:
	text "NON GETTARE"
	line " I RIFIUTI "
	para "Portali con te."
	done
	
NanjoForestSign2Text:
	text "Uscita per"
	line "STRETTO ORIENTALE"
	done
	
NanjoForestSilverBefore:
	text "<RIVAL>: Ehi,"
	line "<PLAYER>!"
	para "Quanto tempo!"
	para "Sono venuto sulle"
	line "ISOLE per conti-"
	para "nuare l'allena-"
	line "mento e rafforzare"
	para "il legame con i"
	line "#MON."
	para "Ho imparato molto"
	line "sul lavoro di"
	cont "squadra."
	para "Siamo migliorati"
	line "molto."
	para "E siamo anche"
	line "diventati più"
	cont "forti!"
	para "Sai cosa intendo!"
	done
	
NanjoForestSilverTextWin:
	text "Mi hai sconfitto!"
	done
	
NanjoForestSilverTextLoss:
	text "E va bene!"
	done
	
NanjoForestSilverAfter:
	text "È stata una bella"
	line "lotta."
	para "Credo di aver"
	line "concluso il"
	cont "mio allenamento."
	para "Forse ci troveremo"
	line "altrove!"
	done
	
WhatDoesWisdomOrbDoText:
	text "Mi chiedo da"
	line "dove venga."
	para "Che sia di un"
	line "#MON?"
	done
	
HeresWisdomOrbText:
	text "Ehi! Guarda qua!"
	para "È una specie di"
	line "sfera."
	para "Non so cosa sia,"
	line "ma puoi tenerla!"
	done
	
AlreadyGaveWisdomOrbText:
	text "Non sai mai cosa"
	line "puoi trovare da"
	cont "queste parti."
	done
	
NoWisdomOrbYetText:
	text "Vado alla ricerca"
	line "di oggetti inte-"
	para "ressanti sulla"
	line "riva."
	para "Trovo un sacco di"
	line "strumenti come"
	para "POZIONI e"
	line "CURE TOTALI."
	para "Una volta ho tro-"
	line "vato una PEPITA!"
	para "Puoi trovare"
	line "di tutto qui."
	para "Vieni da me"
	line "ogni tanto."
	para "Potrei darti"
	line "qualcosa che"
	cont "ho trovato."
	done
	
WisdomOrbBugCatcherText:
	text "Io e mio fratello"
	line "troviamo tanta"
	para "roba sulla riva!"
	para "Per noi non è"
	line "spazzatura, perché"
	para "talvolta troviamo"
	line "dei tesori!"
	done	

NanjoForest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0, 18, URASOE_TRAIL, 3
	warp_event  0, 19, URASOE_TRAIL, 4
	warp_event 39,  6, GREAT_EAST_STRAIT, 1
	warp_event 39,  7, GREAT_EAST_STRAIT, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 29, 21, BGEVENT_READ, NanjoForestSign
	bg_event 37,  7, BGEVENT_READ, NanjoForestSign2

	db 9 ; object events
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WisdomOrbYoungsterScript, -1
	object_event 23,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WisdomOrbBugCatcherScript, -1
	object_event  6,  8, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NanjoForestSilverScript, EVENT_EXPLODING_TRAP_15
	object_event 26, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestMaxRevive, EVENT_PICKED_UP_BERRY_FROM_KABUTO_ITEM_ROOM
	object_event 12,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestUltraBall, EVENT_PICKED_UP_PSNCUREBERRY_FROM_KABUTO_ITEM_ROOM
	object_event  8, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullHeal, EVENT_PICKED_UP_HEAL_POWDER_FROM_KABUTO_ITEM_ROOM
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullRestore, EVENT_PICKED_UP_ENERGYPOWDER_FROM_KABUTO_ITEM_ROOM
	object_event 27, 28, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NanjoFruitTree1, -1
	object_event 10, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NanjoFruitTree1, -1
