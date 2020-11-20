	object_const_def ; object_event constants
	const NAGOPOKECENTER1F_NURSE
	const NAGOPOKECENTER1F_SUPER_NERD
	const NAGOPOKECENTER1F_GYM_GUY

NagoPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NagoPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

NagoPokecenter1FSuperNerdScript:
	jumptextfaceplayer NagoPokecenter1FSuperNerdText

NagoPokecenter1FGymGuyScript:
	jumptextfaceplayer NagoPokecenter1FGymGuyText

NagoPokecenter1FSuperNerdText:
	text "Per lottare,"
	line "preferisco usare"

	para "#MON che ho"
	line "già allenato anche"

	para "se sono deboli,"
	line "rispetto a quelli"
	cont "appena presi."
	done


NagoPokecenter1FGymGuyText:
	text "In pochi vivono"
	line "in questa città."
	para "RYU KYU è molto"
	line "più affollata."
	done

NagoPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, NAGO_VILLAGE, 1
	warp_event  6,  7, NAGO_VILLAGE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NagoPokecenter1FNurseScript, -1
	object_event  9,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NagoPokecenter1FSuperNerdScript, -1
	object_event  1,  5, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NagoPokecenter1FGymGuyScript, -1
