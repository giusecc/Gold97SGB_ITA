	object_const_def ; object_event constants
	const VICTORYROAD_POKE_BALL1
	const VICTORYROAD_POKE_BALL2
	const VICTORYROAD_POKE_BALL3
	const VICTORYROAD_POKE_BALL4
	const VICTORYROAD_POKE_BALL5
	const VICTORYROAD_COOLTRAINER_M
	const VICTORYROAD_COOLTRAINER_M2
	const VICTORYROAD_COOLTRAINER_F
	const VICTORYROAD_INSTRUCTOR
	const VICTORYROAD_SWIMMERM
	const VICTORYROAD_SWIMMERF
	const VICTORYROAD_ENGINEER
	const VICTORYROAD_COOLTRAINER_M3
	const VICTORYROAD_COOLTRAINER_F2

VictoryRoad_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


VictoryRoadTMEarthquake:
	itemball TM_EARTHQUAKE

VictoryRoadMaxRevive:
	itemball MAX_REVIVE

VictoryRoadFullRestore:
	itemball FULL_RESTORE

VictoryRoadFullHeal:
	itemball FULL_HEAL

VictoryRoadHPUp:
	itemball HP_UP

VictoryRoadHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_VICTORY_ROAD_HIDDEN_MAX_POTION

VictoryRoadHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL

TrainerCooltrainermCody:
	trainer COOLTRAINERM, CODY, EVENT_BEAT_COOLTRAINERM_CODY, CooltrainermCodySeenText, CooltrainermCodyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermCodyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermJake:
	trainer COOLTRAINERM, JAKE, EVENT_BEAT_COOLTRAINERM_JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermJakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfJoyce:
	trainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJoyceAfterBattleText
	waitbutton
	closetext
	end


TrainerInstructorGeoff:
	trainer INSTRUCTOR, GEOFF, EVENT_BEAT_INSTRUCTOR_GEOFF, InstructorGeoffSeenText, InstructorGeoffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstructorGeoffAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLisa:
	trainer SWIMMERF, LISA, EVENT_BEAT_SWIMMERF_LISA, SwimmerfLisaSeenText, SwimmerfLisaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLisaAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerDavidson:
	trainer ENGINEER, DAVIDSON, EVENT_BEAT_ENGINEER_DAVIDSON, EngineerDavidsonSeenText, EngineerDavidsonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerDavidsonAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermErick:
	trainer COOLTRAINERM, ERICK, EVENT_BEAT_COOLTRAINERM_ERICK, CooltrainermErickSeenText, CooltrainermErickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermErickAfterBattleText
	waitbutton
	closetext
	end


TrainerCooltrainerfQuinn:
	trainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfQuinnAfterBattleText
	waitbutton
	closetext
	end

CooltrainermErickSeenText:
	text "Sei già stanco?"
	done

CooltrainermErickBeatenText:
	text "Sembra che io"
	line "sia stanco."
	done

CooltrainermErickAfterBattleText:
	text "Ci vuole ancora"
	line "molto per arriva-"
	cont "re alla cima."
	para "Dicono che più"
	line "avanti sia un"
	cont "labirinto."
	done


CooltrainermJakeSeenText:
	text "Sto facendo gli"
	line "ultimi preparativi"

	para "per la LEGA"
	line "#MON."
	done

CooltrainermJakeBeatenText:
	text "Ho perso!"
	done

CooltrainermJakeAfterBattleText:
	text "Sarà dura vincere"
	line "alla LEGA."

	para "Devo allenarmi"
	line "ancora."

	para "Dicono che i"
	line "SUPERQUATTRO"

	para "siano più forti"
	line "dei CAPOPALESTRA."
	done

CooltrainerfJoyceSeenText:
	text "Se sei arrivato"
	line "fin qui, devi"
	cont "essere forte."

	para "Darò tutto in"
	line "questa lotta!"
	done

CooltrainerfJoyceBeatenText:
	text "No! Non posso"
	line "crederci!"
	done

CooltrainerfJoyceAfterBattleText:
	text "Ho battuto otto"
	line "CAPOPALESTRA,"

	para "per questo ero"
	line "ottimistsa."
	done

