	object_const_def ; object_event constants
	const FROSTPOINT_TOWN_TWIN
	const FROSTPOINT_TOWN_ROCKER
	const FROSTPOINT_TOWN_TEACHER

FrostpointTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_FROSTPOINT
	return


FrostpointTownDeepwaterSign:
	jumptext FrostpointTownDeepwaterSignText

FrostpointTownSign:
	jumptext FrostpointTownSignText

FrostpointTownPokecenterSign:
	jumpstd PokecenterSignScript
	
FrostpointTownMartSign:
	jumpstd MartSignScript

FrostpointTownHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_FROSTPOINT_TOWN_HIDDEN_RARE_CANDY

FrostpointTownBlueTeleport:
	teleport_from
	step_end
	
FrostpointTownTwinScript:
	jumptextfaceplayer FrostpointTownTwinText

FrostpointTownRockerScript:
	jumptextfaceplayer FrostpointTownRockerText

FrostpointTownTeacherScript:
	jumptextfaceplayer FrostpointTownTeacherText
	
FrostpointTownTwinText:
	text "Adoro la neve!"
	para "Mi piace anche"
	line "nuotare, ma fa"
	para "troppo freddo"
	line "per stare troppo"
	cont "in acqua."
	done
	
FrostpointTownRockerText:
	text "L'aria è così"
	line "fresca e pulita"
	cont "qui."
	para "Non potrei mai"
	line "vivere in una"
	cont "città inquinata."
	done
	
FrostpointTownTeacherText:
	text "Hai attraversato"
	line "il PASSAGGIO"
	cont "SOMMERSO?"
	para "È difficile"
	line "arrivare qui via"
	para "mare a causa dei"
	line "mulinelli lungo"
	cont "la strada."
	para "La moglie di"
	line "ALFREDO conosce"
	para "uan tecnica che"
	line "permette ai #-"
	para "MON di attraver-"
	line "sare i mulinelli."
	done

FrostpointTownDeepwaterSignText:
	text "PASSAGGIO SOMMERSO"
	line "Entrata nord"
	done

FrostpointTownSignText:
	text "ALGIDOPOLI"

	para "Gelida landa di"
	line "gente ardita"
	done

FrostpointTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 12, FROSTPOINT_POKECENTER_1F, 1
	warp_event 11,  5, DEEPWATER_PASSAGE_ENTRANCE, 8
	warp_event 15,  8, FROSTPOINT_MART, 1
	warp_event  5,  7, FROSTPOINT_PRYCE_HOUSE, 1
	warp_event  5, 11, FROSTPOINT_OTHER_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 14, 12, BGEVENT_READ, FrostpointTownPokecenterSign
	bg_event 16,  8, BGEVENT_READ, FrostpointTownMartSign
	bg_event 12,  6, BGEVENT_READ, FrostpointTownDeepwaterSign
	bg_event  8, 14, BGEVENT_READ, FrostpointTownSign
	bg_event  8,  6, BGEVENT_ITEM, FrostpointTownHiddenRareCandy

	db 3 ; object events
	object_event  8, 11, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointTownTwinScript, -1
	object_event 13,  7, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointTownRockerScript, -1
	object_event  6,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointTownTeacherScript, -1
