	object_const_def ; object_event constants
	const KANTOMANSIONROOFHOUSE_PHARMACIST

KantoMansionRoofHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoMansionRoofHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM03_CURSE
	iftrue .GotCurse
	writetext KantoMansionRoofHousePharmacistIntroText
	buttonsound
	checktime NITE
	iftrue .Night
	writetext KantoMansionRoofHousePharmacistNotNightText
	waitbutton
	closetext
	end

.Night:
	writetext KantoMansionRoofHousePharmacistStoryText
	buttonsound
	verbosegiveitem TM_CURSE
	iffalse .NoRoom
	setevent EVENT_GOT_TM03_CURSE
.GotCurse:
	writetext KantoMansionRoofHousePharmacistCurseText
	waitbutton
.NoRoom:
	closetext
	end

KantoMansionRoofHousePharmacistIntroText:
	text "Ti racconto una"
	line "storia spaventosa…"
	done

KantoMansionRoofHousePharmacistNotNightText:
	text "Ora però non ti"
	line "farebbe abbastanza"

	para "paura perché fuori"
	line "è ancora chiaro."

	para "Torna dopo il"
	line "tramonto, va bene?"
	done

KantoMansionRoofHousePharmacistStoryText:
	text "C'era una volta un"
	line "ragazzino, che"

	para "ricevette una"
	line "BICICLETTA nuova…"

	para "Volle subito"
	line "provarla…"

	para "Si divertiva cosi"
	line "tanto da non"

	para "vedere che il sole"
	line "stava calando…"

	para "Si fece buio, e"
	line "mentre tornava"

	para "a casa,"
	line "improvvisamente"
	cont "la bici rallentò."

	para "I pedali si fecero"
	line "pesantissimi."

	para "Quando non poté"
	line "più pedalare, la"

	para "bici iniziò ad"
	line "andare indietro!"

	para "La bici era come"
	line "segnata da una"

	para "maledizione, che"
	line "l'attirava verso"
	cont "il Nulla!"

	para "…"

	para "…"

	para "Ad un certo punto"
	line "s'accorse di star"
	para "pedalando in"
	line "salita!"

	para "…"
	line "Agghiacciante, eh?"

	para "Per aver ascoltato"
	line "con tanta pazienza"
	cont "meriti una MT03!"
	done

KantoMansionRoofHousePharmacistCurseText:
	text "MT03 è"
	line "MALEDIZIONE."

	para "È una terribile"
	line "mossa, che lenta-"

	para "mente prosciuga i"
	line "PS della vittima."
	done

KantoMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, KANTO_MANSION_ROOF, 3
	warp_event  4,  7, KANTO_MANSION_ROOF, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoMansionRoofHousePharmacistScript, -1
