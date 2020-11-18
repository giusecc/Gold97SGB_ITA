	object_const_def ; object_event constants
	const JADEFOREST_ROCKER
	const JADEFOREST_POKE_BALL1
	;const JADEFOREST_KURT
	const JADEFOREST_LASS
	const JADEFOREST_YOUNGSTER2
	const JADEFOREST_POKE_BALL2
	const JADEFOREST_POKE_BALL3
	const JADEFOREST_POKE_BALL4
	const JADEFOREST_HIKER
	const JADEFOREST_FIREBREATHER
	const JADEFOREST_COOLTRAINERF
	const ROUTEU4U_FRUIT_TREE1
	const ROUTEU4U_FRUIT_TREE2
	const ROUTEU4U_FRUIT_TREE3

JadeForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


JadeForestHeadbuttGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .AlreadyGotHeadbutt
	writetext Text_HeadbuttIntro
	buttonsound
	verbosegiveitem TM_HEADBUTT
	iffalse .BagFull
	setevent EVENT_GOT_TM02_HEADBUTT
.AlreadyGotHeadbutt:
	writetext Text_HeadbuttOutro
	waitbutton
.BagFull:
	closetext
	end

TrainerBugCatcherWayne:
	trainer BUG_CATCHER, WAYNE, EVENT_BEAT_BUG_CATCHER_WAYNE, BugCatcherWayneSeenText, BugCatcherWayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherWayneAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerLeonard:
	trainer HIKER, LEONARD, EVENT_BEAT_HIKER_LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerLeonardAfterBattleText
	waitbutton
	closetext
	end
	

TrainerFirebreatherBill:
	trainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBillAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfGwen:
	trainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfGwenAfterBattleText
	waitbutton
	closetext
	end

JadeForestLassScript:
	jumptextfaceplayer Text_JadeForestLass

JadeForestRevive:
	itemball REVIVE

JadeForestXAttack:
	itemball PRETTY_TAIL

JadeForestAntidote:
	itemball ANTIDOTE

JadeForestEther:
	itemball ETHER

JadeForestHiddenEther:
	hiddenitem ETHER, EVENT_JADE_FOREST_HIDDEN_ETHER

JadeForestHiddenSuperPotion:
	hiddenitem POWER_WINGS, EVENT_JADE_FOREST_HIDDEN_SUPER_POTION

JadeForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_JADE_FOREST_HIDDEN_FULL_HEAL

JadeForestBoulder:
; unused
	jumpstd StrengthBoulderScript

JadeForestSignpost:
	clearevent EVENT_BEAT_BUG_CATCHER_WAYNE
	jumptext JadeForestSignpostText

JadeForestSignpost2:
	jumptext JadeForestSignpost2Text
	

RouteU4UFruitTree1:
	fruittree FRUITTREE_ROUTE_U4U_1

RouteU4UFruitTree2:
	fruittree FRUITTREE_ROUTE_U4U_2

RouteU4UFruitTree3:
	fruittree FRUITTREE_ROUTE_U4U_3

Text_HeadbuttIntro:
	text "Che sto facendo?"

	para "Scrollo gli alberi"
	line "con BOTTINTESTA."

	para "È divertente."
	line "Vuoi provare?"
	done

Text_HeadbuttOutro:
	text "Se scrolli gli"
	line "alberi con"
	para "BOTTINTESTA"
	line "possono cadere dei"
	cont "#MON."
	done

Text_JadeForestLass:
	text "Ci sono molti"
	line "#MON nel"
	para "BOSCO, con mosse"
	line "che possono"
	para "causare problemi"
	line "di stato."
	para "È una buona idea"
	line "avere gli strumen-"
	cont "ti adatti."
	done

JadeForestSignpostText:
	text "Il BOSCO GIADA è"
	line "così pieno di"

	para "alberi, che non"
	line "puoi vedere il"
	cont "cielo!"

	para "Fai attenzione"
	line "agli strumenti che"
	cont "puoi trovare!"
	done
	