InstructorGeoffSeenText:
	text "Gli allenatori qui"
	line "sono molto forti."
	para "Ogni lotta è"
	line "un insegnamento."
	done
	
InstructorGeoffBeatenText:
	text "Ho sicuramente"
	line "imparato qualcosa."
	done
	
InstructorGeoffAfterBattleText:
	text "Anche i #MON"
	line "sono molto"
	cont "forti qui."
	done


SwimmermHaroldSeenText:
	text "Stai usando i"
	line "#MON per attraver-"
	cont "sare la grotta?"
	para "Se fossi pronto"
	line "per la LEGA,"
	cont "nuoteresti!"
	done

SwimmermHaroldBeatenText:
	text "Glub…"
	done

SwimmermHaroldAfterBattleText:
	text "Forse nuotare"
	line "non ha molto a"
	para "che vedere con"
	line "le lotte."
	done

SwimmerfLisaSeenText:
	text "L'acqua è più"
	line "calda di quanto"
	cont "mi aspettassi."
	done

SwimmerfLisaBeatenText:
	text "Affondato!"
	done

SwimmerfLisaAfterBattleText:
	text "Preferisco nuota-"
	line "re nelle grotte."
	done
	
EngineerDavidsonSeenText:
	text "Troverò una via"
	line "più veloce per"
	para "arrivare in"
	line "cima!"
	done
	
EngineerDavidsonBeatenText:
	text "Forse dovrei solo"
	line "camminare."
	done
	
EngineerDavidsonAfterBattleText:
	text "Sei forte."
	para "Non perdere alla"
	line "LEGA o sarà una"
	para "vergogna aver"
	line "perso con te!"
	done


CooltrainermCodySeenText:
	text "Il MONTE FUJI è"
	line "immenso."
	para "Preparati, perché"
	line "starai qui per"
	cont "un po'!"
	done

CooltrainermCodyBeatenText:
	text "Se solo avessi"
	line "#MON più forti!"
	done

CooltrainermCodyAfterBattleText:
	text "La montagna è"
	line "divisa in cinque"
	cont "parti."
	para "Questa è solo la"
	line "prima!"
	done
	
CooltrainerfQuinnSeenText:
	text "Ehi tu!"
	line "Vuoi lottare?"
	done

CooltrainerfQuinnBeatenText:
	text "Distrutto…"
	done

CooltrainerfQuinnAfterBattleText:
	text "Sei forte."

	para "Devi esserti alle-"
	line "nato duramente."
	done


VictoryRoad_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  9, 51, CROWN_CITY, 5
	warp_event 17, 41, MOUNT_FUJI_OUTSIDE, 1
	warp_event  5, 33, MOUNT_FUJI_OUTSIDE, 2
	warp_event 29, 23, MOUNT_FUJI_OUTSIDE, 3
	warp_event 23, 15, MOUNT_FUJI_OUTSIDE, 4
	warp_event  5,  3, MOUNT_FUJI_OUTSIDE, 5
	warp_event 34, 25, VICTORY_ROAD, 8
	warp_event 34, 42, VICTORY_ROAD, 7
	warp_event 31,  2, VICTORY_ROAD_2F, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 23, 22, BGEVENT_ITEM, VictoryRoadHiddenMaxPotion
	bg_event  3, 40, BGEVENT_ITEM, VictoryRoadHiddenFullHeal

	db 14 ; object events
	object_event  8, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	object_event 37, 42, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE
	object_event 11, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadFullRestore, EVENT_VICTORY_ROAD_FULL_RESTORE
	object_event  7, 41, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadFullHeal, EVENT_VICTORY_ROAD_FULL_HEAL
	object_event 34,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadHPUp, EVENT_VICTORY_ROAD_HP_UP
	object_event 13, 46, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermCody, -1
	object_event 31, 44, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermJake, -1
	object_event 24, 46, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfJoyce, -1
	object_event 18, 49, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerInstructorGeoff, -1
	object_event 10, 24, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 18, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLisa, -1
	object_event 28, 24, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerEngineerDavidson, -1
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermErick, -1
	object_event 27, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfQuinn, -1

