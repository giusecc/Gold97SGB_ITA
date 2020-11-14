	object_const_def ; object_event constants
	const ALLOYGOODRODHOUSE_FISHING_GURU

AlloyGoodRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	buttonsound
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf:
; unused
	jumpstd PictureBookshelfScript

OfferGoodRodText:
	text "Il canale che"
	line "attraversa la"
	para "città è amato"
	line "dai pescatori."
	para "Perché non prendi"
	line "un AMO e vai a"
	cont "pescare anche tu?"
	done

GiveGoodRodText:
	text "Ah, hahah!"
	line "Abbiamo un nuovo"
	cont "pescatore!"
	done

GaveGoodRodText:
	text "I pesci non si"
	line "trovano solo"
	cont "in mare."

	para "Vanno ovunque"
	line "ci sia dell'acqua."
	done

DontWantGoodRodText:
	text "Cooosa? Non ti"
	line "piace pescare!?"
	cont "Assurdo!"
	done

HaveGoodRodText:
	text "Cosa mi racconti?"
	line "Abboccano?"
	done

AlloyGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 6
	warp_event  5,  7, ALLOY_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
