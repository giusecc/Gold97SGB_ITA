	object_const_def ; object_event constants
	const TP_TEACHER
	const TP_INSTR
	const TP_SNERD
	const TP_SAILOR
	const TP_ITEMBALL

TatsugoPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end
	


SailorEugeneSeenText:
	text "Sono tornato"
	line "dal mare."

	para "Che ne dici di"
	line "una lotta?"
	done

SailorEugeneBeatenText:
	text "Aaaaah!"
	done

SailorEugeneAfterBattleText:
	text "Ho catturato i"
	line "miei #MON"
	cont "in viaggio."
	done


TrainerTeacherHolly:
	trainer TEACHER, HOLLY, EVENT_BEAT_TEACHER_HOLLY, TeacherHollySeenText, TeacherHollyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHollyAfterBattleText
	waitbutton
	closetext
	end
	

TeacherHollySeenText:
	text "Uhm, scusa, ma"
	line "è una cosa"
	cont "privata!"
	done

TeacherHollyBeatenText:
	text "Vattene via!"
	done

TeacherHollyAfterBattleText:
	text "Come se non"
	line "dovessi già"
	para "sopportare i"
	line "bambini al lavoro!"
	done


TrainerInstrMoshe:
	trainer INSTRUCTOR, MOSHE, EVENT_BEAT_INSTRUCTOR_MOSHE, InstrMosheSeenText, InstrMosheBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstrMosheAfterBattleText
	waitbutton
	closetext
	end
	

InstrMosheSeenText:
	text "Se stai cercando"
	line "un istruttore, sei"
	para "arrivato nel"
	line "momento sbagliato!"
	done

InstrMosheBeatenText:
	text "Oh, ma dai!"
	done

InstrMosheAfterBattleText:
	text "Non posso neanche"
	line "andare a un"
	para "appuntamento senza"
	line "essere disturbato!"
	done

TrainerSNNorton:
	trainer SUPER_NERD, NORTON, EVENT_BEAT_SUPER_NERD_NORTON, SNNortonSeenText, SNNortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SNNortonAfterBattleText
	waitbutton
	closetext
	end
	

SNNortonSeenText:
	text "Vado ogni giorno"
	line "al LAGO CUORE!"
	para "Perché sono"
	line "ancora solo?"
	done

SNNortonBeatenText:
	text "Che amarezza"
	line "la vita."
	done

SNNortonAfterBattleText:
	text "Fare un bagno"
	line "nel laghetto mi"
	para "potrebbe"
	line "servire?"
	done
	
TatsugoPathHiddenPPUP:
	hiddenitem PP_UP, EVENT_TATSUGO_PATH_HIDDEN_PP_UP


TPItemball:
	itemball ULTRA_BALL

HeartPondSign:
	jumptext HeartPondSignText
	
HeartPondSignText:
	text "LAGO CUORE"
	para "Dove si trovano"
	line "gli innamorati."
	done

KikaiStraitSign:
	jumptext KikaiStraitSignText
	
KikaiStraitSignText:
	text "CAMMINO TATSUGO -"
	line "STRETTO ARCANO"
	
	para "Per il VILLAGGIO"
	line "ARCANO"
	done

TatsugoPath_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  9, AMAMI_TATSUGO_PATH_GATE, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event 21,  7, BGEVENT_READ, HeartPondSign
	bg_event 52, 10, BGEVENT_READ, KikaiStraitSign
	bg_event  4, 15, BGEVENT_ITEM, TatsugoPathHiddenPPUP

	db 5 ; object events
	object_event 19,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherHolly, -1
	object_event 19, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerInstrMoshe, -1
	object_event 35,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSNNorton, -1
	object_event 47, 12, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorEugene, -1
	object_event 43, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TPItemball, EVENT_TATSUGO_PATH_ITEMBALL
