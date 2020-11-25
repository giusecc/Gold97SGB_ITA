	object_const_def ; object_event constants
	const URASOEPARK_POKEFAN_M1
	const URASOEPARK_POKEFAN_M2
	const URASOEPARK_SUPER_NERD
	const URASOEPARK_LASS
	const URASOEPARK_ITEMBALL
	const URASOEPARK_ITEMBALL2

UrasoePark_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJimAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerLandon:
	trainer ENGINEER, LANDON, EVENT_BEAT_ENGINEER_LANDON, EngineerLandonSeenText, EngineerLandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerLandonAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmRobert:
	trainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRobertAfterBattleText
	waitbutton
	closetext
	end
	
UrasoeParkLassScript:
	jumptextfaceplayer UrasoeParkLassText

TropicalIslandJungleSign:
	jumptext TropicalIslandJungleSignText
	

UrasoeParkMiracleseed:
	itemball MIRACLE_SEED

	
UrasoeParkCalmSeed:
	itemball CALM_SEED

	
UrasoeParkLassText:
	text "I #MON qui"
	line "sono molto forti."
	para "Questo posto è"
	line "stato realizzato"
	para "per non far"
	line "espandere la CITTÀ"
	cont "DI RYU KYU."
	done

HikerJimSeenText:
	text "Hahahah!"
	done

HikerJimBeatenText:
	text "Hahaha-ecciù!"
	done

HikerJimAfterBattleText:
	text "Tutta quest'erba"
	line "mi fa starnutire!"
	cont "Ecciùù!"
	done

PokefanmRobertSeenText:
	text "Adori i #MON,"
	line "non è vero?"

	para "Anch'io!"
	done

PokefanmRobertBeatenText:
	text "Devo ammettere"
	line "la sconfitta."
	done

PokefanmRobertAfterBattleText:
	text "Guarda cosa hai"
	line "fatto ai miei"
	cont "#MON…"

	para "Non me lo"
	line "dimenticherò…"
	done
	
EngineerLandonSeenText:
	text "Ho un piano"
	line "piano per"
	cont "vincere!"
	done
	
EngineerLandonBeatenText:
	text "Il mio piano"
	line "richiedre tempo!"
	done
	
EngineerLandonAfterBattleText:
	text "Il piano era"
	line "avere dei #MON"
	cont "più forti."
	done

TropicalIslandJungleSignText:
	text "PARCO URASOE"

	para "Riserva naturale"
	line "di #MON"
	done

UrasoePark_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 22,  1, RYUKYU_URASOE_PARK_GATE, 3
	warp_event 23,  1, RYUKYU_URASOE_PARK_GATE, 4
	warp_event 18, 12, URASOE_PARK_URASOE_TRAIL_GATE, 1
	warp_event 19, 12, URASOE_PARK_URASOE_TRAIL_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20,  2, BGEVENT_READ, TropicalIslandJungleSign

	db 6 ; object events
	object_event 30,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
	object_event 16,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmRobert, -1
	object_event  4,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerEngineerLandon, -1
	object_event  3, 15, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, UrasoeParkLassScript, -1
	object_event 39,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeParkMiracleseed, EVENT_PICKED_UP_GOLD_BERRY_FROM_HO_OH_ITEM_ROOM
	object_event  7, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeParkCalmSeed, EVENT_URASOE_PARK_CALM_SEED
