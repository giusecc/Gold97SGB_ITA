	object_const_def ; object_event constants
	const KUMESHIPPARTSHOUSE_GURU

KumeShipPartsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FuelLineGuruScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .SSAquaDoingGreat
	checkevent EVENT_GOT_FUEL_LINE
	iffalse .GiveCard
	writetext AlreadyGotFuelLineText
	waitbutton
	closetext
	end
	
.SSAquaDoingGreat
	writetext SSAquaDoingGreatText
	waitbutton
	closetext
	end
	
.GiveCard
	writetext YouNeedAFuelLine
	waitbutton
	verbosegiveitem CARD_KEY
	writetext AlreadyGotFuelLineText
	waitbutton
	closetext
	setevent EVENT_GOT_FUEL_LINE
	end
	
SSAquaDoingGreatText:
	text "Hey, ragazzo!"
	para "Ho saputo che la"
	line "M/N ACQUA è di"
	para "nuovo a danzare"
	line "sulle onde!"
	done
	
YouNeedAFuelLine:
	text "Salve!"
	para "Hai bisogno di"
	line "pezzi di ricambio"
	cont "per una nave?"
	para "Sei nel posto"
	line "giusto!"
	para "…"
	para "Oh!"
	para "La M/N ACQUA ha"
	line "bisogno di un"
	cont "nuovo TUBO?"
	para "Ti darò il pezzo"
	line "che ti serve!"
	done
	
AlreadyGotFuelLineText:
	text "Bene, ragazzo."
	para "Questo dovrebbe"
	line "andare bene."
	para "Sarai l'eroe della"
	line "ciurma!"
	done

KumeShipPartsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, KUME_CITY, 3
	warp_event  3,  7, KUME_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuelLineGuruScript, -1
