	object_const_def ; object_event constants
	const ALLOYPOKECENTER1F_NURSE
	const ALLOYPOKECENTER1F_FISHING_GURU
	const ALLOYPOKECENTER1F_FISHER
	const ALLOYPOKECENTER1F_TEACHER

AlloyPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

AlloyPokecenter1FFishingGuruScript:
	jumpstd HappinessCheckScript

AlloyPokecenter1FFisherScript:
	jumptextfaceplayer AlloyPokecenter1FFisherText

AlloyPokecenter1FTeacherScript:
	jumptextfaceplayer AlloyPokecenter1FTeacherText

AlloyPokecenter1FFisherText:
	text "Un MARINAIO del"
	line "DESMOCAFÉ a sud"

	para "di qui è molto"
	line "generoso."

	para "Ha insegnato VOLO"
	line "al mio #MON."

	para "Ora può portarmi"
	line "ovunque io sia"
	cont "già stato."
	done

AlloyPokecenter1FTeacherText:
	text "Parlano di una"
	line "persona sull'ISOLA"
	para "ZUCCHERINO, oltre"
	line "il mare."

	para "Dicono sia un"
	line "maestro dei"
	cont "#MON DRAGO."
	done

AlloyPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, ALLOY_CITY, 1
	warp_event  6,  7, ALLOY_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyPokecenter1FFishingGuruScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AlloyPokecenter1FFisherScript, -1
	object_event  9,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyPokecenter1FTeacherScript, -1
