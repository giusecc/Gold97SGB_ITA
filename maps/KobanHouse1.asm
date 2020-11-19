	object_const_def ; object_event constants
	const KOBANHOUSE_1_CLAIR

KobanHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanHouse1ClairScript:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_14
	iftrue .AfterDratiniGift
	checkitem MACHINE_PART
	iffalse .NoOrbYet
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratiniClair
.AfterDratiniGift
	writetext DragonsAreGreatText
	waitbutton
	closetext
	end
	
.NoOrbYet
	writetext GoGetTheOrbText
	waitbutton
	closetext
	end
	
.GiveDratiniClair
	writetext ClairTakeThisDratiniText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullClair
	writetext ClairPlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
;	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_SWITCH_14
	takeitem MACHINE_PART
;	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext ClairSymbolicDragonText
	waitbutton
	closetext
	end	
	
.PartyFullClair:
	writetext KantoRestaurantPartyFullTextClair
	waitbutton
	closetext
	end
	
ClairPlayerReceivedDratiniText:
	text "<PLAYER> riceve"
	line "DRATINI!"
	done
	
ClairSymbolicDragonText:
	text "I #MON DRAGO"
	line "sono difficili da"
	para "allenare, ma ne"
	line "vale la pena."
	para "So che tratterai"
	line "quel DRATINI"
	cont "al meglio."
	done
	
KantoRestaurantPartyFullTextClair:
	text "Non hai spazio"
	line "nella tua squadra!"
	done
	
ClairTakeThisDratiniText:
	text "Ah! La DRAGOSFERA!"
	para "Hai appreso del"
	line "potere del tipo"
	para "DRAGO!"
	para "Vorrei ricompen-"
	line "sarti con un"
	para "#MON che merita"
	line "di essere allenato"
	para "solo dai più"
	line "forti!"
	done
	
GoGetTheOrbText:
	text "Trova la"
	line "DRAGOSFERA nella"
	para "grotta e"
	line "portamela."
	done
	
DragonsAreGreatText:
	text "Essere un maestro"
	line "del tipo DRAGO"
	para "richiede molta"
	line "dedizione."
	para "È uno stile"
	line "di vita."
	done

KobanHouse1ClairText:
	text "Ehi!"
	done

KobanHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KOBAN_ISLAND, 1
	warp_event  5,  7, KOBAN_ISLAND, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7, 4, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KobanHouse1ClairScript, EVENT_BLUE_FOREST_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
