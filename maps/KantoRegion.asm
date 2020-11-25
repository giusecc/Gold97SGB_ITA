	object_const_def ; object_event constants
	const KANTO_FISHER
	const KANTO_COOLTRAINER_M
	const KANTO_TEACHER
	const KANTO_POKEFAN_M
	const KANTO_LASS
	const KANTO_SUPER_NERD
	const KANTO_YOUNGSTER
	const KANTO_FISHER_2
	const KANTO_LASS_2
	const KANTO_ITEMBALL
	const KANTO_FISHER_3
	
KantoRegion_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KANTO
	return
	
KantoRegionTMDetect:
	itemball TM_DETECT

KantoFisherScript:
	jumptextfaceplayer KantoFisherText

KantoFisher3Script:
	jumptextfaceplayer KantoFisher3Text

KantoSign:
	jumptext KantoSignText
	
KantoPokecenterSign:
	jumpstd PokecenterSignScript
	
KantoGymSign:
	jumptext KantoGymSignText
	
KobanIslandSign2:
	jumptext KobanIslandSignText2
	
RedsHouseSign2:
	jumptext RedsHouseSignText2
	
BluesHouseSign2:
	jumptext BluesHouseSignText2
	
OaksLabSign2:
	jumptext OaksLabSign2Text
	
KantoMartSign:
	jumpstd MartSignScript
	
KantoDeptSign:
	jumptext KantoDeptSignText
	
KantoMansionSign:
	jumptext KantoMansionSignText
	
KantoBattleClubSign:
	jumptext KantoBattleClubSignText
	
PokemonTowerSign:
	jumptext PokemonTowerSignText
	
KantoCooltrainerMScript:
	jumptextfaceplayer KantoCooltrainerMText
	
KantoTeacherScript:
	jumptextfaceplayer KantoTeacherText
	
KantoPokefanMScript:
	jumptextfaceplayer KantoPokefanMText

KantoLassScript:
	jumptextfaceplayer KantoLassText
	
KantoSuperNerdScript:
	jumptextfaceplayer KantoSuperNerdText
	
KantoYoungsterScript:
	jumptextfaceplayer KantoYoungsterText
	
KantoFisher2Script:
	jumptextfaceplayer KantoFisher2Text
	
KantoLass2Script:
	jumptextfaceplayer KantoLass2Text

KantoFisher3Text:
	text "Tornare in luoghi"
	line "familiari non"
	para "ti da una"
	line "strana"
	cont "sensazione?"
	done
	
KantoLass2Text:
	text "Gli SCIENZIATI del"
	line "laboratorio sono"
	cont "incredibili!"
	para "Hanno riportato"
	line "in vita un"
	cont "fossile!"
	done
	
KantoFisher2Text:
	text "Oh, sì. Amo"
	line "pescare!"
	para "E questo è un"
	line "posto perfetto"
	cont "per farlo!"
	done
	
KantoYoungsterText:
	text "Un giorno voglio"
	line "essere forte come"
	cont "ROSSO."
	para "Non so se ce la"
	line "farò."
	para "Pochissimi sono"
	line "al suo livello."
	done
	
KantoSuperNerdText:
	text "Il gestore del"
	line "CASINÒ ne ha"
	para "fatto costruire"
	line "uno nuovo sul"
	cont "PONTILE."
	done
	
KantoLassText:
	text "Conosci la"
	line "SILPH SPA?"
	para "Dovresti!"
	line "È probabile che"
	para "abbiano fatto le"
	line "#BALL che hai"
	cont "con te!"
	done
	
KantoPokefanMText:
	text "Non sono mai stato"
	line "un allenatore"
	cont "serio."
	para "Alleno i miei"
	line "#MON e lotto,"
	para "ma per me è un"
	line "passatempo."
	para "Il tipo del CLUB"
	line "LOTTA KANTO non"
	para "mi lascerebbe"
	line "entrare…"
	done
	
KantoFisherText:
	text "La tecnologia è"
	line "incredibile!"
	para "Ora puoi scambiare"
	line "#MON con il"
	cont "passato!"
	done
	
KantoSignText:
	text "KANTO"
	line "Gioiello di NIHON"
	done
	
KantoGymSignText:
	text "KANTO"
	line "CAPOPALESTRA:"
	cont "ROSSO"

	para "Maestro di"
	line "#MON"
	done
	
KobanIslandSignText2:
	text "BIANCAVILLA"

	para "Un ridente angolo"
	line "di pace e purezza."
	done
	
RedsHouseSignText2:
	text "Casa di ROSSO"
	done
	
BluesHouseSignText2:
	text "Casa di BLU"
	done

OaksLabSign2Text:
	text "LAB. RICERCA"
	para "#MON DI OAK"
	line "NOTA: al momento"
	para "il PROF.OAK. è"
	line "a BORGO SILENTE."
	done
	
KantoDeptSignText:
	text "Una completa sele-"
	line "zione di articoli"
	cont "sui #MON!"
	
	para "CENTRO COMMERCIALE"
	line "di KANTO"
	done
	
