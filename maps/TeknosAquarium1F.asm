	object_const_def ; object_event constants
	const AQUA1F_RECEPTIONIST
	const AQUA1F_ROCKET2
	const AQUA1F_ROCKETF1
	const AQUA1F_YOUNGSTER
	const AQUA1F_LASS
	const AQUA1F_WHITNEYROCKET1
	const AQUA1F_WHITNEYROCKET2
	const AQUA1F_WHITNEYAQUA1
	const AQUA1F_WHITNEYAQUA2

TeknosAquarium1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end
	
AquaReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .ReceptionistNoRockets
	writetext AquaReceptionistRocketsText
	waitbutton
	closetext
	end

.ReceptionistNoRockets:
	writetext AquaReceptionistNoRocketsText
	waitbutton
	closetext
	end
	
AquaYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .YoungsterNoRockets
	writetext AquaYoungsterRocketsText
	waitbutton
	closetext
	end

.YoungsterNoRockets:
	writetext AquaYoungsterNoRocketsText
	waitbutton
	closetext
	end
	
AquaLassScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .LassNoRockets
	writetext AquaLassRocketsText
	waitbutton
	closetext
	end

.LassNoRockets:
	writetext AquaLassNoRocketsText
	waitbutton
	closetext
	end
	
Aqua1FExhibit1Script:
	jumptext Aqua1FExhibit1Text
	
Aqua1FExhibit2Script:
	jumptext Aqua1FExhibit2Text
	
Aqua1FExhibit3Script:
	jumptext Aqua1FExhibit3Text
	
Aqua1FExhibit4Script:
	jumptext Aqua1FExhibit4Text
	
WhitneyRocket1:
	faceplayer
	opentext
	writetext WhitneyRocket1Text
	waitbutton
	closetext
	turnobject AQUA1F_WHITNEYROCKET1, DOWN
	end
	
WhitneyRocket2:
	faceplayer
	opentext
	writetext WhitneyRocket2Text
	waitbutton
	closetext
	turnobject AQUA1F_WHITNEYROCKET2, RIGHT
	end
	
TeknosAquariumLeftScene:
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEYAQUA1, 13, 7
	appear AQUA1F_WHITNEYAQUA1
	turnobject AQUA1F_WHITNEYAQUA1, UP
	pause 15
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyDummyMovement
	opentext
	writetext WhitneyWhatIsThisText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyWalksToRockets
	applymovement PLAYER, PlayerWalksOverLeftScene
	turnobject AQUA1F_WHITNEYAQUA1, DOWN
	opentext
	writetext WhitneyWhatIsThisText2
	waitbutton
	closetext
	setscene SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	setevent EVENT_WHITNEY_2_AQUARIUM
	clearevent EVENT_WHITNEY_1_AQUARIUM
	appear AQUA1F_WHITNEYAQUA2
	disappear AQUA1F_WHITNEYAQUA1
	end

TeknosAquariumUpLeftScene:
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEYAQUA1, 13, 7
	appear AQUA1F_WHITNEYAQUA1
	turnobject AQUA1F_WHITNEYAQUA1, UP
	pause 15
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyDummyMovement
	opentext
	writetext WhitneyWhatIsThisText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyWalksToRockets
	applymovement PLAYER, PlayerWalksOverLeftUpScene
	turnobject AQUA1F_WHITNEYAQUA1, DOWN
	opentext
	writetext WhitneyWhatIsThisText2
	waitbutton
	closetext
	setscene SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	setevent EVENT_WHITNEY_2_AQUARIUM
	clearevent EVENT_WHITNEY_1_AQUARIUM
	appear AQUA1F_WHITNEYAQUA2
	disappear AQUA1F_WHITNEYAQUA1
	end
TeknosAquariumUpRightScene:
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEYAQUA1, 12, 7
	appear AQUA1F_WHITNEYAQUA1
	turnobject AQUA1F_WHITNEYAQUA1, UP
	pause 15
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyDummyMovement
	opentext
	writetext WhitneyWhatIsThisText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyWalksToRockets2
	applymovement PLAYER, PlayerWalksOverRightUpScene
	turnobject AQUA1F_WHITNEYAQUA1, DOWN
	opentext
	writetext WhitneyWhatIsThisText2
	waitbutton
	closetext
	setscene SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	setevent EVENT_WHITNEY_2_AQUARIUM
	clearevent EVENT_WHITNEY_1_AQUARIUM
	appear AQUA1F_WHITNEYAQUA2
	disappear AQUA1F_WHITNEYAQUA1
	end
	
WhitneyAquaScript:
	opentext
	writetext WhitneyInAquaText
	waitbutton
	closetext
	end
	
PlayerWalksOverRightUpScene:
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
PlayerWalksOverLeftUpScene:
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
WhitneyWalksToRockets2:
	step UP
	step UP
	step LEFT
	step LEFT
	step_end
		
WhitneyWalksToRockets:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PlayerWalksOverLeftScene:
	step LEFT
	step UP
	step_end
	
