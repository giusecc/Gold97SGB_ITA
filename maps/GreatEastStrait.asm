	object_const_def ; object_event constants
	const GES_DAN
	const GES_ITEMBALL
	const GES_PARKER
	const GES_LEWIS

GreatEastStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GreatEastSign:
	jumptext GreatEastSignText
	
GreatEastSignText:
	text "STRETTO ORIENTALE"
	line "Attento ai"
	cont "mulinelli!"
	done


TrainerSoldierDan:
	trainer SOLDIER, DAN, EVENT_BEAT_SOLDIER_DAN, DanSeenText, DanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DanAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermLewis:
	trainer SWIMMERM, LEWIS, EVENT_BEAT_SWIMMERM_LEWIS, SwimmermLewisSeenText, SwimmermLewisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermLewisAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermParker:
	trainer SWIMMERM, PARKER, EVENT_BEAT_SWIMMERM_PARKER, SwimmermParkerSeenText, SwimmermParkerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermParkerAfterBattleText
	waitbutton
	closetext
	end
	
	
SwimmermLewisSeenText:
	text "Ooh…"

	para "Ci sto! Vienimi"
	line "a prendere!"
	done

SwimmermLewisBeatenText:
	text "Non può essere…"
	done

SwimmermLewisAfterBattleText:
	text "Non abbassare la"
	line "guardia, o sarai"
	cont "sconfitto!"
	done

DanSeenText:
	text "Questa isola è il"
	line "mio campo di"
	para "battaglia, le onde"
	line "le mie sirene"
	cont "di battaglia."
	
	para "Finché sono sopra"
	line "l'acqua, non mi"
	para "prenderai vivo!"
	done

DanBeatenText:
	text "RITIRATAAA!"
	done
	
DanAfterBattleText:
	text "La guerra non è"
	line "finita! Combatto"
	para "ogni giorno la"
	line "mia qui!"
	done
	
SwimmermParkerSeenText:
	text "Acque agitate,"
	line "eh?"
	done

SwimmermParkerBeatenText:
	text "Questo non era"
	line "il piano!"
	done

SwimmermParkerAfterBattleText:
	text "Attento ai"
	line "MULINELLI!"
	done

GESItemball:
	itemball NUGGET

GreatEastStrait_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  8, NANJO_FOREST, 3
	warp_event 11,  9, NANJO_FOREST, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 18,  8, BGEVENT_READ, GreatEastSign

	db 4 ; object events
	object_event 59,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSoldierDan, -1
	object_event 84,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GESItemball, EVENT_GES_NUGGET
	object_event 31, 10, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermParker, -1
	object_event 103,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermLewis, -1