KantoMansionSignText:
	text "VILLA KANTO"
	done
	
KantoBattleClubSignText:
	text "CLUB LOTTA KANTO"
	para "Un club per"
	line "allenatori di"
	cont "livello."
	done
	
PokemonTowerSignText:
	text "TORRE #MON"
	para "In ricordo dei"
	line "#MON defunti."
	done

KantoCooltrainerMText:
	text "Al ristorante"
	line "fanno una gara"
	cont "di cibo."
	para "Solo guardandoli"
	line "mi passa"
	cont "l'appetito…"
	done
	
KantoTeacherText:
	text "Il CENTRO"
	line "COMMERCIALE ha una"
	cont "vasta scelta."
	para "Se non lo trovi"
	line "lì, non lo trove-"
	para "rai da nessuna"
	line "parte!"
	para "…ooh, sembro"
	line "un commesso."
	done

KantoRegion_MapEvents:
	db 0, 0 ; filler

	db 32 ; warp events
	warp_event 14, 17, KANTO_DEPT_STORE_1F, 1
	warp_event 22, 19, KANTO_MANSION_1F, 1
	warp_event 22, 13, KANTO_MANSION_1F, 3
	warp_event 23, 13, KANTO_MANSION_1F, 3
	warp_event 49, 30, KANTO_POKECENTER_1F, 1
	warp_event 28, 25, KANTO_GAME_CORNER, 1
	warp_event 33, 25, KANTO_GAME_CORNER_PRIZE_ROOM, 1
	warp_event  4,  5, KANTO_GYM, 1
	warp_event 40, 23, KANTO_CAFE, 1
	warp_event  6, 27, ROUTE_115_KANTO_GATE, 4
	warp_event 30, 19, SILPH_CO_1F, 1
	warp_event 31, 19, SILPH_CO_1F, 2
	warp_event 15, 17, KANTO_DEPT_STORE_1F, 2
	warp_event 23, 19, KANTO_MANSION_1F, 2
	warp_event  5,  5, KANTO_GYM, 2
	warp_event 38, 29, WESTPORT_MAGNET_TRAIN_STATION, 1
	warp_event 12, 43, OAKS_LAB, 1
	warp_event 13, 43, OAKS_LAB, 2
	warp_event 13, 38, BLUES_HOUSE, 1
	warp_event  5, 38, REDS_HOUSE_1F,1
	warp_event 13,  4, KANTO_2_POKECENTER_1F,1
	warp_event  5, 18, KANTO_MART,1
	warp_event 46,  3, KANTO_BATTLE_CLUB_1F, 1
	warp_event 16, 23, KANTO_HOUSE_1, 1
	warp_event 51, 11, KANTO_HOUSE_2, 1
	warp_event 39, 38, KANTO_HOUSE_3, 1
	warp_event 45, 44, KANTO_HOUSE_4, 1
	warp_event 52, 45, KANTO_LABORATORY, 1
	warp_event 53, 45, KANTO_LABORATORY, 2
	warp_event 52, 23, KANTO_RESTAURANT, 1
	warp_event 53, 23, KANTO_RESTAURANT, 2
	warp_event 29, 25, KANTO_GAME_CORNER, 2


	db 0 ; coord events

	db 13 ; bg events
	bg_event 46, 18, BGEVENT_READ, KantoSign
	bg_event 14,  4, BGEVENT_READ, KantoPokecenterSign
	bg_event 50, 30, BGEVENT_READ, KantoPokecenterSign
	bg_event  8,  8, BGEVENT_READ, KantoGymSign
	bg_event  6, 41, BGEVENT_READ, KobanIslandSign2
	bg_event  8, 38, BGEVENT_READ, RedsHouseSign2
	bg_event 16, 38, BGEVENT_READ, BluesHouseSign2
	bg_event 12, 45, BGEVENT_READ, OaksLabSign2
	bg_event  6, 18, BGEVENT_READ, KantoMartSign
	bg_event 18, 18, BGEVENT_READ, KantoDeptSign
	bg_event 26, 19, BGEVENT_READ, KantoMansionSign
	bg_event 42,  4, BGEVENT_READ, KantoBattleClubSign
	bg_event 54,  8, BGEVENT_READ, PokemonTowerSign

	db 11 ; object events
	object_event 14, 46, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFisherScript, -1
	object_event 50, 26, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCooltrainerMScript, -1
	object_event 11, 19, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoTeacherScript, -1
	object_event 38,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoPokefanMScript, -1
	object_event 34, 21, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLassScript, -1
	object_event 31, 28, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoSuperNerdScript, -1
	object_event  5,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoYoungsterScript, -1
	object_event 40, 43, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFisher2Script, -1
	object_event 51, 48, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLass2Script, -1
	object_event 21, 44, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoRegionTMDetect, EVENT_KIKAI_VILLAGE_TM_DETECT
	object_event  3, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFisher3Script, -1
