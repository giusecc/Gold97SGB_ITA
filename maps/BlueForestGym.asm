	object_const_def ; object_event constants
	const SANSKRITGYM_PRYCE
	const SANSKRITGYM_BUENA1
;	const SANSKRITGYM_ROCKER1
;	const SANSKRITGYM_BUENA2
	const SANSKRITGYM_ROCKER2
	const SANSKRITGYM_ROCKER3
	const SANSKRITGYM_GYM_GUY

BlueForestGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestGymPryceScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_PRYCE
	iftrue RematchScriptPryce
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptPryce
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	checkcode VAR_BADGES
	scall BlueForestGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	setevent EVENT_BLUE_FOREST_SUPER_NERD_BLOCKS_GYM; for workers south of town
	setevent EVENT_STAND_CITY_ZOO_MONS; makes normal pokes in zoo disappear
	writetext PryceText_GlacierBadgeSpeech
	buttonsound
	verbosegiveitem TM_ICY_WIND
	iffalse BlueForestGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end
	
RematchScriptPryce:
	opentext
	writetext PryceRematchText
	waitbutton
	closetext
	winlosstext PryceRematchWinText, 0
	loadtrainer PRYCE, PRYCE2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_PRYCE
	opentext
	writetext PryceAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptPryce:
	opentext
	writetext PryceAfterRematchText
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
BlueForestGym_NoRoomForIcyWind:
	closetext
	end


BlueForestGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end


TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

BlueForestGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_GYM
	iftrue .PryceNotAround
	checkevent EVENT_BEAT_PRYCE
	iftrue .BlueForestGymGuyWinScript
	writetext BlueForestGymGuyText
	waitbutton
	closetext
	end
	
.PryceNotAround:
	writetext BlueForestGymGuyNotAroundText
	waitbutton
	closetext
	end

.BlueForestGymGuyWinScript:
	writetext BlueForestGymGuyWinText
	waitbutton
	closetext
	end

BlueForestGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext PRYCE, PRYCE1, MEM_BUFFER_1
	jumpstd GymStatue2Script
	

PryceRematchText:
	text "Quindi, fai"
	line "ritorno dalla"
	cont "LEGA."
	
	para "Solo perché hai"
	line "raggiunto la vetta"
	para "credi di essere"
	line "diventato immune"
	para "ai gelidi venti"
	line "della montagna?"
	
	para "Fammi mostrare"
	line "tutto ciò che ho"
	para "imparato in"
	line "questo periodo!"
	done

PryceRematchWinText:
	text "Forse dovrei dire"
	line "qualcosa sulla"
	cont "giovinezza…"
	done

PryceAfterRematchText:
	text "Sono impressionato"
	line "dalla tua abilità."
	
	para "Con la tua forza"
	line "di volontà, potrai"
	para "affrontare ogni"
	line "ostacolo!"
	done

BlueForestGymGuyNotAroundText:
	text "Ehi, ragazzo!"
	para "ALFREDO è un"
	line "uomo di ghiaccio,"
	para "ma è molto"
	line "generoso."
	para "Si prende cura dei"
	line "suoi #MON e"
	para "della sua"
	line "famiglia."
	para "Trascorre giorni e"
	line "giorni nel"
	para "PASSAGGIO SOMMERSO"
	line "per allenarsi."
	para "Quello che sto"
	line "cercando di dire"
	para "è che spesso"
	line "non si trova qui."
	para "Potrebbe volerci"
	line "un po' prima che"
	cont "torni."
	para "Se vuoi lottare"
	line "con lui dovresti"
	para "andare a"
	line "cercarlo."
	done

PryceText_Intro:
	text "Che bello"
	line "rivederti."
	
	para "I #MON fanno molte"
	line "esperienze nella"

	para "loro vita, proprio"
	line "come noi."

	para "Anch'io ho visto e"
	line "sofferto molto in"
	cont "vita mia."
	
	para "Questo è perché"
	line "ho deciso di"
	para "concentrarmi sulle"
	line "cose importanti."
	
	para "#MON. Famiglia."
	
	para "Queste sono le"
	line "cose a cui tengo."
	
	para "Cerca sempre di"
	line "trovare tempo per"
	cont "ciò che ami."
	
	para "Una buona lotta,"
	line "comunque, è una"
	
	para "esperienza molto"
	line "importante."
	
	para "Ecco, lascia che"
	line "te lo mostri."
	done


