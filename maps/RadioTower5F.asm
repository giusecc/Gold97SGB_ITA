	object_const_def ; object_event constants
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_COOLTRAINER
	const RADIOTOWER5F_SCIENTIST
	const RADIOTOWER5F_GRUNTM30

RadioTower5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

RadioTower5fCooltrainer:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover5fCooltrainer
	writetext RadioTower5fCooltrainerText
	waitbutton
	closetext
	end
.MidRocketTakeover5fCooltrainer
	writetext RadioTower5fCooltrainerTextTakeover
	waitbutton
	closetext
	end

RadioTower5fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover5fRocker
	writetext RadioTower5fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover5fRocker
	writetext RadioTower5fRockerTextTakeover
	waitbutton
	closetext
	end
	
TrainerGruntM30:
	trainer GRUNTM, GRUNTM_30, EVENT_BEAT_ROCKET_GRUNTM_30, GruntM30SeenText, GruntM30BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM30AfterBattleText
	waitbutton
	closetext
	end
	

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

	
RadioTower5FStudiosSign:
	jumptext RadioTower5FStudiosSignText
	
GruntM30SeenText:
	text "La nostra trasmis-"
	line "sione è molto"
	para "meglio delle"
	line "solite, vero?"
	done
	
GruntM30BeatenText:
	text "In realtà, mi"
	line "piace la musica"
	cont "#MON…"
	done
	
GruntM30AfterBattleText:
	text "Presto trasmet-"
	line "teremo il nostro"
	para "segnale per"
	line "controllare le"
	cont "menti!"
	done
	
ScientistRichSeenText:
	text "Cos'è successo a"
	line "OAK IMPOSTORE?"
	para "Non ci serviva"
	line "più. Non abbiamo"
	para "più bisogno di"
	line "ingannare nessuno"
	cont "adesso!"
	para "Ci siamo liberati"
	line "di lui!"
	done
	
ScientistRichBeatenText:
	text "Sei troppo buono"
	line "per me…"
	done
	
ScientistRichAfterBattleText:
	text "Non mi è mai"
	line "piaciuto quel"
	cont "tipo, comunque."
	done
	
	
RadioTower5FStudiosSignText:
	text "P4 STUDIO 3"
	done

RadioTower5fRockerText:
	text "TIMMI: Ti piace"
	line "la musica che"
	para "faccio per i"
	line "#MON?"
	para "Sintonizzati!"
	done
	
RadioTower5fRockerTextTakeover:
	text "TIMMI: Non credo"
	line "che le trasmis-"
	para "sioni del TEAM"
	line "ROCKET siano"
	para "buone per i"
	line "#MON!"
	done
	
RadioTower5fCooltrainerText:
	text "REED: Se vuoi"
	line "tentare la sorte,"
	para "sintonizzati sulla"
	line "mia trasmissione!"
	done
	
RadioTower5fCooltrainerTextTakeover:
	text "REED: Credo che"
	line "ci sia un'aria di"
	cont "sfortuna qui!"
	done
	

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event  7,  0, RADIO_TOWER_6F, 1

	db 0 ; coord events


	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FStudiosSign

	db 4 ; object events
	object_event  4,  6, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower5fRocker, -1
	object_event  0,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower5fCooltrainer, -1
	object_event  6,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  2,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGruntM30, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
