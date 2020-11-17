	object_const_def ; object_event constants
	const TINTOWER4F_POKE_BALL1
	const TINTOWER4F_SAGE1
	const TINTOWER4F_SAGE2
	const TINTOWER4F_SAGE3
	const TINTOWER4F_SAGE4

FiveFloorTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
FiveFloorTower4FSign:
	setevent EVENT_READ_5F4F_SIGN
	jumptext FiveFloorTower4FSignText
	
FiveFloorTower4FSignText:
	text "È la statua di"
	line "HO-OH."
	para "Il leggendario"
	line "#MON uccello"
	para "che fece il nido"
	line "sulla cima della"
	cont "torre."
	para "Onoriamo il suo"
	line "nido, sperando"
	para "che un giorno"
	line "faccia ritorno."
	done



FiveFloorTower4FEscapeRope:
	itemball ESCAPE_ROPE
	
TrainerSageLi:
	trainer SAGE, LI, EVENT_BEAT_SAGE_LI, SageLiSeenText, SageLiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end


SageLiSeenText:
	text "Sento che hai"
	line "fatto la giusta"
	para "decisione met-"
	line "tendoti in"
	cont "viaggio."
	done

SageLiBeatenText:
	text "Lo sapevo!"
	done

SageLiAfterBattleText:
	text "Prego, prosegui"
	line "all'ultimo piano."
	done
	
TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end


SageGakuSeenText:
	text "Trascorriamo il"
	line "tempo in profonde"
	cont "meditazioni."
	done

SageGakuBeatenText:
	text "Mi sento completo."
	done

SageGakuAfterBattleText:
	text "La mente può"
	line "viaggiare per"
	para "ore e ore durante"
	line "il giorno."
	done
	
TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageMasaAfterBattleText
	waitbutton
	closetext
	end


SageMasaSeenText:
	text "Non ho molto"
	line "da dire."
	done

SageMasaBeatenText:
	text "…"
	done

SageMasaAfterBattleText:
	text "Completa la"
	line "salita."
	done
	
TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageKojiAfterBattleText
	waitbutton
	closetext
	end


SageKojiSeenText:
	text "Spero un giorno"
	line "di vedere il sacro"
	para "#MON uccello"
	line "con i miei occhi."
	done

SageKojiBeatenText:
	text "Così sarà."
	done

SageKojiAfterBattleText:
	text "Spero tu ti senta"
	line "illuminato."
	done


FiveFloorTower4F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  1, FIVE_FLOOR_TOWER_3F, 2
	warp_event  7,  7, FIVE_FLOOR_TOWER_5F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 4, 1, BGEVENT_READ, FiveFloorTower4FSign

	db 5 ; object events
	object_event  0,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FiveFloorTower4FEscapeRope, EVENT_FIVE_FLOOR_TOWER_4F_ESCAPE_ROPE
	object_event  3,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageLi, EVENT_PAGOTA_CITY_EARL
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 6, TrainerSageGaku, EVENT_PAGOTA_CITY_EARL
	object_event  4,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSageMasa, EVENT_PAGOTA_CITY_EARL
	object_event  7,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSageKoji, EVENT_PAGOTA_CITY_EARL