PryceText_Impressed:
	text "La tua forza mi"
	line "ha impressionato!"

	para "La tua volontà"
	line "ti permetterà"

	para "di raggiungere i"
	line "tuoi obiettivi."

	para "Meriti la MEDAGLIA"
	line "della PALESTRA!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> riceve la"
	line "MEDAGLIA GELO."
	done

PryceText_GlacierBadgeSpeech:
	text "Questa MEDAGLIA"
	line "migliora le STATI-"
	para "STICHE SPECIALI"
	line "dei #MON."

	para "Inoltre, permette"
	line "ai tuoi #MON"
	para "di usare MULINELLO"
	line "per superare i"
	cont "mulinelli d'acqua."

	para "E poi… Questo"
	line "è un mio regalo!"
	done

PryceText_IcyWindSpeech:
	text "La MT contiene"
	line "VENTOGELATO."

	para "Arreca danni e"
	line "diminuisce la"
	cont "velocità."

	para "È il simbolo"
	line "della durezza"
	cont "dell'inverno."
	done

PryceText_CherishYourPokemon:
	text "Quando il ghiaccio"
	line "e la neve si"
	para "sciolgono, è"
	line "primavera."

	para "Tu e i tuoi #-"
	line "MON sarete insieme"

	para "ancora per molti"
	line "anni."

	para "Goditi il tuo"
	line "tempo con loro!"
	done


BoarderBradSeenText:
	text "Il pavimento della"
	line "PALESTRA è"
	cont "scivoloso!"

	para "Divertente,"
	line "vero?"

	para "Ma ehi! Non siamo"
	line "qui per giocare!"
	done

BoarderBradBeatenText:
	text "Vuoi vedere quanto"
	line "siamo seri?"
	done

BoarderBradAfterBattleText:
	text "Questa PALESTRA è"
	line "grandiosa: adoro"
	para "fare snowboard"
	line "con i #MON!"
	done

BoarderDouglasSeenText:
	text "Conosco il segreto"
	line "di ALFREDO."
	done

BoarderDouglasBeatenText:
	text "Ok. Ti dirò il"
	line "segreto di"
	cont "ALFREDO."
	done

BoarderDouglasAfterBattleText:
	text "Il segreto della"
	line "forza di ALFREDO"
	cont "è questo…"

	para "Si allena in"
	line "luoghi pericolosi"
	
	para "come il PASSAG-"
	line "GIO SOMMERSO."
	done

SkierRoxanneSeenText:
	text "Per raggiungere"
	line "ALFREDO, il CAPO-"
	cont "PALESTRA, devi"

	para "pensare prima di"
	line "scivolare."
	done

SkierRoxanneBeatenText:
	text "Con gli sci"
	line "ti batterei!"
	done

SkierRoxanneAfterBattleText:
	text "Se non scivoli con"
	line "precisione, non"

	para "farai molta strada"
	line "nella PALESTRA."
	done


BlueForestGymGuyText:
	text "ALFREDO è un vete-"
	line "rano che si è"

	para "allenato per 50"
	line "anni con i"
	cont "#MON."

	para "Pare che sia abile"
	line "a congelare gli"

	para "avversari con le"
	line "sue mosse di tipo"
	cont "ghiaccio."

	para "Perciò, cerca di"
	line "arrostirlo con la"

	para "tua bruciante"
	line "ambizione!"
	done

BlueForestGymGuyWinText:
	text "ALFREDO è forte"
	line "ma tu sei tutta"
	cont "un'altra cosa!"

	para "È stata una"
	line "grande lotta, che"

	para "ha regolato i"
	line "conti tra due"
	cont "generazioni!"
	done

BlueForestGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, BLUE_FOREST, 1
	warp_event  5, 17, BLUE_FOREST, 11

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, BlueForestGymStatue
	bg_event  6, 15, BGEVENT_READ, BlueForestGymStatue

	db 5 ; object events
	object_event  3,  2, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BlueForestGymPryceScript, EVENT_PRYCE_IN_GYM
	object_event  9, 10, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
;	object_event  0, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBoarderRonald, -1
;	object_event  9, 17, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSkierClarissa, -1
	object_event  5,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  0,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestGymGuyScript, -1
