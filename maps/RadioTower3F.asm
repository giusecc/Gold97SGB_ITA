	object_const_def ; object_event constants
	const RADIOTOWER3F_ROCKER
	const RADIOTOWER3F_TEACHER
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_JANINE
	const RADIOTOWER3F_GRUNTF5
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonelSignText

RadioTower3fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fRocker
	writetext RadioTower3fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover3fRocker
	writetext RadioTower3fRockerTextTakeover
	waitbutton
	closetext
	end
	

RadioTower3fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fTeacher
	writetext RadioTower3fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover3fTeacher
	writetext RadioTower3fTeacherTextTakeover
	waitbutton
	closetext
	end


RadioTower3fJanine:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fJanine
	writetext RadioTower3fJanineText
	waitbutton
	closetext
	end
.MidRocketTakeover3fJanine
	writetext RadioTower3fJanineTextTakeover
	waitbutton
	closetext
	end


RadioTower3fSuperNerd:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fSuperNerd
	writetext RadioTower3fSuperNerdText
	waitbutton
	closetext
	end
.MidRocketTakeover3fSuperNerd
	writetext RadioTower3fSuperNerdTextTakeover
	waitbutton
	closetext
	end
	

TrainerGruntF5:
	trainer GRUNTF, GRUNTF_5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF5AfterBattleText
	waitbutton
	closetext
	end
	

TrainerScientistJed:
	trainer SCIENTIST, JED, EVENT_BEAT_SCIENTIST_JED, ScientistJedSeenText, ScientistJedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistJedAfterBattleText
	waitbutton
	closetext
	end
	

ScientistJedSeenText:
	text "Non dovrebbe"
	line "essere difficile"
	para "trasmettere il"
	line "nostro segnale"
	cont "da qui!"
	done
	
ScientistJedBeatenText:
	text "Le lotte #MON"
	line "sono più difficili"
	cont "della scienza…"
	done
	
ScientistJedAfterBattleText:
	text "Che ne dici di"
	line "smetterla di"
	cont "intrometterti?"
	done
	
GruntF5SeenText:
	text "Questi impiegati"
	line "non sanno cosa"
	cont "li ha colpiti!"
	done
	
GruntF5BeatenText:
	text "Ooh, io so cosa"
	line "mi ha colpito!"
	done
	
GruntF5AfterBattleText:
	text "Sembra che tutte"
	line "queste persone"
	para "saranno presto"
	line "senza lavoro!"
	done

	
RadioTower3fRockerText:
	text "Abbiamo registra-"
	line "zioni di tutti i"
	para "versi di #MON."
	para "Ne abbiamo più"
	line "di 200."
	done
	
RadioTower3fRockerTextTakeover:
	text "Cosa succede"
	line "qui!? Non riesco"
	para "a lavorare con"
	line "tutti questi"
	cont "criminali!"
	done
	
RadioTower3fJanineText:
	text "KEN è il DJ più"
	line "popolare da"
	cont "queste parti."
	done
	
RadioTower3fJanineTextTakeover:
	text "Aiuto! Cosa vuole"
	line "fare il TEAM"
	para "ROCKET con la"
	line "nostra antenna?"
	done
	
RadioTower3fSuperNerdText:
	text "Trasmettiamo un"
	line "programma di"
	para "intrattenimento"
	line "24 ore su 24."
	para "Faccio del mio"
	line "meglio per esserci"
	cont "tutto il giorno!"
	done
	
RadioTower3fSuperNerdTextTakeover:
	text "Non può essere una"
	line "cosa buona!"
	para "Il TEAM ROCKET"
	line "farà disastri se"
	para "prenderà il"
	line "controllo della"
	cont "torre."
	done
	
RadioTower3fTeacherText:
	text "Le ninnananne"
	line "alla radio fanno"
	para "addormentare i"
	line "#MON."
	done
	
RadioTower3fTeacherTextTakeover:
	text "Cosa facciamo"
	line "ora?"
	done
	
RadioTower3FPersonelSignText:
	text "P2 PERSONALE"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower3FPersonnelSign

	db 6 ; object events
	object_event  1,  6, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3fRocker, -1
	object_event  3,  1, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3fTeacher, -1
	object_event  4,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3fSuperNerd, -1
	object_event  6,  5, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3fJanine, -1
	object_event  1,  3, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerGruntF5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerScientistJed, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

