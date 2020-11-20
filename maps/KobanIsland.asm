	object_const_def ; object_event constants
	const KOBANISLAND_GRANNY
	const KOBANISLAND_TWIN
	const KOBANISLAND_GRAMPS
	const KOBANISLAND_CLAIR

KobanIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KOBAN
	return

KobanIslandTeacherScript:
	jumptextfaceplayer KobanIslandTeacherText

KobanIslandGrampsScript:
	jumptextfaceplayer KobanIslandGrampsText

KobanIslandFisherScript:
	jumptextfaceplayer KobanIslandFisherText

KobanIslandSign:
	jumpstd PokecenterSignScript

RedsHouseSign:
	jumpstd MartSignScript

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText
	
KobanIslandClairScript:
	faceplayer
	opentext
	writetext ClairGreetingsText
	waitbutton
	closetext
	pause 2
	checkcode VAR_FACING
	ifequal RIGHT, .ClairWalksAroundPlayer
	applymovement KOBANISLAND_CLAIR, ClairLeavesMovement
	disappear KOBANISLAND_CLAIR
	setevent EVENT_BLUE_FOREST_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLUE_FOREST_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.ClairWalksAroundPlayer
	applymovement KOBANISLAND_CLAIR, ClairLeavesMovement2
	disappear KOBANISLAND_CLAIR
	setevent EVENT_BLUE_FOREST_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLUE_FOREST_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

KobanIslandTeacherText:
	text "Le correnti marine"
	line "mantengono queste"
	para "isole più calde"
	line "di BIANCASELVA,"
	para "che è a est di"
	line "qui."
	done

KobanIslandGrampsText:
	text "Gli allenatori di"
	line "questa città sono"
	para "esperti nel"
	line "crescere i #MON"
	cont "DRAGO."
	done

KobanIslandFisherText:
	text "Un giorno voglio"
	line "allenare un DRAGO!"
	done

OaksLabSignText:
	text "ISOLA ZUCCHERINO"
	para "Un'isoletta dalla"
	line "grande storia."
	done

BluesHouseSignText:
	text "TANA DEL DRAGO"
	done
	
ClairGreetingsText:
	text "Salve."
	para "Tu saresti?"
	para "…"
	para "Bene, <PLAYER>,"
	line "io sono SANDRA."
	para "Sono il MAESTRO"
	line "di #MON DRAGO"
	cont "migliore di NIHON."
	para "…Bene, forse il"
	line "secondo."
	para "Ma quel che conta"
	line "è la TANA DEL"
	para "DRAGO qui dietro."
	para "È un luogo mistico"
	line "dove si dice siano"
	para "nati i primi #-"
	line "MON DRAGO."
	para "Hai qualche #-"
	line "MON DRAGO?"
	para "Se vuoi che gli"
	line "allenatori del"
	para "tipo DRAGO ti"
	line "rispettino, devi"
	para "allenarti nella"
	line "grotta."
	para "Ci sono molti al-"
	line "lenatori DRAGO."
	para "Uno di loro tiene"
	line "una DRAGOSFERA."
	para "Trova la sfera e"
	line "portamela!"
	para "È il primo passo"
	line "per diventare un"
	para "ALLENATORE DRAGO."
	para "Ti aspetto qui!"
	done

ClairLeavesMovement:
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
ClairLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

KobanIsland_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  5,  5, KOBAN_HOUSE_1, 1
	warp_event  5, 10, KOBAN_MART, 1
	warp_event  9, 10, KOBAN_POKECENTER_1F, 1
	warp_event 15,  9, KOBAN_HOUSE_2, 1
	warp_event 13,  5, DRAGONS_DEN_B1F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 10, 10, BGEVENT_READ, KobanIslandSign
	bg_event  6, 10, BGEVENT_READ, RedsHouseSign
	bg_event 10, 14, BGEVENT_READ, OaksLabSign
	bg_event 14,  6, BGEVENT_READ, BluesHouseSign

	db 4 ; object events
	object_event  9,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanIslandTeacherScript, -1
	object_event  8, 12, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KobanIslandFisherScript, -1
	object_event 13, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanIslandGrampsScript, -1
	object_event 13,  6, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0 , -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanIslandClairScript, EVENT_BLUE_FOREST_GRAMPS_BLOCKS_DRAGONS_DEN
