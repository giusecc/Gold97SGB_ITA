	object_const_def ; object_event constants
	const CROWN_CITY_LASS
	const CROWN_CITY_ROCKER
	const CROWN_CITY_JANINE

CrownCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CROWN
	return

CrownLassCoordScript:
	turnobject PLAYER, RIGHT
	turnobject CROWN_CITY_LASS, LEFT
	opentext
	writetext GoTrainerText
	waitbutton
	closetext
	setscene SCENE_CROWNCITY_NOTHING
	end

CrownCityLassScript:
	faceplayer
	opentext
	writetext GoTrainerText
	waitbutton
	closetext
	setscene SCENE_CROWNCITY_NOTHING
	end
	
CrownCityPokecenterSign:
	jumpstd PokecenterSignScript
	
CrownCityMartSign:
	jumpstd MartSignScript
	
CrownCitySign:
	jumptext CrownCitySignText
	
CrownCitySign2:
	jumptext CrownCitySign2Text
	
CrownCityRockerScript:
	jumptextfaceplayer CrownCityRockerText
	
CrownCityJanineScript:
	jumptextfaceplayer CrownCityJanineText
	
CrownCityJanineText:
	text "Il mio fratellone"
	line "ha sfidato la LEGA"
	cont "in passato."
	para "Non è riuscito"
	line "a vincere."
	done
	
CrownCityRockerText:
	text "Con l'imponenza"
	line "del MONTE FUJI,"
	para "questa cittadina"
	line "alle sue pendici"
	cont "è stupenda."
	done
	
CrownCitySign2Text:
	text "DIADEMOPOLI"
	line "CASA ALLENATORE"
	done
	
CrownCitySignText:
	text "DIADEMOPOLI"
	para "Campo base per"
	line "arrivare alla LEGA"
	done
	
GoTrainerText:
	text "Allenatore!"
	para "Se sei qui è"
	line "perché vuoi"
	para "provare a scalare"
	line "il MONTE FUJI!"
	para "Porta i tui #-"
	line "MON migliori e"
	para "raccogli le tue"
	line "forze!"
	para "Risali la cascata"
	line "e inizia la tua"
	cont "scalata!"
	para "La LEGA è lassù!"
	done

CrownCity_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 10, 25, CROWN_PATH, 3
	warp_event 11, 25, CROWN_PATH, 3
	warp_event  5, 22, CROWN_POKECENTER_1F, 1
	warp_event 11, 22, CROWN_MART, 1
	warp_event  9,  1, VICTORY_ROAD, 1
	warp_event  3, 17, CROWN_HOUSE_1, 1
	warp_event 15, 19, CROWN_HOUSE_2, 1
	warp_event 14, 15, CROWN_CITY_TRAINER_HOUSE, 1
	warp_event 15, 15, CROWN_CITY_TRAINER_HOUSE, 2

	db 1 ; coord events
	coord_event  8, 16, SCENE_CROWNCITY_MEET_RIVAL, CrownLassCoordScript

	db 4 ; bg events
	bg_event  6, 22, BGEVENT_READ, CrownCityPokecenterSign
	bg_event 12, 22, BGEVENT_READ, CrownCityMartSign
	bg_event 10, 16, BGEVENT_READ, CrownCitySign
	bg_event 16, 16, BGEVENT_READ, CrownCitySign2

	db 3 ; object events
	object_event  9, 16, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityLassScript, -1
	object_event 12, 19, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityRockerScript, -1
	object_event  4, 19, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityJanineScript, -1
