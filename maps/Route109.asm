	object_const_def ; object_event constants
	const ROUTE109_BEAUTY
;	const ROUTE109_POKEFAN_M
	const ROUTE109_POKEFAN_F1
	const ROUTE109_PSYCHIC_NORMAN
	const ROUTE109_FRUIT_TREE
	const ROUTE109_POKEFAN_F2
	const ROUTE109_BUGCATCHER

Route109_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerBugCatcherEd:
	trainer BUG_CATCHER, ED, EVENT_BEAT_BUG_CATCHER_ED, BugCatcherEdSeenText, BugCatcherEdBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherEdAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end


TrainerBeautyValerie:
	trainer BEAUTY, VALERIE, EVENT_BEAT_BEAUTY_VALERIE, BeautyValerieSeenText, BeautyValerieBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyValerieAfterBattleText
	waitbutton
	closetext
	end


TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end

Route109Sign:
	setflag ENGINE_FLYPOINT_SILENT
	setflag ENGINE_FLYPOINT_BIRDON
	setflag ENGINE_FLYPOINT_PAGOTA
	clearflag ENGINE_FLYPOINT_KOBAN
	jumptext Route109SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route109TrainerTips:
	jumptext Route109TrainerTipsText

Route109FruitTree:
	fruittree FRUITTREE_ROUTE_109

Route109HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_109_HIDDEN_NUGGET
	

BugCatcherEdSeenText:
	text "Hai dei #MON"
	line "COLEOTTERO?"
	done

BugCatcherEdBeatenText:
	text "Uso solo i"
	line "COLEOTTERI!"
	done

BugCatcherEdAfterBattleText:
	text "Ogni allenatore"
	line "dovrebbe avere"
	para "dei #MON"
	line "COLEOTTERO."
	done


PokefanmDerekSeenText:
	text "È così bello"
	line "girare con il"
	cont "mio PIKACHU!"
	done

PokefanmDerekBeatenText:
	text "Non ho avuto tempo"
	line "per mostrare il"
	cont "mio PIKACHU…"
	done

PokefanMDerekText_NotBragging:
	text "Non ti sentirò"
	line "se ti vanti!"

	para "Noi # FANATICI"
	line "non possiamo"

	para "ascoltare altri"
	line "vantarsi!"
	done

PokefanfRuthSeenText:
	text "Che bei"
	line "#MON."

	para "Mostriamo i nostri"
	line "#MON insieme"
	cont "allo stesso tempo."
	done

PokefanfRuthBeatenText:
	text "Non mi importa"
	line "perdere."
	done

PokefanfRuthAfterBattleText:
	text "Conosci i cuccioli"
	line "di #MON?"

	para "Sono così"
	line "adorabili!"
	done

PokefanMDerekPikachuIsItText:
	text "PIKACHU lo è!"
	line "Concordi?"
	done

PsychicNormanSeenText:
	text "Fammi vedere di"
	line "cosa sono capaci"
	cont "i tuoi #MON."
	done

PsychicNormanBeatenText:
	text "Oh, i tuoi #MON"
	line "hanno del"
	cont "potenziale."
	done

PsychicNormanAfterBattleText:
	text "Sapevi che i"
	line "#MON hanno"
	cont "abilità diverse?"

	para "Anche le persone."
	line "Tutti hanno"
	cont "diverse capacità!"
	done

PokefanfJaimeHopeItGetsDarkText:
	text "Hehe… Spero faccia"
	line "buio presto."
	done

PokefanfJaimeSeenText:
	text "Sei arrivato al"
	line "momento giusto."

	para "Lottiamo."
	done

PokefanfJaimeBeatenText:
	text "Oh, che"
	line "disdetta…"
	done

PokefanfJaimeAfterBattleText:
	text "Ho incontrato"
	line "PONYTA di notte,"
	cont "sul PERCORSO 109."

	para "Non so perché,"
	line "ma sembra che"

	para "gli piaccia"
	line "venire qui."

	para "Diventa più"
	line "amichevole quando"

	cont "ci alleniamo qui."
	done


BeautyValerieSeenText:
	text "Ciao! Sei"
	line "carino!"

	para "Posso vedere"
	line "i tuoi #MON?"
	done

BeautyValerieBeatenText:
	text "Che bello vedere"
	line "i tuoi #MON!"
	done

BeautyValerieAfterBattleText:
	text "Se vedo un #-"
	line "MON, mi si"
	cont "calmano i nervi."
	done
	
	

Route109SignText:
	text "PERCORSO 109"

	para "DESMOPOLI -"
	line "TECNOPOLI"
	done

MoomooFarmSignText:
	text "Cura i #MON!"
	line "CENTRO #MON"
	done

Route109TrainerTipsText:
	text "CONSIGLI UTILI"

	para "Usa BOTTINTESTA"
	line "per scovare #-"
	para "MON tra gli"
	line "alberi."

	para "Sono molti i"
	line "#MON che si"
	para "nascondono tra"
	line "gli alberi."

	para "Usa BOTTINTESTA su"
	line "un qualsiasi al-"
	cont "bero, e vedrai!"
	done

Route109_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 15, 13, AMPARE_CAVERN_1F, 1
	warp_event 13, 28, ROUTE_109_POKECENTER_1F, 1
	warp_event  8,  5, ROUTE_109_ROUTE_110_GATE, 1
	warp_event  9,  5, ROUTE_109_ROUTE_110_GATE, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  4, 56, BGEVENT_READ, Route109TrainerTips
	bg_event 14, 28, BGEVENT_READ, MoomooFarmSign
	bg_event  1, 79, BGEVENT_READ, Route109Sign
	bg_event  4, 35, BGEVENT_ITEM, Route109HiddenNugget

	db 6 ; object events
	object_event  4, 63, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBeautyValerie, -1
;	object_event  9, 52, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek, -1
	object_event 14, 36, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanfRuth, -1
	object_event  5, 31, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicNorman, -1
	object_event 10, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route109FruitTree, -1
	object_event  4, 49, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
	object_event  9, 84, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherEd, -1