JadeForestSignpost2Text:
	text "A destra si trova"
	line "il PERCORSO 106."
	done

BugCatcherWayneSeenText:
	text "Non fare così!"

	para "Hai spaventato un"
	line "#MON!"
	done

BugCatcherWayneBeatenText:
	text "Non avevo mai"
	line "visto quel"
	cont "#MON…"
	done

BugCatcherWayneAfterBattleText:
	text "Un #MON che"
	line "non avevo mai"

	para "visto è caduto"
	line "dall'albero quando"
	para "ho usato"
	line "BOTTINTESTA."

	para "Dovre usare"
	line "BOTTINTESTA anche"
	cont "altrove."
	done


HikerLeonardSeenText:
	text "Starò nel BOSCO"
	line "finché non avrò"
	para "visto tutti i"
	line "#MON che"
	cont "vivono qui!"
	done

HikerLeonardBeatenText:
	text "Dovrei continuare"
	line "le mie escursioni!"
	done

HikerLeonardAfterBattleText:
	text "Il BOSCO è pieno"
	line "di #MON che non"
	para "che non ci sono"
	line "altrove."
	done


FirebreatherBillSeenText:
	text "Nulla in questo"
	line "BOSCO può"
	para "resistere ai miei"
	line "#MON FUOCO!"
	done

FirebreatherBillBeatenText:
	text "Ouch!"
	done

FirebreatherBillAfterBattleText:
	text "Devo stare attento"
	line "a non appiccare"
	cont "incendi."
	done
	

CooltrainerfGwenSeenText:
	text "Non mi sono perso!"
	para "E se è così, la"
	line "mia squadra è"
	cont "pronta!"
	done

CooltrainerfGwenBeatenText:
	text "È importante"
	line "essere preparati."
	done

CooltrainerfGwenAfterBattleText:
	text "So dove sto"
	line "andando!"
	done

JadeForest_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  0, 26, ROUTE_106, 3
	warp_event  0, 27, ROUTE_106, 4
	warp_event 49, 26, ROUTE_106, 5
	warp_event 49, 27, ROUTE_106, 6
	warp_event  4, 56, ROUTE_U10U, 4
	warp_event  4, 57, ROUTE_U10U, 5
	warp_event  4,  4, JADE_FOREST_SNORLAX_ROOM, 1
	warp_event  5,  4, JADE_FOREST_SNORLAX_ROOM, 2
	
	db 0 ; coord events

	db 5 ; bg events
	bg_event 27, 41, BGEVENT_READ, JadeForestSignpost
	bg_event 32,  6, BGEVENT_ITEM, JadeForestHiddenEther
	bg_event 13, 55, BGEVENT_ITEM, JadeForestHiddenSuperPotion
	bg_event 30, 53, BGEVENT_ITEM, JadeForestHiddenFullHeal
	bg_event 39, 29, BGEVENT_READ, JadeForestSignpost2

	db 13 ; object events
	object_event 19,  8, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JadeForestHeadbuttGuyScript, -1
	object_event 23, 55, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JadeForestRevive, EVENT_JADE_FOREST_REVIVE
	;object_event 12, 29, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_JADE_FOREST_KURT
	object_event 17, 23, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, JadeForestLassScript, -1
	object_event 34, 40, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerBugCatcherWayne, -1
	object_event 31, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JadeForestXAttack, EVENT_JADE_FOREST_X_ATTACK
	object_event 31, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JadeForestAntidote, EVENT_JADE_FOREST_ANTIDOTE
	object_event 42,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JadeForestEther, EVENT_JADE_FOREST_ETHER
	object_event 27, 35, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerHikerLeonard, -1
	object_event 43, 51, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	object_event 19, 46, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfGwen, -1
	object_event 13, 49, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RouteU4UFruitTree1, -1
	object_event 12, 51, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RouteU4UFruitTree2, -1
	object_event 15, 51, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RouteU4UFruitTree3, -1

