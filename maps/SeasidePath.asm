	object_const_def ; object_event constants
	const SEASIDE_PATH_YOUNGSTER_1
	const SEASIDE_PATH_YOUNGSTER_2
	const SEASIDE_PATH_POKEFAN_M
	const SEASIDE_PATH_POKEFAN_M_2
	const SEASIDE_PATH_ITEMBALL
	
SeasidePath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPeter:
	trainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, BirdKeeperPeterSeenText, BirdKeeperPeterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPeterAfterText
	waitbutton
	closetext
	end
	
TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end
	

TrainerHikerTimothy:
	trainer HIKER, TIMOTHY, EVENT_BEAT_HIKER_TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimothyAfterBattleText
	waitbutton
	closetext
	end
	
SeasidePathCleanseTag:
	itemball CLEANSE_TAG


SeasidePathSign:
	jumptext SeasidePathSignText
	
JouleCaveSign:
	jumptext JouleCaveSignText
	
SeasidePathSignText:
	text "RIVA"
	para "CITTÀ DI NAZE -"
	line "VILLAGGIO NAGO"
	done
	
JouleCaveSignText:
	text "GROTTA JOULE"
	line "ENTRATA"
	done

HikerTimothySeenText:
	text "Perché scalo le"
	line "montagne?"

	para "Perché sono sul"
	line "mio cammino."

	para "Perché alleno i"
	line "#MON?"

	para "Perché sono"
	line "sul mio cammino!"
	done

HikerTimothyBeatenText:
	text "Le sconfitte…"
	line "Anche loro sono"
	cont "sul mio cammino!"
	done

HikerTimothyAfterBattleText:
	text "I #MON sono"
	line "la miglior cosa"

	para "che mi potesse"
	line "accadere."
	done

PsychicFidelSeenText:
	text "Vedo…"

	para "Vedo tutto"
	line "di te…"
	done

PsychicFidelBeatenText:
	text "Non ho visto la"
	line "tua forza…"
	done

PsychicFidelAfterBattleText:
	text "Non posso"
	line "prevedere tutto."
	done

BirdKeeperPeterSeenText:
	text "Non posso volare"
	line "abbastanza lontano"
	para "da tornare alla"
	line "terraferma."
	done

BirdKeeperPeterBeatenText:
	text "Conosco le"
	line "mie debolezze."
	done

BirdKeeperPeterAfterText:
	text "Vorrei poter"
	line "volare…"
	done
	
PokefanmJoshuaSeenText:
	text "Hihihi! Vuoi"
	line "sfidare la mia"
	cont "banda di PIKACHU?"
	done

PokefanmJoshuaBeatenText:
	text "PI-PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "Hai molti"
	line "#MON,"

	para "ma PIKACHU è"
	line "il migliore."
	done

SeasidePath_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, SEASIDE_PATH_ISEN_STRAIT_GATE, 4
	warp_event 53, 11, JOULE_CAVE_1F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 26,  4, BGEVENT_READ, SeasidePathSign
	bg_event 52, 12, BGEVENT_READ, JouleCaveSign

	db 5 ; object events
	object_event 15, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBirdKeeperPeter, -1
	object_event 43, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicFidel, -1
	object_event 21,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 30,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerTimothy, -1
	object_event 50,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeasidePathCleanseTag, EVENT_PICKED_UP_STAR_PIECE_FROM_OMANYTE_ITEM_ROOM
