	object_const_def ; object_event constants
	const AMAMITOWNSUPERRODHOUSE_FISHING_GURU

AmamiTownSuperRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiTownSuperRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotSuperRod
	writetext OfferSuperRodText
	yesorno
	iffalse .Refused
	writetext GiveSuperRodText
	buttonsound
	verbosegiveitem SUPER_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_SUPER_ROD
.GotSuperRod:
	writetext GaveSuperRodText
	waitbutton
	closetext
	end

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	closetext
	end

SuperRodHouseBookshelf:
; unused
	jumpstd PictureBookshelfScript

OfferSuperRodText:
	text "Vedo che ti piace"
	line "pescare."

	para "Non c'è dubbio,"
	line "ti piace proprio!"

	para "È così, vero? So"
	line "cho ho ragione."
	done

GiveSuperRodText:
	text "Sì, sì! Proprio"
	line "come pensavo!"

	para "Per il tuo amore"
	line "per la pesca ti"
	cont "darò un SUPER AMO."
	done

GaveSuperRodText:
	text "Allenati pescando"
	line "ovunque ci sia"
	cont "dell'acqua."

	para "E ricorda: AMI"
	line "diversi permettono"

	para "di pescare"
	line "#MON diversi."
	
	para "Il SUPER AMO è"
	line "il migliore di"
	cont "tutti!"
	done

DontWantSuperRodText:
	text "Ma come? Allora ho"
	line "visto male."
	done

AmamiTownSuperRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, AMAMI_TOWN, 8
	warp_event  5,  7, AMAMI_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiTownSuperRodHouseFishingGuruScript, -1