WhitneyDummyMovement:
	step_end
	
WhitneyInAquaText:
	text "Non mi tirerò"
	line "indietro!"
	done
	
WhitneyRocket1Text:
	text "Ugh, è forte."
	done
	
WhitneyRocket2Text:
	text "Non ho mai visto"
	line "un MILTANK così"
	cont "forte…"
	done
	
WhitneyWhatIsThisText:
	text "Cosa succede qui?"
	para "È inaccettabile!"
	para "Il TEAM ROCKET"
	line "non deve"
	cont "stare qui!"
	done
	
WhitneyWhatIsThisText2:
	text "Sei <PLAYER>,"
	line "vero?"
	para "Non ci siamo"
	line "visti alla CAVA?"
	para "Che ne dici se"
	line "mi occupo di"
	para "questi qui e"
	line "tu vai avanti?"
	para "Facciamo vedere"
	line "chi comanda!"
	done
	
Aqua1FExhibit1Text:
	text "KRABBY adora"
	line "nascondersi"
	cont "sotto la sabbia."
	para "Guarda con"
	line "attenzione per"
	cont "vederlo."
	done
	
Aqua1FExhibit2Text:
	text "NUOVA MOSTRA"
	line "IN ARRIVO"
	done

Aqua1FExhibit3Text:
	text "OSUNFISH e"
	line "MAGIKARP possono"
	para "condividere lo"
	line "stesso spazio"
	cont "vitale."
	done
	
GruntM2SeenText:
	text "Prenderemo tutto"
	line "quello che c'è"
	para "qui e lo"
	line "rivenderemo!"
	para "Ci servono soldi"
	line "per i nsotri"
	cont "piani!"
	done
	
Aqua1FExhibit4Text:
	text "STATUA DI LAPRAS"
	para "Si dice che alcuni"
	line "LAPRAS vivano"
	para "nelle profondità"
	line "della CAVA a"
	cont "ovest della città."
	done

GruntM2BeatenText:
	text "Solo…"
	line "Troppo forte…"
	done

GruntM2AfterBattleText:
	text "Questo è solo"
	line "l'inizio!"
	done
	

AquaReceptionistRocketsText:
	text "Attento! I ragaz-"
	line "zini non devono"
	cont "essere qui."
	para "Abbiamo seri"
	line "problemi con"
	para "questi criminali."
	done

AquaReceptionistNoRocketsText:
	text "Benvenuto"
	line "all'ACQUARIO di"
	cont "TECNOPOLI!"
	para "Fai un giro"
	line "dove vuoi."
	done

GruntF1SeenText:
	text "Ci sono molti"
	line "#MON rari da"
	para "rubare e"
	line "rivendere!"
	para "Non ti"
	line "intromettere!"
	done

GruntF1BeatenText:
	text "Brutto marmocchio!"
	done

GruntF1AfterBattleText:
	text "Il TEAM ROCKET"
	line "non dimentica!"
	done
	
AquaYoungsterRocketsText:
	text "Hmm… Non credo"
	line "che questi"
	para "tipi loschi"
	line "debbano essere"
	cont "qui…"
	done

AquaYoungsterNoRocketsText:
	text "Volevo vedere"
	line "un ANCHORAGE"
	para "dal vivo, ma"
	line "non ce ne"
	cont "sono qui."
	done
	
AquaLassRocketsText:
	text "Eeek!"
	para "Oh, non sei uno"
	line "di loro."
	para "Mi spaventano!"
	para "Forse dovrei"
	line "andarmene."
	done

AquaLassNoRocketsText:
	text "L'ACQUARIO è"
	line "nuovo."
	para "Non ci sono"
	line "molte mostre."
	done

TeknosAquarium1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  7, TEKNOS_CITY, 9
	warp_event 13,  7, TEKNOS_CITY, 5
	warp_event  0,  7, TEKNOS_AQUARIUM_2F, 1

	db 3 ; coord events
	coord_event 11,  7, SCENE_DEFAULT, TeknosAquariumLeftScene
	coord_event 12,  6, SCENE_DEFAULT, TeknosAquariumUpLeftScene
	coord_event 13,  6, SCENE_DEFAULT, TeknosAquariumUpRightScene

	db 4 ; bg events
	bg_event  1,  3, BGEVENT_READ, Aqua1FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua1FExhibit2Script
	bg_event 10,  3, BGEVENT_READ, Aqua1FExhibit3Script
	bg_event  4,  1, BGEVENT_READ, Aqua1FExhibit4Script


	db 9 ; object events
	object_event 15,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaReceptionistScript, -1
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM2, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  5,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF1, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event 13,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaYoungsterScript, -1
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaLassScript, -1
	object_event 10,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhitneyRocket1, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  9,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhitneyRocket2, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  7,  6, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhitneyAquaScript, EVENT_WHITNEY_2_AQUARIUM
	object_event 10,  5, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhitneyAquaScript, EVENT_WHITNEY_1_AQUARIUM
