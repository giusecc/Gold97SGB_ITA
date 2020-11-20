	object_const_def ; object_event constants
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER

LavenderTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAVENDER
	return

LavenderTownPokefanMScript:
	jumptextfaceplayer LavenderTownPokefanMText

LavenderTownTeacherScript:
	jumptextfaceplayer LavenderTownTeacherText

LavenderTownGrampsScript:
	jumptextfaceplayer LavenderTownGrampsText

LavenderTownYoungsterScript:
	jumptextfaceplayer LavenderTownYoungsterText

LavenderTownSign:
	jumptext LavenderTownSignText

SWIslandsRadioStationSign:
	jumptext SWIslandsRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

KobanPokecenterSignText:
	jumpstd PokecenterSignScript

FrostpointMartSignText:
	jumpstd MartSignScript

LavenderTownPokefanMText:
	text "Bell'edificio,"
	line "vero?"

	para "È la TORRE di"
	line "RADIO SUDOVEST."
	done

LavenderTownTeacherText:
	text "Ci sono un sacco"
	line "di programmi"
	cont "sulla RADIO."
	done

LavenderTownGrampsText:
	text "Gli allenatori"
	line "vengono da ogni"

	para "dove per onorare"
	line "le anime dei #-"
	cont "MON scomparsi."
	done

LavenderTownYoungsterText:
	text "Ti serve il #"
	line "FLAUTO per sve-"
	cont "gliare i #MON."

	para "Tutti gli alle-"
	line "natori lo sanno!"
	done

LavenderTownSignText:
	text "LAVANDONIA"

	para "Nobile città"
	line "viola."
	done

SWIslandsRadioStationSignText:
	text "SWISLANDS RADIO"
	line "STATION"

	para "Your Favorite"
	line "Programs On-Air"
	cont "Around the Clock!"
	done

VolunteerPokemonHouseSignText:
	text "LAVENDER VOLUNTEER"
	line "#MON HOUSE"
	done

SoulHouseSignText:
	text "SOUL HOUSE"

	para "May the Souls of"
	line "#MON Rest Easy"
	done

LavenderTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  5,  5, KOBAN_POKECENTER_1F, 1
	warp_event  5,  9, MR_FUJIS_HOUSE, 1
	warp_event  3, 13, FROSTPOINT_PRYCE_HOUSE, 1
	warp_event  7, 13, FROSTPOINT_OTHER_HOUSE, 1
	warp_event  1,  5, FROSTPOINT_MART, 2
	warp_event 13, 11, SOUL_HOUSE, 1
	warp_event 14,  5, SANSKRIT_ROCKET_HOUSE, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 11,  3, BGEVENT_READ, LavenderTownSign
	bg_event 15,  7, BGEVENT_READ, SWIslandsRadioStationSign
	bg_event  3,  9, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event 15, 13, BGEVENT_READ, SoulHouseSign
	bg_event  6,  5, BGEVENT_READ, KobanPokecenterSignText
	bg_event  2,  5, BGEVENT_READ, FrostpointMartSignText

	db 4 ; object events
	object_event 12,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownPokefanMScript, -1
	object_event  2, 15, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	object_event 14, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownGrampsScript, -1
	object_event  6, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, LavenderTownYoungsterScript, -1
