	object_const_def ; object_event constants
	const SPROUTTOWER1F_SAGE1
	const SPROUTTOWER1F_SAGE2
	const SPROUTTOWER1F_SAGE3
	const SPROUTTOWER1F_SAGE4
	const SPROUTTOWER1F_POKE_BALL

FiveFloorTower1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FiveFloorPagotaTreeGone
	
.FiveFloorPagotaTreeGone
	setevent EVENT_PAGOTA_TREE_CUT
	return

TrainerSageChow:
	trainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageChowSeenText, SageChowBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageChowAfterBattleText
	waitbutton
	closetext
	end

FiveFloorTower1FParlyzHeal:
	itemball PARLYZ_HEAL

FiveFloorTower1FStatue:
	jumptext FiveFloorTower1FStatueText
	
	
FiveFloorTower1FSign:
	setevent EVENT_READ_5F1F_SIGN
	jumptext FiveFloorTower1FSignText
	

SageChowSeenText:
	text "Stiamo a guardia"
	line "di questa torre."

	para "Qui rendiamo"
	line "omaggio a tutti i"
	cont "#MON."
	done

SageChowBeatenText:
	text "Gra-grazie!"
	done

SageChowAfterBattleText:
	text "Tutti gli esseri"
	line "viventi convivono"
	cont "cooperando."

	para "Dobbiamo sempre"
	line "ricordarcene."
	done
	
TrainerSageNico:
	trainer SAGE, NICO, EVENT_BEAT_SAGE_NICO, SageNicoSeenText, SageNicoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNicoAfterBattleText
	waitbutton
	closetext
	end


SageNicoSeenText:
	text "La PENTATORRE fu"
	line "costruita molti"
	cont "secoli fa."
	para "È un onore per"
	line "noi proteggere"
	cont "questo luogo."
	done


SageNicoBeatenText:
	text "Forse hai"
	line "capito."
	done

SageNicoAfterBattleText:
	text "Speriamo che"
	line "questa torre"
	para "continui a stare"
	line "in piedi per molti"
	cont "altri secoli."
	done

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end


SageJinSeenText:
	text "Tutti i #MON"
	line "hanno qualcosa da"
	cont "insegnarci."
	para "È nostra respon-"
	line "sabilità fare"
	para "attenzione e"
	line "ascoltarli."
	
	done

SageJinBeatenText:
	text "Li senti?"
	done

SageJinAfterBattleText:
	text "I #MON ci"
	line "insegnano molto."
	para "Molto più di"
	line "quanto pensi."
	done
	
TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end


SageTroySeenText:
	text "Perché la torre"
	line "fu costruita?"
	para "Nessuno lo sa."
	para "In passato era"
	line "il nido di un uc-"
	cont "cello leggendario."
	done

SageTroyBeatenText:
	text "Devi onorare"
	line "questo posto."
	done

SageTroyAfterBattleText:
	text "Conta ogni passo"
	line "mentre stai"
	cont "salendo in cima."
	done

FiveFloorTower1FStatueText:
	text "Una statua" 
	line "#MON…"

	para "Sembra molto"
	line "particolare."
	done
	
FiveFloorTower1FSignText:
	text "Questa è la"
	line "PENTATORRE."
	para "Un antico"
	line "monumento dedica-"
	para "to ai #MON,"
	line "che arricchiscono"
	para "le vite degli"
	line "umani."
	para "Leggi attentamente"
	line "le informazioni"
	para "di ogni statua"
	line "per capire il"
	para "loro insegnamento."
	done

FiveFloorTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 7
	warp_event  4,  7, PAGOTA_CITY, 12
	warp_event  0,  1, FIVE_FLOOR_TOWER_2F, 1


	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, FiveFloorTower1FSign
	

	db 5 ; object events
	object_event  0,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageChow, EVENT_PAGOTA_CITY_EARL
	object_event  1,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageNico, EVENT_PAGOTA_CITY_EARL
	object_event  5,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageJin, EVENT_PAGOTA_CITY_EARL
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageTroy, EVENT_PAGOTA_CITY_EARL
	object_event  7,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FiveFloorTower1FParlyzHeal, EVENT_SPROUT_TOWER1F_PARLYZ_HEAL
