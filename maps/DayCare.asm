	object_const_def ; object_event constants
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY

DayCare_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_113
	return

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_113
	return

DayCareManScript_Inside:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	writetext DayCareManText_GiveOddEgg
	buttonsound
	closetext
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	opentext
	writetext DayCareText_GotOddEgg
	playsound SFX_KEY_ITEM
	waitsfx
	writetext DayCareText_DescribeOddEgg
	waitbutton
	closetext
	setevent EVENT_GOT_ODD_EGG
	end

.PartyFull:
	opentext
	writetext DayCareText_PartyFull
	waitbutton
	closetext
	end

.AlreadyHaveOddEgg:
	special DayCareMan
	waitbutton
	closetext
	end

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .HusbandWasLookingForYou
	special DayCareLady
	waitbutton
	closetext
	end

.HusbandWasLookingForYou:
	writetext Text_GrampsLookingForYou
	waitbutton
	closetext
	end

DayCareBookshelf:
	jumpstd DifficultBookshelfScript

Text_GrampsLookingForYou:
	text "Mio marito ti"
	line "sta cercando."
	done

Text_DayCareManTalksAboutEggTicket:
	text "Sono il PADRONE"
	line "della PENSIONE."

	para "C'è qualcosa di"
	line "nuovo a PORTOVEST,"

	para "lo chiamano"
	line "CENTRO SCAMBI."

	para "Mi hanno dato un"
	line "BIGLIETTO UOVO"

	para "che può essere"
	line "scambiato per un"
	cont "UOVO MISTERO."

	para "Ma dovendo star"
	line "dietro alla"
	cont "PENSIONE non ne"

	para "ho bisogno. Ti"
	line "potrebbe servire."
	done

DayCareManText_GiveOddEgg:
	text "Sono il PADRONE"
	line "della PENSIONE."

	para "Conosci la storia"
	line "delle UOVA?"

	para "Stavo accudendo i"
	line "#MON con"
	cont "mia moglie."

	para "E cosa troviamo?"
	line "Un UOVO!"

	para "È incredibile,"
	line "vero?"

	para "Ti piace"
	line "quest'UOVO?"

	para "Bene allora, puoi"
	line "tenerlo!"
	done

DayCareText_ComeAgain:
	text "Torna presto."
	done

DayCareText_GotOddEgg:
	text "<PLAYER> riceve"
	line "UOVO MISTERO!"
	done

DayCareText_DescribeOddEgg:
	text "L'ho trovato"
	line "accudendo un #-"

	para "MON di un altro"
	line "allenatore."

	para "Ma lui non voleva"
	line "quest'UOVO, quindi"

	para "l'ho tenuto io."
	done

DayCareText_PartyFull:
	text "Non hai spazio"
	line "per prenderlo."
	done

DayCare_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, ROUTE_106, 7
	warp_event  1,  7, ROUTE_106, 7
	warp_event  4,  7, ROUTE_106, 8
	warp_event  5,  7, ROUTE_106, 8

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, DayCareBookshelf
	bg_event  1,  0, BGEVENT_READ, DayCareBookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAY_CARE_MAN_IN_DAY_CARE
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
