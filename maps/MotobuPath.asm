	object_const_def ; object_event constants
	const MOTOBU_SWIMMER1
	const MOTOBU_SWIMMER2
	const MOTOBU_SWIMMER3
	const MOTOBU_COOLTRAINERM
	const MOTOBU_YOUNGSTER
	const MOTOBU_ITEM

MotobuPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCooltrainermLiam:
	trainer COOLTRAINERM, LIAM, EVENT_BEAT_COOLTRAINERM_LIAM, CooltrainermLiamSeenText, CooltrainermLiamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermLiamAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfJill:
	trainer SWIMMERF, JILL, EVENT_BEAT_SWIMMERF_JILL, SwimmerfJillSeenText, SwimmerfJillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfJillAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfMary:
	trainer SWIMMERF, MARY, EVENT_BEAT_SWIMMERF_MARY, SwimmerfMarySeenText, SwimmerfMaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfMaryAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmerfKatie:
	trainer SWIMMERF, KATIE, EVENT_BEAT_SWIMMERF_KATIE, SwimmerfKatieSeenText, SwimmerfKatieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKatieAfterBattleText
	waitbutton
	closetext
	end

MotobuYoungsterScript:
	jumptextfaceplayer MotobuYoungsterText

MotobuPathItemball:
	itemball EARTHEN_CLAY
	
MotobuYoungsterText:
	text "La forza degli"
	line "allenatori e dei"
	para "#MON delle"
	line "isole è sorpren-"
	cont "dente!"
	done
	
CooltrainermLiamSeenText:
	text "La mia squadra è"
	line "pronta a tutto!"
	para "Preparati!"
	done
	
CooltrainermLiamBeatenText:
	text "Eri preparato."
	done
	
CooltrainermLiamAfterBattleText:
	text "Credo che andrò"
	line "a farmi un bagno…"
	done

SwimmerfJillSeenText:
	text "L'acqua è così"
	line "bella qui!"
	done

SwimmerfJillBeatenText:
	text "Aah!"
	done

SwimmerfJillAfterBattleText:
	text "Per andare al"
	line "CENTRO #MON"
	para "devo uscire"
	line "dall'acqua."
	cont "E va bene."
	done

SwimmerfMarySeenText:
	text "Ti nuoto intorno!"
	done

SwimmerfMaryBeatenText:
	text "Mi gira la testa!"
	done

SwimmerfMaryAfterBattleText:
	text "Credo di aver"
	line "preso un colpo"
	cont "di calore."
	done

SwimmerfKatieSeenText:
	text "Splash!"
	done

SwimmerfKatieBeatenText:
	text "Sospinto via!"
	done

SwimmerfKatieAfterBattleText:
	text "Vuoi vedere quanto"
	line "a lungo posso"
	para "trattenere il"
	line "respiro?"
	done

MotobuPathSign:
	jumptext MotobuPathSignText
	
MotobuPathSignText:
	text "CAMMINO MOTOBU"
	para "VILLAGGIO NAGO -"
	line "IEJIMA"
	done


MotobuPath_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  7, MOTOBU_PATH_IEJIMA_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 50,  6, BGEVENT_READ, MotobuPathSign

	db 6 ; object events
	object_event 27,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfJill, -1
	object_event 32, 12, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfMary, -1
	object_event 35,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKatie, -1
	object_event  6,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermLiam, -1
	object_event 14, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 3, MotobuYoungsterScript, -1
	object_event 12, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MotobuPathItemball, EVENT_MOTOBU_PATH_ITEMBALL


