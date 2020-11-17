	object_const_def ; object_event constants
	const FROSTPOINTPOKECENTER1F_NURSE
	const FROSTPOINTPOKECENTER1F_COOLTRAINER_F
	const FROSTPOINTPOKECENTER1F_FISHER

FrostpointPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FrostpointPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

FrostpointPokecenter1FCooltrainerFScript:
	jumptextfaceplayer FrostpointPokecenter1FCooltrainerFText

FrostpointPokecenter1FFisherScript:
	jumptextfaceplayer FrostpointPokecenter1FFisherText

FrostpointPokecenter1FCooltrainerFText:
	text "È troppo difficile"
	line "arrivare qui via"
	cont "mare."
	para "VOLO qui con il"
	line "mio #MON."
	done

FrostpointPokecenter1FFisherText:
	text "Il PASSAGGIO"
	line "SOMMERSO è più"
	para "grande del"
	line "percorso che"
	cont "arriva qui."
	done

FrostpointPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, FROSTPOINT_TOWN, 1
	warp_event  6,  7, FROSTPOINT_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointPokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FrostpointPokecenter1FCooltrainerFScript, -1
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FrostpointPokecenter1FFisherScript, -1
