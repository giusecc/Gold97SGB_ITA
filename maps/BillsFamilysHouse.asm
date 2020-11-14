	object_const_def ; object_event constants
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillScript:
	faceplayer
	opentext
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .GiveCut
	writetext BillGoGetBadge
	waitbutton
	closetext
	
	end
	
;BillScript:
;	faceplayer
;	opentext
;	checkevent EVENT_GOT_EEVEE
;	iftrue .GotEevee
;	writetext BillTakeThisEeveeText
;	yesorno
;	iffalse .Refused
;	writetext BillImCountingOnYouText
;	buttonsound
;	waitsfx
;	checkcode VAR_PARTYCOUNT
;	ifequal PARTY_LENGTH, .NoRoom
;	writetext ReceivedEeveeText
;	playsound SFX_CAUGHT_MON
;	waitsfx
;	givepoke EEVEE, 20
;	setevent EVENT_GOT_EEVEE
;	writetext BillEeveeMayEvolveText
;	waitbutton
;	closetext
;	end

.GiveCut
	checkevent EVENT_GOT_HM01_CUT
	iftrue .GotCut
	writetext BillTakeThisCutText
	yesorno
	iffalse .Refused
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM01_CUT
	writetext BillImCountingOnYouText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotCut:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsPopText
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText
	waitbutton
	closetext
	end

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	buttonsound
	jump .Refused

EarlsMuseumBookshelf1:
	jumpstd PictureBookshelfScript
	
EarlsMuseumBookshelf2:
	jumpstd MagazineBookshelfScript

EarlsMuseumRadio:
	jumpstd Radio2Script
	
BillGoGetBadge:
	text "Ehi! Non dovresti"
	line "vedere questo!"
	para "Ho cambiato la"
	line "sequenza di eventi"
	para "in modo che tu non"
	line "arrivi qui senza"
	para "medaglie!"
	line "C'è qualcosa"
	para "che non funziona"
	line "qui!"
	done

BillTakeThisCutText:
	text "BILL: Ciao!"
	line "Lascia un attimo"
	para "che mi"
	line "presenti!"
	para "Sono BILL! Ho"
	line "creato il "
	para "Sistema Memoria"
	line "#MON!"
	para "Spero che possa"
	line "esserti utile."
	para "Se vuoi andare"
	line "in giro, credo"
	para "di avere altro"
	line "che potrebbe"
	para "servirti."
	line "Ecco a te!"
	done

BillImCountingOnYouText:
	text "La mossa TAGLIO"
	line "permette di libe-"
	para "rarsi di piccoli"
	line "arbusti!"
	para "Ti sarà molto"
	line "utile!"
	para "E ricorda, diver-"
	line "samente dalle MT,"
	para "le MN possono es-"
	line "sere riutilizzate."
	para "Buona fortuna per"
	line "la tua avventura"
	cont "da allenatore!"
	para "Ci si vede!"
	done

ReceivedEeveeText:
	text "<PLAYER> riceve"
	line "EEVEE!"
	done

BillEeveeMayEvolveText:
	text "BILL: il PROF.OAK"
	line "dice che EEVEE"

	para "può evolversi in"
	line "modi finora"
	cont "sconosciuti!"
	done

BillPartyFullText:
	text "Oh, aspetta! Non"
	line "puoi tenere"
	cont "altri #MON."
	done

BillNoEeveeText:
	text "Oh… Beh, potrebbe"
	line "servirti prima o"
	cont "poi…"
	done

BillPopWontWorkText:
	text "BILL: Ehi <PLAYER>!"
	line "Spero che il tuo"
	para "viaggio stia"
	line "andando bene!"
	done

BillsPopText:
	text "Oh, collezioni"
	line "#MON? Mio"
	para "figlio BILL è"
	line "un esperto!"
	done

BillsMomText:
	text "Mio marito era"
	line "conosciuto come"

	para "#FANATICO."
	line "BILL deve aver"

	para "preso tutto"
	line "da lui."
	done

BillsSisterUsefulNumberText:
	text "Sei un allenatore?"

	para "Ho un numero che"
	line "potrebbe servirti."
	done

RecordedBillsNumberText:
	text "<PLAYER> registra"
	line "il numero di BILL."
	done

BillsSisterRefusedNumberText:
	text "Mio fratello ha"
	line "creato il Sistema"
	cont "Memoria #MON."

	para "Volevo darti il"
	line "numero di BILL…"
	done

BillsSisterPhoneFullText:
	text "Non puoi registra-"
	line "re altri numeri."
	done

BillsSisterStorageSystemText:
	text "Mio fratello ha"
	line "creato il Sistema"
	cont "Memoria #MON."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 15
	warp_event  4,  7, PAGOTA_CITY, 15

	db 0 ; coord events

	db 3 ; bg events
	bg_event  2,  1, BGEVENT_READ, EarlsMuseumBookshelf2
	bg_event  3,  1, BGEVENT_READ, EarlsMuseumBookshelf1
	bg_event  6,  1, BGEVENT_READ, EarlsMuseumRadio

	db 3 ; object events
	object_event  5,  4, SPRITE_BILL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  7,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
