	object_const_def ; object_event constants
	const AMAMIPOKECENTER1F_NURSE
	const AMAMIPOKECENTER1F_FISHING_GURU
	const AMAMIPOKECENTER1F_SAILOR
	const AMAMIPOKECENTER1F_BUG_CATCHER

AmamiPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

AmamiPokecenter1FFishingGuruScript:
	jumptextfaceplayer AmamiPokecenter1FFishingGuruText

AmamiPokecenter1FSailorScript:
	jumptextfaceplayer AmamiPokecenter1FSailorText

AmamiPokecenter1FBugCatcherScript:
	jumptextfaceplayer AmamiPokecenter1FBugCatcherText

AmamiPokecenter1FFishingGuruText:
	text "Si dice che un"
	line "trio leggendario"
	para "di ucelli elemen-"
	line "tali si mostrerà"
	para "a chi avrà con sé"
	line "la chiave."
	para "Mi chiedo cosa sia"
	line "la chiave."
	para "E chi sono questi"
	line "#MON?"
	done


AmamiPokecenter1FSailorText:
	text "La M/N ACQUA è un"
	line "posto fantastico"

	para "per incontrare e"
	line "sfidare"
	cont "allenatori."
	done

AmamiPokecenter1FBugCatcherText:
	text "Oh? Quante"
	line "medaglie!"
	para "Hai battuto"
	line "la LEGA?"
	done

AmamiPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, AMAMI_TOWN, 3
	warp_event  6,  7, AMAMI_TOWN, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiPokecenter1FNurseScript, -1
	object_event 10,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiPokecenter1FFishingGuruScript, -1
	object_event  8,  5, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AmamiPokecenter1FSailorScript, -1
	object_event  1,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AmamiPokecenter1FBugCatcherScript, -1
