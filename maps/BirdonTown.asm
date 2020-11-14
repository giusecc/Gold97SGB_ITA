	object_const_def ; object_event constants
	const BIRDONTOWN_GRAMPS
	const BIRDONTOWN_TEACHER
	const BIRDONTOWN_YOUNGSTER

BirdonTown_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_BIRDONTOWN_NOTHING
	scene_script .DummyScene1 ; SCENE_BIRDONTOWN_RIVAL_BATTLE
	scene_script .DummyScene2 ; SCENE_BIRDONTOWN_KURT_RETURNS_GS_BALL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Flypoint:
	setflag ENGINE_FLYPOINT_BIRDON
	return

BirdonTownGrampsScript:
	jumptextfaceplayer BirdonTownGrampsTextBefore

BirdonTownTeacherScript:
	jumptextfaceplayer BirdonTownTeacherText

BirdonTownYoungsterScript:
	jumptextfaceplayer BirdonTownYoungsterText


BirdonTownSign:
	jumptext BirdonTownSignText


WestportGymSign:
	jumptext WestportGymSignText

SlowpokeWellSign:
	;setflag ENGINE_EEVEE_SWARM
	;swarm SWARM_EEVEE, ROUTE_106
	;giveitem HM_ROCK_SMASH
	;clearflag ENGINE_ZEPHYRBADGE
	;jumpstd radiotowerrockets
	;setevent EVENT_ROUTE_105_BATTLE
	;opentext
	;verbosegiveitem HELIX_FOSSIL
	;verbosegiveitem DOME_FOSSIL
	;setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	;clearevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_1
	;clearevent EVENT_WESTPORT_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	;setevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_1
	;setevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_2
	;setevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_3; makes lass disappear in kume house
	;setevent EVENT_WESTPORT_UNDERGROUND_WAREHOUSE_BLOCKED_OFF;
	;giveitem HM_SURF
	;givepoke BALLERINE, 5
	;givepoke ABRA, 5
	jumptext SlowpokeWellSignText


BirdonTownJadetForestSign:
	jumptext BirdonTownJadeForestSignText

BirdonTownPokecenterSign:
;	setevent EVENT_CLEARED_RADIO_TOWER
;	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
;	setevent EVENT_WESTPORT_CITY_ROCKET_TAKEOVER
;	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
;	clearevent EVENT_WESTPORT_CITY_CIVILIANS
;	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
;	setevent EVENT_TEAM_ROCKET_DISBANDED
;	clearevent EVENT_STAND_CITY_ZOO_MONS
;	setevent EVENT_RED_IN_KANTO_GYM
;	clearevent EVENT_TELEPORT_GUY
	jumpstd PokecenterSignScript

BirdonTownMartSign:
	jumpstd MartSignScript

WhiteApricornTree:
	fruittree FRUITTREE_BIRDON_TOWN

BirdonTownHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_BIRDON_TOWN_HIDDEN_FULL_HEAL


BirdonTownGrampsTextBefore:
	text "ANGELO, il"
	line "CAPOPALESTRA, è un"
	cont "uomo misterioso."
	para "Non si sa molto"
	line "su di lui."
	para "Tuttavia, si sa"
	line "che è appassionato"
	para "di miti e leggende"
	line "di NIHON."
	para "È anche un ottimo"
	line "allenatore,"
	cont "oltretutto."
	done

BirdonTownTeacherText:
	text "Qui piove molto"
	line "poco."
	para "Il POZZO SLOWPOKE"
	line "è fondamentale"
	para "per la nostra"
	line "città."
	done

BirdonTownYoungsterText:
	text "A est di qui, dopo"
	line "un lungo percorso"
	para "si trova il BOSCO"
	line "GIADA."

	para "Dopo il BOSCO c'è"
	line "DESMOPOLI."
	
	para "È un viaggio molto"
	line "lungo."
	
	para "Riposati bene"
	line "se hai intenzione"
	cont "di partire."
	done

BirdonTownSlowpokeText1:
	text "SLOWPOKE: …"

	para "<……> <……> <……>"
	done

BirdonTownSlowpokeText2:
	text "<……> <……>"
	line "Ooouuh?"
	done


BirdonTownSignText:
	text "AVIOPOLI"
	para "Città arida, ma"
	line "ricca di amore."
	done


WestportGymSignText:
	text "AVIOPOLI"
	line "CAPOPALESTRA:"
	cont "ANGELO"

	para "Il magico veggente"
	done

SlowpokeWellSignText:
	text "POZZO SLOWPOKE"

	para "Un'oasi per gli"
	line "SLOWPOKE in"
	para "un ambiente"
	line "arido."
	done


BirdonTownJadeForestSignText:
	text "BOSCO GIADA"

	para "Per di qua."
	done

BirdonTown_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 15,  4, BIRDON_POKECENTER_1F, 1
	warp_event  3, 13, BIRDON_MILK_BAR, 1
	warp_event  3,  4, BIRDON_MART, 1
	warp_event  4,  9, BIRDON_ELDER_HOUSE, 1
	warp_event 14, 15, BIRDON_GYM, 1
	warp_event  9,  9, SLOWPOKE_WELL_B1F, 1
;	warp_event  9,  9, STAND_CITY_ROCKET_HOUSE, 1
	warp_event  8,  5, ROUTE_116_BIRDON_GATE, 3
	warp_event  9,  5, ROUTE_116_BIRDON_GATE, 4
	warp_event 15, 15, BIRDON_GYM, 2
	warp_event  9, 13, CROWN_EVOLUTION_SPEECH_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6, 14, BGEVENT_READ, BirdonTownSign
	bg_event 13, 14, BGEVENT_READ, WestportGymSign
	bg_event 11, 10, BGEVENT_READ, SlowpokeWellSign
	bg_event 16,  4, BGEVENT_READ, BirdonTownPokecenterSign
	bg_event  4,  4, BGEVENT_READ, BirdonTownMartSign
	bg_event  0,  0, BGEVENT_READ, BirdonTownJadetForestSign
	bg_event  2,  7, BGEVENT_ITEM, BirdonTownHiddenFullHeal

	db 4 ; object events
	object_event 14, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonTownGrampsScript, -1
	object_event 10,  7, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, 1, 1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BirdonTownTeacherScript, -1
	object_event  3, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BirdonTownYoungsterScript, -1
	object_event 14,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhiteApricornTree, -1
