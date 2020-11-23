	object_const_def ; object_event constants
	const STANDPOKECENTER1F_NURSE
	const STANDPOKECENTER1F_COOLTRAINER_M
	const STANDPOKECENTER1F_COOLTRAINER_F
	const STANDPOKECENTER1F_JANINE_IMPERSONATOR

StandPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

StandPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

StandPokecenter1FCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .StandPokecenter1FCooltrainerMRocketsGone
	writetext StandPokecenter1FCooltrainerMText
	waitbutton
	closetext
	end
	
.StandPokecenter1FCooltrainerMRocketsGone
	writetext StandPokecenter1FCooltrainerMText2
	waitbutton
	closetext
	end

StandPokecenter1FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .StandPokecenter1FCooltrainerFRocketsGone
	writetext StandPokecenter1FCooltrainerFText
	waitbutton
	closetext
	end
	
.StandPokecenter1FCooltrainerFRocketsGone
	writetext StandPokecenter1FCooltrainerFText2
	waitbutton
	closetext
	end

StandPokecenter1FJanineImpersonatorScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .StandPokecenter1FJanineImpersonatorRocketsGone
	writetext StandPokecenter1FJanineImpersonatorText1
	waitbutton
	closetext
	end
	
.StandPokecenter1FJanineImpersonatorRocketsGone
	writetext StandPokecenter1FJanineImpersonatorText2
	waitbutton
	closetext
	end

StandPokecenter1FCooltrainerMText:
	text "Ho paura che i"
	line "miei #MON siano"
	cont "ammalati."
	done
	
StandPokecenter1FCooltrainerMText2:
	text "Il personale dello"
	line "ZOO lavora un"
	para "sacco per mante-"
	line "nere i #MON in"
	cont "salute."
	done

StandPokecenter1FCooltrainerFText:
	text "Cosa sta succeden-"
	line "do in città?"
	para "Di solito è così"
	line "tranquilla."
	done
	
StandPokecenter1FCooltrainerFText2:
	text "Hai molte"
	line "MEDAGLIE!"
	para "Hai già sfidato"
	line "la LEGA #MON?"
	para "Un giorno voglio"
	line "scalare il"
	cont "MONTE FUJI."
	done

StandPokecenter1FJanineImpersonatorText1:
	text "Sono venuto a"
	line "INERTOPOLI per"
	para "il PARCO NAZIONALE"
	line "e tutti i suoi"
	cont "#MON."
	para "Mi dispiace non"
	line "poter fare nulla"
	cont "di tutto ciò…"
	done

StandPokecenter1FJanineImpersonatorText2:
	text "INERTOPOLI è"
	line "piena di cose"
	cont "da fare!"
	done

StandPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, STAND_CITY, 5
	warp_event  6,  7, STAND_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandPokecenter1FNurseScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandPokecenter1FCooltrainerMScript, -1
	object_event 13,  6, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandPokecenter1FCooltrainerFScript, -1
	object_event 10,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, StandPokecenter1FJanineImpersonatorScript, -1
