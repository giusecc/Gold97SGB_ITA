	object_const_def ; object_event constants
	const FROSTPOINTPRYCEHOUSE_POKEFAN_F
	const FROSTPOINTPRYCEHOUSE_TWIN
	const FROSTPOINTPRYCEHOUSE_PRYCE

FrostpointPryceHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FrostpointPryceHousePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_DEEPWATER
	iffalse .PryceVisitsSoonG
	checkevent EVENT_PRYCE_IN_HOME
	iffalse .PryceIsVisitingG
	checkflag ENGINE_GLACIERBADGE
	iffalse .GoBeatPryce
	checkevent EVENT_GOT_HM06_WHIRLPOOL
	iftrue .AlreadyGotWhirlpool
	writetext HereIsWhirlpool
	waitbutton
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext NowYouHaveWhirlpool
	waitbutton
	closetext
	end
	
.AlreadyGotWhirlpool
	writetext PryceVisitingIsMyFavoriteG
	waitbutton
	closetext
	end
	
.PryceVisitsSoonG
	writetext PryceIsComingToVisitG
	waitbutton
	closetext
	end
	
.PryceIsVisitingG
	writetext PryceIsHereG
	waitbutton
	closetext
	end
	
.GoBeatPryce
	writetext GoBeatHimPryce
	waitbutton
	closetext
	end

FrostpointPryceHouseTwinScript:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_DEEPWATER
	iffalse .PryceVisitsSoon
	checkevent EVENT_PRYCE_IN_HOME
	iffalse .PryceIsVisiting
	writetext PryceVisitingIsMyFavorite
	waitbutton
	closetext
	end
	
.PryceVisitsSoon
	writetext PryceIsComingToVisit
	waitbutton
	closetext
	end
	
.PryceIsVisiting
	writetext PryceIsHere
	waitbutton
	closetext
	end
	
FrostpointPryceHousePryceScript:
	faceplayer
	opentext
	writetext FrostpointPryceHousePryceText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .PryceWalksAroundPlayer2
	applymovement FROSTPOINTPRYCEHOUSE_PRYCE, PryceLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FROSTPOINTPRYCEHOUSE_PRYCE
	setevent EVENT_PRYCE_IN_HOME
	clearevent EVENT_PRYCE_IN_GYM
	waitsfx
	end

.PryceWalksAroundPlayer2
	applymovement FROSTPOINTPRYCEHOUSE_PRYCE, PryceLeavesMovement2Alt
	playsound SFX_EXIT_BUILDING
	disappear FROSTPOINTPRYCEHOUSE_PRYCE
	setevent EVENT_PRYCE_IN_HOME
	clearevent EVENT_PRYCE_IN_GYM
	waitsfx
	end
	
PryceLeavesMovement2Alt:
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end
	
PryceLeavesMovement2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end

FrostpointPryceHouseBookshelf:
	jumpstd PictureBookshelfScript
	
HereIsWhirlpool:
	text "Oh, vedo che hai"
	line "ottenuto la"
	para "MEDAGLIA GELO"
	line "da mio marito."
	para "Ecco, ho qualcosa"
	line "che potrebbe"
	para "tornarti utile."
	done
	
NowYouHaveWhirlpool:
	text "Questa MN contiene"
	line "MULINELLO."
	para "È molto utile per"
	line "attraversare le"
	para "acque agitate a"
	line "nord di NIHON."
	done
	
PryceVisitingIsMyFavoriteG:
	text "Rispetto molto la"
	line "dedizione di"
	para "ALFREDO per le sue"
	line "responsabilità."
	done
	
PryceIsComingToVisitG:
	text "ALFREDO, mio"
	line "marito è CAPOPA-"
	para "LESTRA di"
	line "BIANCASELVA."
	para "Deve andare lì"
	line "molto spesso per"
	cont "lottare."
	para "Trascorre anche"
	line "molto tempo ad"
	para "allenarsi nel PAS-"
	line "SAGGIO SOMMERSO."
	para "Ma ci mette sempre"
	line "tanto tempo a"
	cont "tornare a casa."
	para "Dovrebbe essere"
	line "qui presto."
	done
	
PryceIsHereG:
	text "È sempre bello"
	line "avere ALFREDO a"
	cont "casa."
	done
	
GoBeatHimPryce:
	text "Credo che ALFREDO"
	line "ti aspetti per"
	cont "lottare."
	para "Battilo e poi"
	line "ritorna da me."
	para "Ti regalerò"
	line "qualcosa."
	done

PryceVisitingIsMyFavorite:
	text "È fantastico"
	line "quando il nonno"
	cont "viene qui."
	done
	
PryceIsComingToVisit:
	text "Il nonno dovrebbe"
	line "essere presto"
	cont "qui!"
	done
	
PryceIsHere:
	text "Sìì! Il nonno è"
	line "qui!"
	done
	
FrostpointPryceHousePryceText:
	text "Sono felice che"
	line "tu sia qui."
	para "Gli allenatori che"
	line "possono arrivare"
	para "al mio luogo di"
	line "allenamento"
	para "meritano il mio"
	line "rispetto."
	para "Qual è il tuo nome"
	line "dunque?"
	para "<PLAYER>?"
	para "Bene, <PLAYER>,"
	line "come promesso,"
	para "tornerò alla"
	line "PALESTRA."
	para "Mi immagino che tu"
	line "sia un valido"
	cont "avversario!"
	done

FrostpointPryceHousePokefanFText:
;	text "LAVENDER is a"
;	line "tiny, quiet town"
;
;	para "at the foot of the"
;	line "mountains."
;
;	para "It's gotten a bit"
;	line "busier since the"
;
;	para "RADIO TOWER was"
;	line "built."
;	done

FrostpointPryceHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FROSTPOINT_TOWN, 4
	warp_event  5,  7, FROSTPOINT_TOWN, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, FrostpointPryceHouseBookshelf
	bg_event  0,  0, BGEVENT_READ, FrostpointPryceHouseBookshelf

	db 3 ; object events
	object_event  1,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FrostpointPryceHousePokefanFScript, -1
	object_event  5,  2, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FrostpointPryceHouseTwinScript, -1
	object_event  7,  4, SPRITE_PRYCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FrostpointPryceHousePryceScript, EVENT_PRYCE_IN_HOME
