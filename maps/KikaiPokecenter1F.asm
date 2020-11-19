	object_const_def ; object_event constants
	const KIKAIPC_NURSE
	const KPC_BLACKBELT1
	const KPC_BLACKBELT2

KikaiPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KikaiPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript
	
KikaiPokecenter1FBB1Script:
	jumptextfaceplayer KKPCBBText1

KikaiPokecenter1FBB2Script:
	jumptextfaceplayer KKPCBBText2


KKPCBBText1:
	text "È la dodicesima"
	line "volta in questa"
	para "settimana che"
	line "vengo qui!"
	done

KKPCBBText2:
	text "Vorrei che si"
	line "potessero curare"
	para "le persone come"
	line "i #MON."
	
	para "Se fosse così,"
	line "potrei allenarmi"
	cont "molto di più!"
	done

KikaiPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, KIKAI_VILLAGE, 1
	warp_event  6,  7, KIKAI_VILLAGE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiPokecenter1FNurseScript, -1
	object_event  7,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiPokecenter1FBB1Script, -1
	object_event  12,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiPokecenter1FBB2Script, -1
