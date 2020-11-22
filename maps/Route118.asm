	object_const_def ; object_event constants
	const ROUTE118_YOUNGSTER
	const ROUTE118_LASS1
	const ROUTE118_LASS2
	const ROUTE118_POKE_BALL
	const SANSKRIT_ROUTE_TRAINER
	const SANSKRIT_ROUTE_MON
	const ROUTE118_FRUIT_TREE
	const ROUTE118_SWIMMERM
	const ROUTE118_SWIMMERM2
	const ROUTE118_SWIMMERM3

Route118_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SanskritTownRouteCooltrainermScript:
	end
SanskritTownRouteMonsterScript:
	end
	
MotobuPathFruitTree:
	fruittree FRUITTREE_MOTOBU_PATH

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermHal:
	trainer SWIMMERM, HAL, EVENT_BEAT_SWIMMERM_HAL, SwimmermHalSeenText, SwimmermHalBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHalAfterBattleText
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route118HPUp:
	itemball HP_UP

Route118HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_118_HIDDEN_ULTRA_BALL
	
	
SwimmermHalSeenText:
	text "Vai a ELIOPOLI?"

	para "Che ne dici di"
	line "una lotta?"
	done
	
SwimmermHalBeatenText:
	text "Ho perso!"
	done


SwimmermHalAfterBattleText:
	text "Devo dire che"
	line "nuoto meglio"
	cont "di te!"
	done

BirdKeeperHankSeenText:
	text "Alleno i miei"
	line "#MON. Vuoi"
	cont "lottare con me?"
	done

BirdKeeperHankBeatenText:
	text "Ah! Ho perso…"
	done

BirdKeeperHankAfterBattleText:
	text "Se vuoi allenare"
	line "un #MON"

	para "in particolare,"
	line "mettilo per"

	para "primo e scambialo"
	line "in lotta."

	para "Si fa così!"
	done

PicnickerHopeSeenText:
	text "Credo di poter"
	line "vincere."

	para "Vediamo se ho"
	line "ragione!"
	done

PicnickerHopeBeatenText:
	text "Ooh, sei troppo"
	line "forte."
	done

PicnickerHopeAfterBattleText:
	text "Dicono che alcuni"
	line "#MON abbiano"
	para "dei cuccioli che"
	line "nascono dalle"
	cont "UOVA."

	para "Ma come si fanno"
	line "le UOVA #MON?"
	done

PicnickerSharonSeenText:
	text "Eh…"
	line "Io…"
	para "Vuoi lottare?"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
	text "……Sono venuti qui"
	line "per cercare"
	para "CLEFAIRY, ma non"
	line "ne ho trovati."
	done
	

	
SwimmermRandallSeenText:
	text "Ehi! Sei giovane"
	line "e forte!"

	para "Dovresti nuotare!"
	done

SwimmermRandallBeatenText:
	text "Oh no. Ho perso…"
	done

SwimmermRandallAfterBattleText:
	text "Nuotare rinforza"
	line "tutto il corpo."
	cont "È salutare."
	done

MtMoonSquareSignText:
	text "PERCORSO 118"
	para "ELIOPOLI -"
	line "VESTIGIA"
	done
	
SwimmermBerkeSeenText:
	text "L'acqua è calda"
	line "qui. Mi sento"
	cont "a mio agio."

	para "Ti batterò!"
	done
	
SwimmermBerkeBeatenText:
	text "Ho la pelle"
	line "d'oca!"
	done

SwimmermBerkeAfterBattleText:
	text "Non è rilassante"
	line "galleggiare così?"
	done

Route118_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 11, ROUTE_118_SUNPOINT_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 10, BGEVENT_READ, MtMoonSquareSign
	bg_event 12, 13, BGEVENT_ITEM, Route118HiddenUltraBall

	db 10 ; object events
	object_event 64,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  8, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerHope, -1
	object_event 11,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event  5,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route118HPUp, EVENT_ROUTE_118_HP_UP
	object_event 72,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritTownRouteCooltrainermScript, -1
	object_event 72,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritTownRouteMonsterScript, -1
	object_event 16,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MotobuPathFruitTree, -1
	object_event 55,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermRandall, -1
	object_event 44,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermBerke, -1
	object_event 30,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermHal, -1
