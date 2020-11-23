	object_const_def ; object_event constants
	const SANSKRITGAMBLERMANHOUSE_GAMBLER_MAN

SanskritGamblerManHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SanskritGamblerManHouseGamblerManScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COIN_CASE_FROM_GAMBLER
	iftrue .GotCoinCase
	writetext SanskritGamblerManHouseGamblerManText_Question
	yesorno
	iffalse .Refused
	writetext SanskritGamblerManHouseGamblerManText_Yes
	buttonsound
	verbosegiveitem COIN_CASE
	writetext SanskritGamblerManHouseGamblerManText_GiveCoinCase
	waitbutton
	closetext
	setevent EVENT_GOT_COIN_CASE_FROM_GAMBLER
	end

.Refused:
	writetext SanskritGamblerManHouseGamblerManText_No
	waitbutton
	closetext
	end

.GotCoinCase:
	writetext SanskritGamblerManHouseGamblerManText_After
	waitbutton
	closetext
	end


SanskritGamblerManHouseGamblerManText_Question:
	text "VESTIGIA non ha"
	line "mai avuto un"
	cont "luogo adatto per"
	cont "il gioco."
	para "O almeno finché"
	line "il CASINÒ non"
	cont "ha aperto."
	para "Ho passato troppo"
	line "tempo qui."
	para "Potrebbe essere"
	line "un problema."
	para "Ecco! Tieniti"
	line "questo!"
	done

SanskritGamblerManHouseGamblerManText_Yes:
	text "Grandioso! Forse"
	line "sarai più"
	cont "responsabile!"
	done

SanskritGamblerManHouseGamblerManText_GiveCoinCase:
	text "Il CASINÒ è pieno"
	line "di giochi!"
	para "Ma non farla"
	line "diventare una"
	cont "dipendenza."
	done

SanskritGamblerManHouseGamblerManText_No:
	text "Oh. Credo che"
	line "dovrei lavorare"
	para "sul mio"
	line "autocontrollo…"
	done

SanskritGamblerManHouseGamblerManText_After:
	text "Ah, mi sono tolto"
	line "un bel peso."
	done


SanskritGamblerManHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SANSKRIT_TOWN, 2
	warp_event  5,  7, SANSKRIT_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritGamblerManHouseGamblerManScript, -1
