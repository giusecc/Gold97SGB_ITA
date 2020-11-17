	object_const_def ; object_event constants
	const IEJIMA_HOUSE1_GRAMPS

IejimaHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
IejimaTownGrampsAfter:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEM_FROM_IEJIMA_GRAMPS
	iftrue .GotItemGramps
	writetext IejimaGrampsThanksText
	buttonsound
	verbosegiveitem LONG_VINE
	iffalse .NoRoom
	setevent EVENT_GOT_ITEM_FROM_IEJIMA_GRAMPS
.GotItemGramps:
	writetext IejimaGrampsThanksText2
	waitbutton
.NoRoom:
	closetext
	end
	
IejimaGrampsThanksText:
	text "Ohoho!"
	para "Hai fatto scorrere"
	line "l'acqua di nuovo!"
	para "IEJIMA non era"
	line "più la stessa"
	cont "senza!"
	para "Lascia che ti dia"
	line "qualcosa per"
	cont "ringraziarti!"
	done
	
IejimaGrampsThanksText2:
	text "Dallo a un"
	line "#MON e"
	para "sarà più facile"
	line "catturare i"
	para "#MON"
	line "selvatici!"
	done

	
IejimaHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, IEJIMA_TOWN, 3
	warp_event  5,  7, IEJIMA_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownGrampsAfter, EVENT_IEJIMA_TOWN_NOT_FIXED
