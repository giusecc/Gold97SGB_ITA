	object_const_def ; object_event constants
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4


FiveFloorTower3F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end


;SageLiScript:
;	faceplayer
;	opentext
;	checkevent EVENT_GOT_HM05_FLASH
;	iftrue .GotFlash
;	writetext SageLiSeenText
;	waitbutton
;	closetext
;	winlosstext SageLiBeatenText, 0
;	loadtrainer SAGE, LI
;	startbattle
;	reloadmapafterbattle
;	opentext
;	writetext SageLiTakeThisFlashText
;	buttonsound
;	verbosegiveitem TM_FLASH
;	setevent EVENT_GOT_HM05_FLASH
;	setevent EVENT_BEAT_SAGE_LI
;	writetext SageLiFlashExplanationText
;	waitbutton
;	closetext
;	end

;.GotFlash:
;	writetext SageLiAfterBattleText
;	waitbutton
;	closetext
;	end

FiveFloorTower3FSign:
	setevent EVENT_READ_5F3F_SIGN
	jumptext FiveFloorTower3FSignText
	
FiveFloorTower3FSignText:
	text "È una statua di"
	line "TENTACRUEL."
	para "Nonostante il suo"
	line "aspetto intimida-"
	para "torio, TENTACRUEL"
	line "ci insegna che"
	para "tutti i #MON"
	line "hanno un cuore"
	cont "puro."
	para "Questa statua è"
	line "dedicata al"
	para "TENTACRUEL che"
	line "con i suoi tenta-"
	para "coli salvò un"
	line "bambino dalle"
	para "acque del fiume"
	line "che scorre vicino"
	cont "alla torre."
	done


TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end


SageJeffreySeenText:
	text "Cosa significa per"
	line "te salire questa"
	cont "torre?"
	done

SageJeffreyBeatenText:
	text "Capisco."
	done

SageJeffreyAfterBattleText:
	text "Dovresti trovare"
	line "il senso del tuo"
	cont "viaggio."
	para "Sia dentro questa"
	line "torre, sia per il"
	cont "futuro."
	done
	
TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end


SagePingSeenText:
	text "Sopra il quinto"
	line "piano si trova il"
	cont "tetto."
	para "Ma anche a noi"
	line "è proibito andare"
	para "in quel luogo"
	line "sacro."
	done

SagePingBeatenText:
	text "Tratti bene i"
	line "tuoi #MON."
	done

SagePingAfterBattleText:
	text "Speriamo che un"
	line "giorno il #MON"
	para "della leggenda"
	line "faccia ritorno"
	cont "al suo nido."
	done
	
TrainerSageEdmond:
	trainer SAGE, EDMOND, EVENT_BEAT_SAGE_EDMOND, SageEdmondSeenText, SageEdmondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageEdmondAfterBattleText
	waitbutton
	closetext
	end


SageEdmondSeenText:
	text "Sento che un"
	line "lungo viaggio"
	cont "ti attende."
	done

SageEdmondBeatenText:
	text "Questo è solo"
	line "l'inizio."
	done

SageEdmondAfterBattleText:
	text "Sei pronto per"
	line "affrontare il tuo"
	cont "futuro?"
	done
	
TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end


SageNealSeenText:
	text "Sei riuscito ad"
	line "arrivare fin"
	cont "qui."
	done

SageNealBeatenText:
	text "Prego, continua."
	done

SageNealAfterBattleText:
	text "Se FRANZ ti ha"
	line "chiesto di fare"
	para "questo viaggio,"
	line "il tuo futuro"
	para "si prospetta"
	line "importante."
	done

FiveFloorTower3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  7, FIVE_FLOOR_TOWER_2F, 2
	warp_event  0,  1, FIVE_FLOOR_TOWER_4F, 1

	db 0 ; coord events


	db 1 ; bg events
	bg_event 4, 1, BGEVENT_READ, FiveFloorTower3FSign

	db 4 ; object events
	object_event  2,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageJeffrey, EVENT_PAGOTA_CITY_EARL
	object_event  5,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSagePing, EVENT_PAGOTA_CITY_EARL
	object_event  4,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageEdmond, EVENT_PAGOTA_CITY_EARL
	object_event  3,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageNeal, EVENT_PAGOTA_CITY_EARL

