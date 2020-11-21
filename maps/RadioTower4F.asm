	object_const_def ; object_event constants
	const RADIOTOWER4F_ROCKER
	const RADIOTOWER4F_BURGLAR
	const RADIOTOWER4F_SUPER_NERD
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_SCIENTIST
	const RADIOTOWER4F_GRUNTM27
	const RADIOTOWER4F_GRUNTM28

RadioTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText


RadioTower4fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fRocker
	writetext RadioTower4fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover4fRocker
	writetext RadioTower4fRockerTextTakeover
	waitbutton
	closetext
	end
	

RadioTower4fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fTeacher
	writetext RadioTower4fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover4fTeacher
	writetext RadioTower4fTeacherTextTakeover
	waitbutton
	closetext
	end

RadioTower4fSuperNerd:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fSuperNerd
	checkflag ENGINE_MAP_CARD
	iffalse .KenFinallyGivesMap
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .KenAfterRadioTower
	writetext RadioTower4fSuperNerdText
	waitbutton
	closetext
	end
.MidRocketTakeover4fSuperNerd
	writetext RadioTower4fSuperNerdTextTakeover
	waitbutton
	closetext
	end
.KenAfterRadioTower
	writetext RadioTower4fSuperNerdTextAfter
	waitbutton
	closetext
	end
.KenFinallyGivesMap
	writetext KenGiveMapInTower
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext KenGiveMapInTower2
	waitbutton
	closetext
	end
	

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAPPA@"
	

	
RadioTower4fBurglar:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fBurglar
	writetext RadioTower4fBurglarText
	waitbutton
	closetext
	end
.MidRocketTakeover4fBurglar
	writetext RadioTower4fBurglarTextTakeover
	waitbutton
	closetext
	end
	
TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM27:
	trainer GRUNTM, GRUNTM_27, EVENT_BEAT_ROCKET_GRUNTM_27, GruntM27SeenText, GruntM27BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM27AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM28:
	trainer GRUNTM, GRUNTM_28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM28AfterBattleText
	waitbutton
	closetext
	end
	

GruntM28SeenText:
	text "Sorpresa!"
	done
	
GruntM28BeatenText:
	text "Eri ben preparato…"
	done
	
GruntM28AfterBattleText:
	text "Credo che tu ti"
	line "sia abituato alle"
	para "reclute del"
	line "TEAM ROCKET."
	done

KenGiveMapInTower:
	text "KEN: Ehi!"
	line "Ce l'ho fatta!"
	para "Sono un DJ ora!"
	para "Le ricerche che"
	line "fai per il PROF."
	para "OAK sono molto"
	line "utili per il"
	cont "mio programma!"
	para "Sono in debito"
	line "con te!"
	para "…Oh, aspetta!"
	line "Non ti ho mai"
	para "dato questo!"
	done
	
KenGiveMapInTower2:
	text "Come hai fatto"
	line "ad arrivare fin"
	para "qui senza"
	line "perderti?"
	done
	
GruntM27SeenText:
	text "Vai in cima?"
	para "Non credo!"
	done
	
GruntM27BeatenText:
	text "Dicono che la"
	line "vista sia"
	cont "incredibile."
	done
	
GruntM27AfterBattleText:
	text "Puoi battere me,"
	line "ma non GIOVANNI!"
	done

	
ScientistMarcSeenText:
	text "Le mie ricerche"
	line "mostrano che"
	cont "devi andartene!"
	done
	
ScientistMarcBeatenText:
	text "Oh, peccato."
	done
	
ScientistMarcAfterBattleText:
	text "Stai ostacolando"
	line "la scienza!"
	done
	
RadioTower4fTeacherText:
	text "LORI: sintonizzati"
	line "sul #MON TALK"
	cont "di KEN, ogni"
	para "giorno dopo le"
	line "10 del mattino!"
	done
	
RadioTower4fTeacherTextTakeover:
	text "LORI: Sarei dovuta"
	line "restare a casa!"
	done
	
RadioTower4fBurglarText:
	text "Ehi, ragazzo!"
	para "Sono il produttore"
	line "del #MON TALK"
	cont "di KEN!"
	para "Ascoltalo, mi"
	line "raccomando!"
	done
	
RadioTower4fBurglarTextTakeover:
	text "Questo non fa"
	line "parte del piano"
	cont "di produzione!"
	done

RadioTower4fRockerText:
	text "Ascoltando la"
	line "radio alle ROVINE"
	cont "VESTIGIA, ho"
	para "sentito una strana"
	line "trasmissione."
	done
	
RadioTower4fRockerTextTakeover:
	text "Tutti i nostri"
	line "programmi non sono"
	cont "in onda!"
	done
	
	
RadioTower4fSuperNerdText:
	text "KEN: Ehi!"
	line "Ce l'ho fatta!"
	para "Sono un DJ ora!"
	para "Le ricerche che"
	line "fai per il PROF."
	para "OAK sono molto"
	line "utili per il"
	cont "mio programma!"
	para "Sono in debito"
	line "con te!"
	done
	
RadioTower4fSuperNerdTextTakeover:
	text "KEN: Ehi! Cosa"
	line "ci fai qui!?"
	para "Stai attento!"
	done
	
RadioTower4fSuperNerdTextAfter:
	text "KEN: Hai mandato"
	line "via il TEAM"
	cont "ROCKET?"
	para "Tu e i tuoi"
	line "#MON siete"
	cont "incredibili!"
	done
	
RadioTower4FStudio2SignText:
	text "P3 STUDIO 2"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  7,  0, RADIO_TOWER_3F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	db 7 ; object events
	object_event  4,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4fRocker, -1
	object_event  7,  5, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4fBurglar, -1
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4fSuperNerd, -1
	object_event  0,  5, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4fTeacher, -1
	object_event  6,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  1,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGruntM27, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGruntM28, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
