	object_const_def ; object_event constants
	const ROUTE107_SWIMMER_GIRL
	const ROUTE107_SWIMMER_GUY
	const ROUTE107_SWIMMER_GUY2
	const ROUTE107_SWIMMER_GUY3
	const ROUTE107_FISHER

Route107_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end
	
	
TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end
	
SwimmermGeorgeSeenText:
	text "Affronta la mia"
	line "squadra stellare!"
	done

SwimmermGeorgeBeatenText:
	text "Dalle stelle"
	line "alle stalle!"
	done

SwimmermGeorgeAfterBattleText:
	text "La tua squadra"
	line "è splendente!"
	done

SwimmermSethSeenText:
	text "Terra!"
	line "Andiamo!"
	done

SwimmermSethBeatenText:
	text "Glub…"
	done

SwimmermSethAfterBattleText:
	text "Un giorno vorrei"
	line "allenarmi con"
	para "il MAESTRO del"
	line "tipo DRAGO."
	done
	
SwimmermCharlieSeenText:
	text "Non sei forte"
	line "abbastanza da"
	cont "nuotare da solo?"
	done

SwimmermCharlieBeatenText:
	text "Mi sbagliavo!"
	done

SwimmermCharlieAfterBattleText:
	text "I tuoi #MON"
	line "sono forti!"
	done

SwimmerfNikkiSeenText:
	text "Se vinco dovrai"
	line "aiutarmi con la"
	cont "crema solare!"
	done

SwimmerfNikkiBeatenText:
	text "Ho paura delle"
	line "scottature…"
	done

SwimmerfNikkiAfterBattleText:
	text "Devo fare atten-"
	line "zione alle macchi"
	cont "causate dal sole."
	done

FisherArnoldSeenText:
	text "Mi sto annoiando!"
	line "Lottiamo!"
	done

FisherArnoldBeatenText:
	text "Che disfatta…"
	done

FisherArnoldAfterBattleText:
	text "Tornerò a"
	line "pescare…"
	done

Route107_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 48, ALLOY_ROUTE_107_GATE, 1
	warp_event  9, 48, ALLOY_ROUTE_107_GATE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 11, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  8, 40, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	object_event  4, 29, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermCharlie, -1
	object_event 12,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermGeorge, -1
	object_event 12, 28, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
