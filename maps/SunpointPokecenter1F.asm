	object_const_def ; object_event constants
	const SUNPOINTPOKECENTER1F_NURSE
	const SUNPOINTPOKECENTER1F_LASS
	const SUNPOINTPOKECENTER1F_GYM_GUY
	const SUNPOINTPOKECENTER1F_SUPER_NERD

SunpointPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SunpointPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SunpointPokecenter1FLassScript:
	jumptextfaceplayer SunpointPokecenter1FLassText

StandGymGuyScript:
	faceplayer
	checkevent EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	iftrue .StandGymGuyWinScript
	opentext
	writetext StandGymGuyText
	waitbutton
	closetext
	end

.StandGymGuyWinScript:
	opentext
	writetext StandGymGuyWinText
	waitbutton
	closetext
	end

SunpointPokecenter1FSuperNerdScript:
	jumptextfaceplayer SunpointPokecenter1FSuperNerdText

SunpointPokecenter1FLassText:
	text "Non senti il"
	line "bisogno di far"

	para "vedere i tuoi"
	line "#MON agli"
	cont "amici?"
	para "Io mi vanto sempre"
	line "del mio BELLRING."
	done

StandGymGuyText:
	text "Sei andato ai"
	line "MOLI?"
	para "Sta succedendo"
	line "qualcosa laggiù."
	done

StandGymGuyWinText:
	text "Membri del TEAM"
	line "ROCKET ai moli?"
	para "Non riesco a"
	line "crederci!"
	done

SunpointPokecenter1FUnusedText1:
; unreferenced
	text "Non senti il"
	line "bisogno di far"

	para "vedere i tuoi"
	line "#MON agli"
	cont "amici?"

	para "Vorrei mostrarli"
	line "al mio amico di"
	cont "ANCESTRALIA."
	done

SunpointPokecenter1FUnusedText2:
; unreferenced
	text "Ho sfidato il mio"
	line "amico di"

	para "ANCESTRALIA con"
	line "un MOBILE"
	cont "ADAPTER."
	done

SunpointPokecenter1FSuperNerdText:
	text "Adoro mostrare"
	line "i #MON che"

	para "ho allenato."
	line "Anche tu?"
	done

SunpointPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, SUNPOINT_CITY, 3
	warp_event  6,  7, SUNPOINT_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FLassScript, -1
	object_event 10,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandGymGuyScript, -1
	object_event 12,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FSuperNerdScript, -1
