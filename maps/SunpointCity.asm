	object_const_def ; object_event constants
	const SUNPOINTCITY_STANDING_YOUNGSTER
	const SUNPOINTCITY_POKEFAN_M
	const SUNPOINTCITY_LASS
	const SUNPOINTCITY_ROCK1
	const SUNPOINTCITY_ROCK3
	const SUNPOINTCITY_POKEFAN_F


SunpointCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SUNPOINTCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_SUNPOINTCITY_SUICUNE_AND_EUSINE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint


.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_SUNPOINT
	setevent EVENT_FROSTPOINT_ROCKS_CLEARED
	return


SunpointCityChucksWife:
	jumptextfaceplayer ChucksWifeFlySpeechText

SunpointCityYoungster:
	jumptextfaceplayer SunpointCityYoungsterText

SunpointCityPokefanM:
	jumptextfaceplayer SunpointCityPokefanMText

SunpointCityLass:
	jumptextfaceplayer SunpointCityLassText

SunpointCityUnusedScript:
; unreferenced
	jumptextfaceplayer SunpointCityUnusedText

SunpointCitySign:
	jumptext SunpointCitySignText

StandGymSign:
	jumptext StandGymSignText

CrownHouse2Sign:
	jumpstd MartSignScript

SunpointPhotoStudioSign:
	jumptext SunpointPhotoStudioSignText

SunpointPokeSeerSign:
	jumptext SunpointPokeSeerSignText

SunpointPokecenterSign:
	;giveitem HM_ROCK_SMASH
	;setflag ENGINE_STORMBADGE
	jumpstd PokecenterSignScript

SunpointCityRock:
	jumpstd SmashRockScript

SunpointCityHiddenRevive:
	hiddenitem REVIVE, EVENT_SUNPOINT_CITY_HIDDEN_REVIVE

SunpointCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_SUNPOINT_CITY_HIDDEN_MAX_ETHER



ChucksWifeFlySpeechText:
	text "Il clima in questa"
	line "parte di NIHON"
	para "è molto più"
	line "caldo che altrove."
	done

ChucksWifeChubbyText:
	text "Hai battuto mio"
	line "marito: ora dovrà"
	cont "impegnarsi!"

	para "Meglio così: stava"
	line "diventando un po'"
	cont "pigro!"
	done

SunpointCityYoungsterText:
	text "Sei mai stato"
	line "a BIANCASELVA?"
	para "È fredda e"
	line "innevata."
	para "Non potrei"
	line "viverci!"
	para "Il freddo non fa"
	line "per me."
	done

SunpointCityPokefanMText:
	text "Si dice che ci"
	line "siano #MON rari"
	cont "nel POZZO LAVA."
	para "È difficile"
	line "entrare a causa"
	para "delle rocce che"
	line "spesso bloccano"
	cont "l'entrata."
	done

SunpointCityLassText:
	text "Non c'è una"
	line "PALESTRA qui."
	cont "Non ci serve."
	done

SunpointCityUnusedText:
; unused
	text "Ci sono molte"
	line "isole tra qui e"
	cont "DESMOPOLI."

	para "Si dice che una"
	line "creatura mito-"
	cont "logica viva lì."
	done


SunpointCitySignText:
	text "ELIOPOLI"
	para "Centro di scambi"
	line "internazionali"
	cont "di NIHON."
	done

StandGymSignText:
	text "ELIOPOLI"
	line "CAPOPALESTRA:"

	para "FURIO"

	para "I pugni roboanti"
	line "parlano per lui"
	done

CrownHouse2SignText:
	text "FARMACIA di"
	line "ELIOPOLI"

	para "Una tradizione di"
	line "cinque secoli"

	para "Risolviamo ogni"
	line "esigenza medica"
	done

SunpointPhotoStudioSignText:
	text "CONSIGLI UTILI"
	para "Alcune mosse MN"
	line "richiedono una"
	para "MEDAGLIA per"
	line "essere usate"
	para "fuori dalla"
	line "lotta."
	para "Tuttavia si"
	line "possono usare"
	cont "in battaglia."
	done

SunpointPokeSeerSignText:
	text "ATTENZIONE:"
	para "Caduta massi"
	line "dal POZZO LAVA."
	para "Avvicinarsi con"
	line "cautela."
	done

SunpointCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 20, 26, MANIAS_HOUSE, 1
	warp_event 16, 11, MAGMA_SHAFT_1F, 1
	warp_event 31, 16, SUNPOINT_POKECENTER_1F, 1
	warp_event 17, 22, SUNPOINT_MART, 1
	warp_event 33, 23, SUNPOINT_PHOTO_STUDIO, 1
	warp_event 33, 11, ROUTE_118_SUNPOINT_GATE, 1
	warp_event 22, 10, SKATEBOARDER_HOUSE, 1
	warp_event 26,  5, SUNPOINT_DOCKS_GATE, 3
	warp_event 27,  5, SUNPOINT_DOCKS_GATE, 4
	warp_event 28, 30, ROUTE_119_SUNPOINT_GATE, 1
	warp_event 29, 30, ROUTE_119_SUNPOINT_GATE, 2

	db 0 ; coord events

	db 8 ; bg events
	bg_event 26, 21, BGEVENT_READ, SunpointCitySign
	bg_event 15, 10, BGEVENT_READ, StandGymSign
	bg_event 32, 16, BGEVENT_READ, SunpointPokecenterSign
	bg_event 18, 22, BGEVENT_READ, CrownHouse2Sign
	bg_event 14, 22, BGEVENT_READ, SunpointPhotoStudioSign
	bg_event 28, 16, BGEVENT_READ, SunpointPokeSeerSign
	bg_event 34, 24, BGEVENT_ITEM, SunpointCityHiddenRevive
	bg_event 13, 21, BGEVENT_ITEM, SunpointCityHiddenMaxEther

	db 6 ; object events
	object_event 28, 13, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointCityYoungster, -1
	object_event 23, 22, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityPokefanM, -1
	object_event 24, 17, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityLass, -1
	object_event 19, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 18, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 22, 22, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityChucksWife, -1
