	object_const_def ; object_event constants
	const UNIONCAVEB1F_POKE_BALL1
	const UNIONCAVEB1F_BOULDER
	const UNIONCAVEB1F_POKE_BALL2
	const UNIONCAVEB1F_POKEMANIAC
	const UNIONCAVEB1F_HIKER
	const UNIONCAVEB1F_ITEMBALL

BoulderMineB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BoulderMineB1FTMSwift:
	itemball TM_SWIFT

BoulderMineB1FXDefend:
	itemball X_DEFEND



BoulderMineB1FBoulder:
	jumpstd StrengthBoulderScript

TrainerPokemaniacAndrew:
	trainer POKEMANIAC, ANDREW, EVENT_BEAT_POKEMANIAC_ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacAndrewAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerPhillip:
	trainer HIKER, PHILLIP, EVENT_BEAT_HIKER_PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerPhillipAfterBattleText
	waitbutton
	closetext
	end
	
BoulderMineB1FMoonStone:
	itemball MOON_STONE
	
HikerPhillipSeenText:
	text "Scalare le"
	line "montagne è diver-"
	para "tente, ma esplo-"
	line "rare le grotte lo"
	cont "è molto di più."
	done

HikerPhillipBeatenText:
	text "Non perderti!"
	done
	
HikerPhillipAfterBattleText:
	text "I miei #MON"
	line "ROCCIA si sentono"
	cont "a casa qui."
	done
	
PokemaniacAndrewSeenText:
	text "Dicono che un"
	line "#MON raro si"
	para "nasconda in questa"
	line "cava."
	done

PokemaniacAndrewBeatenText:
	text "Mi hai distrutto!"
	done
	
PokemaniacAndrewAfterBattleText:
	text "Hai visto quel"
	line "#MON raro?"
	done

BoulderMineB1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  1,  1, BOULDER_MINE_B2F, 1
	warp_event  7,  3, BOULDER_MINE_B2F, 2
	warp_event 19,  3, BOULDER_MINE_1F, 2
	warp_event 35,  1, BOULDER_MINE_1F, 3
	warp_event 31,  3, BOULDER_MINE_B2F, 3
	warp_event 31, 11, BOULDER_MINE_B2F, 8
	warp_event 37,  9, BOULDER_MINE_1F, 4
	warp_event 37, 15, BOULDER_MINE_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 36,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB1FTMSwift, EVENT_BOULDER_MINE_B1F_TM_SWIFT
	object_event 20,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMineB1FBoulder, -1
	object_event 27, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB1FXDefend, EVENT_BOULDER_MINE_B1F_X_DEFEND
	object_event 33,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPokemaniacAndrew, -1
	object_event  5,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerHikerPhillip, -1
	object_event  0,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB1FMoonStone, EVENT_PICKED_UP_MOON_STONE_FROM_AERODACTYL_ITEM_ROOM

