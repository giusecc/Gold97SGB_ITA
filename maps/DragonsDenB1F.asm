	object_const_def ; object_event constants
	const DRAGONSDENB1F_POKE_BALL1
	const DRAGONSDENB1F_COOLTRAINER_M
	const DRAGONSDENB1F_COOLTRAINER_F
	const DRAGONSDENB1F_TWIN1
	const DRAGONSDENB1F_TWIN2
	const DRAGONSDENB1F_POKE_BALL2
	const DRAGONSDENB1F_POKE_BALL3
	const DRAGONSDENB1F_GENTLEMAN

DragonsDenB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DRAGONSDENB1F_NOTHING
	scene_script .DummyScene1 ; SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end


	;giveitem TM_DRAGONBREATH
	;setevent EVENT_GOT_TM24_DRAGONBREATH


TrainerCooltrainermDarin:
	trainer COOLTRAINERM, DARIN, EVENT_BEAT_COOLTRAINERM_DARIN, CooltrainermDarinSeenText, CooltrainermDarinBeatenText, 0, .Script

.Script:
	checkevent EVENT_BEAT_COOLTRAINERF_CARA
	iftrue .DarinCheck2
	opentext
	writetext CooltrainermDarinAfterBattleTextNotDone
	waitbutton
	closetext
	end

.DarinCheck2
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .DarinCheck3
	opentext
	writetext CooltrainermDarinAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.DarinCheck3
	checkevent EVENT_BEAT_TWINS_LEA_AND_PIA
	iftrue .DarinOrbCheck
	opentext
	writetext CooltrainermDarinAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.DarinOrbCheck
	checkevent EVENT_FOUND_MACHINE_PART_IN_JADE_FOREST_SNORLAX_ROOM
	iffalse .DarinGetDragonOrb
	opentext
	writetext CooltrainermDarinAfterBattleText
	waitbutton
	closetext
	end

.DarinGetDragonOrb
	jump DragonOrbGetScript
	end

TrainerInstructorRand:
	trainer INSTRUCTOR, RAND, EVENT_BEAT_INSTRUCTOR_RAND, InstructorRandSeenText, InstructorRandBeatenText, 0, .Script

.Script:
	checkevent EVENT_BEAT_COOLTRAINERF_CARA
	iftrue .RandCheck2
	opentext
	writetext InstructorRandAfterBattleTextNotDone
	waitbutton
	closetext
	end

.RandCheck2
	checkevent EVENT_BEAT_COOLTRAINERM_DARIN
	iftrue .RandCheck3
	opentext
	writetext InstructorRandAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.RandCheck3
	checkevent EVENT_BEAT_TWINS_LEA_AND_PIA
	iftrue .RandOrbCheck
	opentext
	writetext InstructorRandAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.RandOrbCheck
	checkevent EVENT_FOUND_MACHINE_PART_IN_JADE_FOREST_SNORLAX_ROOM
	iffalse .RandGetDragonOrb
	opentext
	writetext InstructorRandAfterBattleText
	waitbutton
	closetext
	end

.RandGetDragonOrb
	jump DragonOrbGetScript
	end

TrainerCooltrainerfCara:
	trainer COOLTRAINERF, CARA, EVENT_BEAT_COOLTRAINERF_CARA, CooltrainerfCaraSeenText, CooltrainerfCaraBeatenText, 0, .Script


.Script:
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .CaraCheck2
	opentext
	writetext CooltrainerfCaraAfterBattleTextNotDone
	waitbutton
	closetext
	end

.CaraCheck2
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .CaraCheck3
	opentext
	writetext CooltrainerfCaraAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.CaraCheck3
	checkevent EVENT_BEAT_TWINS_LEA_AND_PIA
	iftrue .CaraOrbCheck
	opentext
	writetext CooltrainerfCaraAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.CaraOrbCheck
	checkevent EVENT_FOUND_MACHINE_PART_IN_JADE_FOREST_SNORLAX_ROOM
	iffalse .CaraGetDragonOrb
	opentext
	writetext CooltrainerfCaraAfterBattleText
	waitbutton
	closetext
	end
	
.CaraGetDragonOrb
	jump DragonOrbGetScript
	end

TrainerTwinsLeaandpia1:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia1SeenText, TwinsLeaandpia1BeatenText, 0, .Script

.Script:
	checkevent EVENT_BEAT_COOLTRAINERF_CARA
	iftrue .Twin1Check2
	opentext
	writetext TwinsLeaandpia1AfterBattleTextNotDone
	waitbutton
	closetext
	end

.Twin1Check2
	checkevent EVENT_BEAT_COOLTRAINERM_DARIN
	iftrue .Twin1Check3
	opentext
	writetext TwinsLeaandpia1AfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.Twin1Check3
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .Twin1OrbCheck
	opentext
	writetext TwinsLeaandpia1AfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.Twin1OrbCheck
	checkevent EVENT_FOUND_MACHINE_PART_IN_JADE_FOREST_SNORLAX_ROOM
	iffalse .Twin1GetDragonOrb
	opentext
	writetext TwinsLeaandpia1AfterBattleText
	waitbutton
	closetext
	end

.Twin1GetDragonOrb
	jump DragonOrbGetScript
	end

TrainerTwinsLeaandpia2:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia2SeenText, TwinsLeaandpia2BeatenText, 0, .Script

.Script:
	checkevent EVENT_BEAT_COOLTRAINERF_CARA
	iftrue .Twin2Check2
	opentext
	writetext TwinsLeaandpia2AfterBattleTextNotDone
	waitbutton
	closetext
	end

