	object_const_def ; object_event constants
	const DOCK_ROCKET_1
	const DOCK_ROCKET_2
	const DOCK_ROCKET_3
	const DOCK_ROCKET_4
	const DOCK_ROCKET_5
	const DOCK_ROCKET_6
	const DOCK_ROCKET_7
	const DOCK_GURU_1
	const DOCK_SAILOR
	const DOCK_FISHER
	const DOCK_GURU_2

SunpointDocks_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearPortBoat

.ClearPortBoat:
	checkevent EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	iffalse .Done
	changeblock 11, 7, $0A ; water
	changeblock 13, 7, $0A ; water
	changeblock 15, 7, $0A ; water
	changeblock 17, 7, $0A ; water
	changeblock 11, 9, $0A ; water
	changeblock 13, 9, $0A ; water
	changeblock 15, 9, $0A ; water
	changeblock 17, 9, $0A ; water
	changeblock 13, 5, $08 ; dock
.Done:
	return


TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	turnobject DOCK_ROCKET_7, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear DOCK_ROCKET_7
	pause 15
	setevent EVENT_ROCKET_OUTSIDE_OF_SHIP
	end

DocksRocket1Script:
	jumptextfaceplayer DocksRocket1Text
	
DocksRocket2Script:
	jumptextfaceplayer DocksRocket2Text
	
DocksRocket3Script:
	jumptextfaceplayer DocksRocket3Text
	
DocksRocket4Script:
	jumptextfaceplayer DocksRocket4Text
	
DocksRocket5Script:
	jumptextfaceplayer DocksRocket5Text
	
DocksRocket6Script:
	jumptextfaceplayer DocksRocket6Text
	
DocksGuruScript:
	jumptextfaceplayer DocksGuruText
	
DocksGuru2Script:
	jumptextfaceplayer DocksGuruText2
	
DocksFisherScript:
	jumptextfaceplayer DocksFisherText
	
DocksSailorScript:
	jumptextfaceplayer DocksSailorText
	
DocksRocket1Text:
	text "Solo un innocente"
	line "lavoratore che"
	para "porta delle"
	line "merci!"
	para "Niente di"
	line "strano qui!"
	done
	
DocksRocket2Text:
	text "Il CAPITANO sta"
	line "lavorando sulla"
	para "logistica dell'"
	line "ultima spedizione"
	cont "a i MOLI."
	para "Siamo pronti per"
	line "abbandonare"
	cont "questo posto!"
	done
	
DocksRocket3Text:
	text "Abbiamo quasi"
	line "finito qui!"
	para "Non vedo l'ora"
	line "di tornare più"
	para "a est, dove fa"
	line "più freddo!"
	done
	
DocksRocket4Text:
	text "Non disturbarmi!"
	line "Sto lavoranto!"
	done
	
DocksRocket5Text:
	text "Andiam, andiam…"
	para "…"
	para "Hm, canzone"
	line "sbagliata."
	done
	
DocksRocket6Text:
	text "Lavorare al"
	line "porto è dura!"
	done

GruntM29SeenText:
	text "Cosa vuoi,"
	line "ragazzino?"
	para "Solo personale"
	line "autorizzato qui!"
	para "Vattene o affronta"
	line "la mia ira!"
	done
	
GruntM29BeatenText:
	text "Eeehi!"
	done
	
GruntM29AfterBattleText:
	text "Potresti essere"
	line "un problema."
	para "E io non voglio"
	line "problemi!"
	done

DocksGuruText:
	text "Non ci sono navi"
	line "nel porto oggi."
	para "Giornata calma."
	done
	
DocksGuruText2:
	text "C'è un locale"
	line "a DESMOPOLI che"
	para "serve dell'ottimo"
	line "cibo!"
	para "Vorrei non"
	line "lavorare così"
	cont "lontano…"
	done

DocksFisherText:
	text "Non lavoro qui."
	line "Vengo solo a"
	para "guardare le"
	line "navi."
	done
	
DocksSailorText:
	text "Partirò presto."
	para "Non vado in mare"
	line "da un sacco di"
	cont "tempo!"
	done

SunpointDocks_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  1, 27, SUNPOINT_DOCKS_CROWN_PATH_ENTRANCE, 1
	warp_event  6, 31, SUNPOINT_DOCKS_GATE, 1
	warp_event  7, 31, SUNPOINT_DOCKS_GATE, 2
	warp_event 13,  5, TEAM_ROCKET_SHIP_BASE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 11 ; object events
	object_event  8,  2, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksRocket1Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event  5, 15, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksRocket2Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 14, 13, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksRocket3Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event  4,  8, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksRocket4Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event  5, 24, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksRocket5Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 12, 19, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksRocket6Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerGruntM29, EVENT_ROCKET_OUTSIDE_OF_SHIP
	object_event  5, 22, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksGuruScript, EVENT_FLORIA_AT_FLOWER_SHOP
	object_event 14, 19, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksSailorScript, EVENT_FLORIA_AT_FLOWER_SHOP
	object_event  8, 13, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksFisherScript, EVENT_FLORIA_AT_FLOWER_SHOP
	object_event  7,  5, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksGuru2Script, EVENT_FLORIA_AT_FLOWER_SHOP

