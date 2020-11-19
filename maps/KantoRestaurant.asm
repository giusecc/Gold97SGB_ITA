	object_const_def ; object_event constants
	const KANTOCAFE2_SUPER_NERD
	const KANTOCAFE2_FISHER1
	const KANTOCAFE2_FISHER2
	const KANTOCAFE2_FISHER3
	const KANTOCAFE2_TEACHER

KantoRestaurant_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoCafe2Chef:
	faceplayer
	opentext
	writetext ChefText_Eatathon
	waitbutton
	closetext
	end

KantoCafe2Fisher1:
	opentext
	writetext Fisher1Text_Snarfle
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher1Text_Concentration
	waitbutton
	closetext
	turnobject KANTOCAFE2_FISHER1, LEFT
	end

KantoCafe2Fisher2:
	opentext
	writetext Fisher2Text_GulpChew
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher2Text_Quantity
	waitbutton
	closetext
	turnobject KANTOCAFE2_FISHER2, RIGHT
	end

KantoCafe2Fisher3:
	opentext
	writetext Fisher3Text_MunchMunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher3Text_WestportIsBest
	waitbutton
	closetext
	turnobject KANTOCAFE2_FISHER3, RIGHT
	end

KantoCafe2Teacher:
	checkitem COIN_CASE
	iftrue .HasCoinCase
	opentext
	writetext TeacherText_CrunchCrunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext TeacherText_NoCoinCase
	waitbutton
	closetext
	turnobject KANTOCAFE2_TEACHER, LEFT
	end

.HasCoinCase:
	opentext
	writetext TeacherText_KeepEating
	waitbutton
	closetext
	turnobject KANTOCAFE2_TEACHER, RIGHT
	opentext
	writetext TeacherText_MoreChef
	waitbutton
	closetext
	turnobject KANTOCAFE2_TEACHER, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

KantoCafe2Trashcan:
	checkevent EVENT_FOUND_LEFTOVERS_IN_KANTO_CAFE
	iftrue .TrashEmpty
	giveitem MYSTERYBERRY
	iffalse .PackFull
	opentext
	itemtotext MYSTERYBERRY, MEM_BUFFER_0
	writetext FoundLeftoversText2
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_FOUND_LEFTOVERS_IN_KANTO_CAFE
	end

.PackFull:
	opentext
	itemtotext MYSTERYBERRY, MEM_BUFFER_0
	writetext FoundLeftoversText2
	buttonsound
	writetext NoRoomForLeftoversText2
	waitbutton
	closetext
	end

.TrashEmpty:
	jumpstd TrashCanScript

ChefText_Eatathon:
	text "Salve!"

	para "Stiamo facendo una"
	line "gara di cibo."

	para "Non possiamo"
	line "servirti ora."
	done

Fisher1Text_Snarfle:
	text "…Gnam gnam…"
	done

Fisher1Text_Concentration:
	text "Non parlarmi!"

	para "Mi farai perdere"
	line "la concentrazione!"
	done

Fisher2Text_GulpChew:
	text "…Gulp… Gnam…"
	done

Fisher2Text_Quantity:
	text "Alla qualità"
	line "preferisco la"
	cont "quantità!"

	para "Mi piace sentirmi"
	line "sazio!"
	done

Fisher3Text_MunchMunch:
	text "Gnam gnam…"
	done

Fisher3Text_WestportIsBest:
	text "Qui si mangia"
	line "bene, ma"
	para "DESMOPOLI è il"
	line "meglio."
	done

TeacherText_CrunchCrunch:
	text "Gnam… gnam…"
	done

TeacherText_NoCoinCase:
	text "Qui non si trovano"
	line "SALVADANAI. Devi"

	para "procurartelo"
	line "altrove."
	done

TeacherText_KeepEating:
	text "Gnam… gnam…"

	para "Voglio altro cibo!"
	done

TeacherText_MoreChef:
	text "Cameriere, ancora!"
	done

EatathonContestPosterText:
	text "Grande Abbuffata!"
	line "Nessun limite di"

	para "tempo: una gara"
	line "interminabile! Il"

	para "miglior mangione"
	line "non paga il conto!"
	done

FoundLeftoversText2:
	text "<PLAYER> trova"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

NoRoomForLeftoversText2:
	text "Ma <PLAYER> non"
	line "può portare altri"
	cont "strumenti…"
	done

KantoRestaurant_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  9, KANTO_REGION, 30
	warp_event  5,  9, KANTO_REGION, 31

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, EatathonContestPoster
	bg_event  9,  9, BGEVENT_READ, KantoCafe2Trashcan

	db 5 ; object events
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KantoCafe2Chef, -1
	object_event  2,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCafe2Fisher1, -1
	object_event  7,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoCafe2Fisher2, -1
	object_event  7,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCafe2Fisher3, -1
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCafe2Teacher, -1
