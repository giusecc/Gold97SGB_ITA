	object_const_def ; object_event constants
	const ROUTE114_YOUNGSTER1
	const ROUTE114_LASS1
	const ROUTE114_YOUNGSTER2
	const ROUTE114_LASS2
	const ROUTE114_POKEFAN_M1
	const ROUTE114_POKEFAN_M2
	const ROUTE114_COOLTRAINER

Route114_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSidAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerEdnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

TrainerSportsmanJacob:
	trainer SPORTSMAN, JACOB, EVENT_BEAT_SPORTSMAN_JACOB, SportsmanJacobSeenText, SportsmanJacobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SportsmanJacobAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerSidneyAfterBattleText
	waitbutton
	closetext
	end

Route114Sign:
	jumptext Route114SignText

Route114HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_114_HIDDEN_ETHER
	
SportsmanJacobSeenText:
	text "Mi prendo una"
	line "pausa dalla corsa."
	done
	
SportsmanJacobBeatenText:
	text "Non era quello che"
	line "mi aspettavo."
	done
	
SportsmanJacobAfterBattleText:
	text "Correre con i"
	line "#MON è un ot-"
	cont "timo allenamento."
	done

CamperDeanSeenText:
	text "Sei mai stato"
	line "a KANTO?"
	done

CamperDeanBeatenText:
	text "Pericolo!"
	done

CamperDeanAfterBattleText:
	text "Preferisco il"
	line "BOSCO GIADA."
	done

PicnickerHeidiSeenText:
	text "Hai mai fatto"
	line "un picnic?"

	para "Sono così"
	line "divertenti!"
	done

PicnickerHeidiBeatenText:
	text "Ohhhh!"
	done

PicnickerHeidiAfterBattleText:
	text "Cuociamo di tutto"
	line "e lo condividiamo"

	para "tra di noi."
	line "È tutto delizioso!"
	done

CamperSidSeenText:
	text "Ehi, tu!"
	line "Non gettare"
	cont "rifiuti!"
	done

CamperSidBeatenText:
	text "Te lo stavo solo"
	line "ricordando…"
	done

CamperSidAfterBattleText:
	text "Scusa, non stavi"
	line "gettando rifiuti."
	cont "Errore mio."
	done

PicnickerEdnaSeenText:
	text "Nessuno dovrebbe"
	line "gettare rifiuti"
	cont "in giro."
	done

PicnickerEdnaBeatenText:
	text "Ohh… Ho perso…"
	done

PicnickerEdnaAfterBattleText:
	text "È importante"
	line "conservare le"

	para "energie, ma"
	line "l'ambiente è"
	cont "più importante."
	done

HikerTimSeenText:
	text "Scenderà dal"
	line "MONTE FUJI…"
	done

HikerTimBeatenText:
	text "Ero troppo impe-"
	line "gnato a cantare…"
	done

HikerTimAfterBattleText:
	text "La lotta è"
	line "concentrazione."
	done

HikerSidneySeenText:
	text "Ti dirò un"
	line "segreto."

	para "Ma prima,"
	line "lottiamo!"
	done

HikerSidneyBeatenText:
	text "Oh, uffa!"
	line "Ho perso…"
	done

HikerSidneyAfterBattleText:
	text "Stavo scherzando"
	line "sul segreto."
	para "Non so niente di"
	line "interessante."
	done

Route114SignText:
	text "PERCORSO 114"

	para "INERTOPOLI -"
	line "KANTO"
	done

Route114_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 28,  5, ROUTE_113_ROUTE_114_GATE, 3
	warp_event 29,  5, ROUTE_113_ROUTE_114_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 10, BGEVENT_READ, Route114Sign
	bg_event 35, 14, BGEVENT_ITEM, Route114HiddenEther

	db 7 ; object events
	object_event 18, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCamperDean, -1
	object_event 28, 10, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event 10,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCamperSid, -1
	object_event  8, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerEdna, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerTim, -1
	object_event 21,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerSidney, -1
	object_event 31,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSportsmanJacob, -1
