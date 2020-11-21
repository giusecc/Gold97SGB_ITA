	object_const_def ; object_event constants
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_ROCKER
	const RADIOTOWER2F_GRUNTM24
	const RADIOTOWER2F_GRUNTM26
	const RADIOTOWER2F_BUENA

RadioTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower2FUnusedDummyScene:
; unused
	end


RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end




RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText
	
RadioTower2fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover2fRocker
	writetext RadioTower2fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover2fRocker
	writetext RadioTower2fRockerTextTakeover
	waitbutton
	closetext
	end
	

RadioTower2fBuena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover2fBuena
	writetext RadioTower2fBuenaText
	waitbutton
	closetext
	end
.MidRocketTakeover2fBuena
	writetext RadioTower2fBuenaTextTakeover
	waitbutton
	closetext
	end
	
TrainerGruntM24:
	trainer GRUNTM, GRUNTM_24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntM26:
	trainer GRUNTM, GRUNTM_26, EVENT_BEAT_ROCKET_GRUNTM_26, GruntM26SeenText, GruntM26BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM26AfterBattleText
	waitbutton
	closetext
	end
	
RadioTower2fBuenaText:
	text "Ciao! Sono BUENA!"
	para "Mi hanno assunta"
	line "da poco per"
	para "condurre un"
	line "programma radio!"
	para "Non vedo l'ora"
	line "che sia in onda!"
	done
	
RadioTower2fBuenaTextTakeover:
	text "Eek!"
	para "Non era quello che"
	line "mi aspettavo dal"
	cont "lavorare in radio!"
	done
	
	
GruntM24SeenText:
	text "Il TEAM ROCKET"
	line "conduce missioni"
	cont "in basi segrete."
	para "Ma non ci facciamo"
	line "problemi a fare"
	para "irruzione se"
	line "necessario!"
	done
	
GruntM24BeatenText:
	text "Non ti sei fatto"
	line "problemi a"
	cont "battermi!"
	done
	
GruntM24AfterBattleText:
	text "Hai visto il"
	line "nostro capo?"
	para "Credo che voi due"
	line "non andiate molto"
	cont "d'accordo."
	done

GruntM26SeenText:
	text "Perché siamo qui?"
	para "Perché tu e il"
	line "tuo amico avete"
	para "distrutto la"
	line "nostra antenna!"
	para "Perché costruirne"
	line "un'altra se pos-"
	para "siamo usare"
	line "questa!"
	done
	
GruntM26BeatenText:
	text "Ahia!"
	done
	
GruntM26AfterBattleText:
	text "È tutta colpa"
	line "vostra!"
	done

	
RadioTower2fRockerTextTakeover:
	text "Ogni stazione"
	line "radio sta parlando"
	cont "del TEAM ROCKET!"
	done

RadioTower2fRockerText:
	text "Hai mai sentito"
	line "la Marcia #MON?"
	para "Rende più"
	line "probabili gli"
	para "incontri"
	line "selvatici."
	done

MovementData_0x5d921:
;	slow_step DOWN
;	slow_step RIGHT
	step_end


RadioTowerJigglypuffText:
	text "JIGGLYPUFF:"
	line "Jiggly…"
	done


RadioTower2FSalesSignText:
	text "P1 STUDIO 1"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "#MON TALK"

	para "Il programma radio"
	line "più spumeggiante!"
	done

RadioTower2FPokemonRadioSignText:
	text "Ovunque, comunque:"
	line "Radio #MON"
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event  7,  0, RADIO_TOWER_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  6, -1, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  3,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	db 5 ; object events
	object_event  4,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event  6,  5, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2fRocker, -1
	object_event  2,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGruntM26, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2fBuena, -1
