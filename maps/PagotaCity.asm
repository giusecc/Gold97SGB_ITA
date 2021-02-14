	object_const_def ; object_event constants
;	const PAGOTACITY_EARL
	const PAGOTACITY_LASS
	const PAGOTACITY_SUPER_NERD
	const PAGOTACITY_GRAMPS
	const PAGOTACITY_YOUNGSTER
	const PAGOTACITY_FRUIT_TREE
	const PAGOTACITY_POKE_BALL1
	const PAGOTACITY_POKE_BALL2
	const PAGOTACITY_POKE_BALL3

PagotaCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .PagotaTreeCut
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_PAGOTA
	return

.PagotaTreeCut:
	checkevent EVENT_PAGOTA_TREE_CUT
	iffalse .PagotaTreeThere
	changeblock  9, 21, $6D ; notree
	return
	
.PagotaTreeThere
	return

PagotaCityLassScript:
	jumptextfaceplayer PagotaCityLassText

PagotaCitySuperNerdScript:
	jumptextfaceplayer PagotaCitySuperNerdText

PagotaCityGrampsScript:
	jumptextfaceplayer PagotaCityGrampsText

PagotaCityYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_PAGOTA_TREE_CUT
	iffalse .PagotaCityYoungsterScriptTree
	writetext PagotaCityYoungsterTextNoTree
	waitbutton
	closetext
	end
	
.PagotaCityYoungsterScriptTree
	writetext PagotaCityYoungsterTextTree
	waitbutton
	closetext
	end

KurtsHouseSign:
	setevent EVENT_GOT_5F_SAGE_BLESSING
	jumptext KurtsHouseSignText

PagotaCitySign:
	jumptext PagotaCitySignText

PagotaGymSign:
	jumptext PagotaGymSignText

FiveFloorTowerSign:
	jumptext FiveFloorTowerSignText

EarlsPokemonAcademySign:
	jumptext EarlsPokemonAcademySignText

EarlsMuseumSign2:
	jumptext EarlsMuseumSign2Text

PagotaCityPokecenterSign:
	jumpstd PokecenterSignScript

PagotaCityMartSign:
	jumpstd MartSignScript

PagotaCityPPUp:
	itemball PP_UP

PagotaCityRareCandy:
	itemball RARE_CANDY
	
PagotaCityStimulusOrb:
	itemball STIMULUS_ORB
	

PagotaCityFruitTree:
	fruittree FRUITTREE_PAGOTA_CITY

PagotaCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_PAGOTA_CITY_HIDDEN_HYPER_POTION
	
KurtsDoorLockedScript:
	opentext
	writetext KurtsDoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, KurtsDoorLocked_Movement
	end
	
KurtsDoorLocked_Movement:
	step DOWN
	step_end


	
KurtsDoorLockedText:
	text "La porta è chiusa…"
	done

	
PagotaCityLassText:
	text "Si dice che nella"
	line "PENTATORRE"
	para "appaiano degli"
	line "spettri."

	para "Pare che le mosse"
	line "normali non"

	para "abbiano effetto"
	line "sugli spettri."
	done

PagotaCitySuperNerdText:
	text "Sei un allenatore"
	line "di #MON?"

	para "Il CAPOPALESTRA"
	line "sarà la tua prova"

	para "per vedere se sei"
	line "un fuoriclasse."
	done

PagotaCityGrampsText:
	text "VALERIO della"
	line "PALESTRA di"

	para "ANCESTRALIA è un"
	line "buon allenatore!"

	para "I suoi #MON"
	line "di tipo VOLANTE"
	para "si allenano per"
	line "esibirsi anche"
	cont "nelle parate."
	done

PagotaCityYoungsterTextTree:
	text "Qua dietro c'è"
	line "la PENTATORRE!"
	para "È difficile"
	line "raggiungerla a"
	para "causa di questo"
	line "albero."
	done
	
PagotaCityYoungsterTextNoTree:
	text "Fantastico! Senza"
	line "l'albero posso"
	para "andare a giocare"
	line "nella torre!"
	done

PagotaCitySignText:
	text "ANCESTRALIA"

	para "Eterna come il"
	line "cielo stellato."
	done

PagotaGymSignText:
	text "ANCESTRALIA"
	line "CAPOPALESTRA:"
	cont "VALERIO"

	para "L'elegante maestro"
	line "dei #MON"
	cont "volanti."
	done

FiveFloorTowerSignText:
	text "PENTATORRE"

	para "Scopri la Via"
	line "dei #MON"
	done

EarlsPokemonAcademySignText:
	text "GALLERIA D'ARTE"
	line "DI PRIMO"
	done
	
KurtsHouseSignText:
	text "CASA DI FRANZ"
	done
	
EarlsMuseumSign2Text:
	text "CASA DI BILL"
	done
	


PagotaCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event  3, 26, PAGOTA_MART, 1
	warp_event 26, 14, PAGOTA_GYM, 1
	warp_event 27, 14, PAGOTA_GYM, 2
	warp_event 10, 26, PAGOTA_NICKNAME_SPEECH_HOUSE, 1
	warp_event 27, 28, PAGOTA_POKECENTER_1F, 1
	warp_event 22, 26, EARLS_POKEMON_ACADEMY, 1
	warp_event 11, 17, FIVE_FLOOR_TOWER_1F, 1
	warp_event 19, 30, ROUTE_101_PAGOTA_GATE, 2
	warp_event 18, 30, ROUTE_101_PAGOTA_GATE, 1
	warp_event  3, 31, KURTS_HOUSE, 1
	warp_event 29, 22, KURTS_HOUSE, 5
	warp_event 12, 17, FIVE_FLOOR_TOWER_1F, 2
	warp_event  4, 14, EARLS_MUSEUM, 1
	warp_event  5, 14, EARLS_MUSEUM, 2
	warp_event 30, 22, BILLS_FAMILYS_HOUSE, 1

	db 1 ; coord events
	coord_event  3, 32, SCENE_KURTS_HOUSE_LOCKED, KurtsDoorLockedScript


	db 9 ; bg events
	bg_event 20, 29, BGEVENT_READ, PagotaCitySign
	bg_event 28, 16, BGEVENT_READ, PagotaGymSign
	bg_event  8, 16, BGEVENT_READ, FiveFloorTowerSign
	bg_event  8, 14, BGEVENT_READ, EarlsPokemonAcademySign
	bg_event 28, 28, BGEVENT_READ, PagotaCityPokecenterSign
	bg_event  4, 26, BGEVENT_READ, PagotaCityMartSign
	bg_event 24,  4, BGEVENT_ITEM, PagotaCityHiddenHyperPotion
	bg_event  4, 32, BGEVENT_READ, KurtsHouseSign
	bg_event 26, 22, BGEVENT_READ, EarlsMuseumSign2

	db 9 ; object events
	object_event 26, 30, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityLassScript, -1
	object_event 24, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PagotaCitySuperNerdScript, -1
	object_event 15, 25, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaCityGrampsScript, -1
	object_event 10, 21, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityYoungsterScript, -1
	object_event 17, 17, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaCityFruitTree, -1
	object_event 14, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PagotaCityPPUp, EVENT_PAGOTA_CITY_PP_UP
	object_event 23,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PagotaCityRareCandy, EVENT_PAGOTA_CITY_RARE_CANDY
	object_event 16,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PagotaCityStimulusOrb, EVENT_PAGOTA_CITY_STIMULUS_ORB
