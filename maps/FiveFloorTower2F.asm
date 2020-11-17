	object_const_def ; object_event constants
	const SPROUTTOWER2F_MEDIUM1
	const SPROUTTOWER2F_MEDIUM2
	const SPROUTTOWER2F_MEDIUM3
	const SPROUTTOWER2F_MEDIUM4
	const SPROUTTOWER2F_POKE_BALL

FiveFloorTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FiveFloorTower2FSign:
	setevent EVENT_READ_5F2F_SIGN
	jumptext FiveFloorTower2FSignText

FiveFloorTower2FXAccuracy:
	itemball X_ACCURACY
	
TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end
	
FiveFloorTower2FSignText:
	text "È la statua di"
	line "un PIKACHU."
	para "PIKACHU ci ricorda"
	line "che anche i #-"
	para "MON più popolari"
	line "meritano di essere"
	para "trattati con"
	line "onore e rispetto,"
	para "non visti come"
	line "un trofeo."
	done


MediumMarthaSeenText:
	text "Cosa ti porta"
	line "qui?"
	done

MediumMarthaBeatenText:
	text "Il tuo obiettivo"
	line "è chiaro."
	done

MediumMarthaAfterBattleText:
	text "Solo gli"
	line "allenatori più"
	para "saggi comprendono"
	line "l'importanza delle"
	para "relazioni tra"
	line "persone e"
	cont "#MON."
	done
	
TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end


MediumGraceSeenText:
	text "Se fatta nel modo"
	line "giusto, una lotta"
	para "#MON può"
	line "essere una espe-"
	cont "rienza spirituale."
	done

MediumGraceBeatenText:
	text "Spero che tu"
	line "l'abbia vissuta."
	done

MediumGraceAfterBattleText:
	text "Molte volte, le"
	line "persone dipendono"
	para "dai #MON più" 
	line "di quanto loro"
	cont "dipendano da noi."
	done
	
TrainerMediumBethany:
	trainer MEDIUM, BETHANY, EVENT_BEAT_MEDIUM_BETHANY, MediumBethanySeenText, MediumBethanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumBethanyAfterBattleText
	waitbutton
	closetext
	end


MediumBethanySeenText:
	text "Non senti una"
	line "strana presenza"
	para "in questo posto?"
	done

MediumBethanyBeatenText:
	text "Hmmm."
	done

MediumBethanyAfterBattleText:
	text "In un modo o"
	line "nell'altro, tutti"
	cont "possiamo sentirla."
	done
	
TrainerMediumMargret:
	trainer MEDIUM, MARGRET, EVENT_BEAT_MEDIUM_MARGRET, MediumMargretSeenText, MediumMargretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMargretAfterBattleText
	waitbutton
	closetext
	end


MediumMargretSeenText:
	text "Ah! Mi hai"
	line "distratta!"
	done

MediumMargretBeatenText:
	text "È importante"
	line "stare concentrati."
	done

MediumMargretAfterBattleText:
	text "Concentrati sui"
	line "messaggi."
	done


FiveFloorTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  1, FIVE_FLOOR_TOWER_1F, 3
	warp_event  7,  7, FIVE_FLOOR_TOWER_3F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 4, 1, BGEVENT_READ, FiveFloorTower2FSign

	db 5 ; object events
	object_event  2,  3, SPRITE_SABRINA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerMediumMartha, EVENT_PAGOTA_CITY_EARL
	object_event  2,  6, SPRITE_SABRINA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerMediumGrace, EVENT_PAGOTA_CITY_EARL
	object_event  5,  3, SPRITE_SABRINA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerMediumBethany, EVENT_PAGOTA_CITY_EARL
	object_event  5,  6, SPRITE_SABRINA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerMediumMargret, EVENT_PAGOTA_CITY_EARL
	object_event  5,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FiveFloorTower2FXAccuracy, EVENT_SPROUT_TOWER2F_X_ACCURACY
