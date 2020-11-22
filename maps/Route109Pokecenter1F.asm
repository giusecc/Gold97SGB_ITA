	object_const_def ; object_event constants
	const ROUTE109POKECENTER1F_NURSE
	const ROUTE109POKECENTER1F_GENTLEMAN
	const ROUTE109POKECENTER1F_GYM_GUY
	const ROUTE109POKECENTER1F_COOLTRAINER_F

Route109Pokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route109Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

Route109Pokecenter1FGentlemanScript:
	jumptextfaceplayer Route109Pokecenter1FGentlemanText

Route109Pokecenter1FGymGuyScript:
	jumptextfaceplayer Route109Pokecenter1FGymGuyText


Route109Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route109Pokecenter1FCooltrainerFText

Route109Pokecenter1FGentlemanText:
	text "Un CENTRO #MON"
	line "vicino a una"
	cont "grotta?"

	para "Abbastanza"
	line "conveniente."
	done

Route109Pokecenter1FGymGuyText:
	text "Sei mai stato"
	line "a nord di NIHON?"
	para "Fa molto freddo"
	line "laggiù."
	done


Route109Pokecenter1FCooltrainerFText:
	text "Non me la sento"
	line "di entrare nella"
	cont "GROTTA AMPARE."
	para "Non porta da"
	line "nessuna parte."
	para "Puoi direttamente"
	line "andare a"
	cont "BIANCASELVA."
	done


Route109Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, ROUTE_109, 2
	warp_event  6,  7, ROUTE_109, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route109Pokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route109Pokecenter1FGentlemanScript, -1
	object_event  9,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route109Pokecenter1FGymGuyScript, -1
	object_event  1,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route109Pokecenter1FCooltrainerFScript, -1