.Twin2Check2
	checkevent EVENT_BEAT_COOLTRAINERM_DARIN
	iftrue .Twin2Check3
	opentext
	writetext TwinsLeaandpia2AfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.Twin2Check3
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .Twin2OrbCheck
	opentext
	writetext TwinsLeaandpia2AfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.Twin2OrbCheck
	checkevent EVENT_FOUND_MACHINE_PART_IN_JADE_FOREST_SNORLAX_ROOM
	iffalse .Twin2GetDragonOrb
	opentext
	writetext TwinsLeaandpia2AfterBattleText
	waitbutton
	closetext
	end
	
.Twin2GetDragonOrb
	jump DragonOrbGetScript
	end

DragonsDenB1FDragonFangScript:
	itemball DRAGON_FANG



KantoRestaurantSignpost:
	jumptext KantoRestaurantSignpostText

DragonsDenB1FCalcium:
	itemball TM_DRAGONBREATH

DragonsDenB1FMaxElixer:
	itemball MAX_ELIXER

DragonsDenB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE

DragonsDenB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION

DragonsDenB1FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER

DragonOrbGetScript:
	opentext
	writetext HeresTheOrb
	waitbutton
	verbosegiveitem MACHINE_PART
	setevent EVENT_FOUND_MACHINE_PART_IN_JADE_FOREST_SNORLAX_ROOM
;	writetext HeresTheOrb2
;	waitbutton
	closetext
	end
	
HeresTheOrb:
	text "Alla fine hai"
	line "trovato chi ha"
	para "la DRAGOSFERA."
	para "Prendila e portala"
	line "a SANDRA."
	done
	
HeresTheOrb2:
	text "ottiene la sfera"
	done

KantoRestaurantSignpostText:
	text "SANTUARIO DRAGO."

	para "Un santuario in"
	line "onore del"

	para "drago che pare"
	line "abitasse nella"
	cont "TANA DEL DRAGO."
	done

CooltrainermDarinSeenText:
	text "Tu! Sai cosa"
	line "serve per allenare"
	para "i potenti"
	line "#MON DRAGO?"
	done

CooltrainermDarinBeatenText:
	text "S-sei forte!"
	done

CooltrainermDarinAfterBattleText:
	text "Sono sicuro che ti"
	line "divertirai ad"
	para "allenare qui la"
	line "tua squadra."
	done

CooltrainermDarinAfterBattleTextNotDone:
	text "DRAGOSFERA?"
	para "Non sono io a"
	line "tenerla."
	done

CooltrainerfCaraSeenText:
	text "SANDRA ti ha dato"
	line "il permesso di"
	cont "entrare qui?"
	done

CooltrainerfCaraBeatenText:
	text "Ho perso!"
	done

CooltrainerfCaraAfterBattleTextNotDone:
	text "No, non sono io a"
	line "tenere la SFERA."
	para "Riprova!"
	done

CooltrainerfCaraAfterBattleText:
	text "Allenare #MON"
	line "DRAGO è molto più"
	para "difficile di quel"
	line "che sembra."
	done


InstructorRandSeenText:
	text "Hai imparato"
	line "abbastanza sul"
	para "mistico tipo"
	line "DRAGO da portare"
	para "il dovuto"
	line "rispetto?"
	done

InstructorRandBeatenText:
	text "Peccato, ho perso!"
	done

InstructorRandAfterBattleText:
	text "La storia dei"
	line "maestri del tipo"
	para "DRAGO è lunga"
	line "e complessa."
	para "Molti credono che"
	line "sia iniziata qui."
	done

InstructorRandAfterBattleTextNotDone:
	text "La SFERA? Niente"
	line "da fare. Prova"
	cont "altrove."
	done

TwinsLeaandpia1SeenText:
	text "Uno sconosciuto!"
	done

TwinsLeaandpia1BeatenText:
	text "Ahia."
	done

TwinsLeaandpia1AfterBattleText:
	text "Hai mai sfidato"
	line "LANCE? È l'unico"
	para "maestro del tipo"
	line "DRAGO ritenuto"
	para "superiore a"
	line "SANDRA."
	done
	
TwinsLeaandpia1AfterBattleTextNotDone:
	text "DRAGOSFERA?"
	line "No, non è qui!"
	done

TwinsLeaandpia2SeenText:
	text "E tu chi sei?"
	done

TwinsLeaandpia2BeatenText:
	text "Cattivone."
	done

TwinsLeaandpia2AfterBattleTextNotDone:
	text "DRAGOSFERA?"
	line "Io non ce l'ho!"
	done

TwinsLeaandpia2AfterBattleText:
	text "Io e mia sorella"
	line "sfideremo SANDRA"
	para "e LANCE un giorno!"
	done

DragonsDenB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9, 31, KOBAN_ISLAND, 5
	warp_event  3, 25, KANTO_RESTAURANT, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  3, 27, BGEVENT_READ, KantoRestaurantSignpost
	bg_event 33, 29, BGEVENT_ITEM, DragonsDenB1FHiddenRevive
	bg_event  6,  4, BGEVENT_ITEM, DragonsDenB1FHiddenMaxPotion
	bg_event 28, 16, BGEVENT_ITEM, DragonsDenB1FHiddenMaxElixer

	db 8 ; object events
	object_event 33, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FDragonFangScript, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	object_event 23,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermDarin, -1
	object_event 16,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCara, -1
	object_event  2, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia1, -1
	object_event  2, 13, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia2, -1
	object_event 19, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FCalcium, EVENT_DRAGONS_DEN_B1F_CALCIUM
	object_event 26, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FMaxElixer, EVENT_DRAGONS_DEN_B1F_MAX_ELIXER
	object_event 24, 25, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerInstructorRand, -1
