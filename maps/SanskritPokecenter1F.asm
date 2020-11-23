	object_const_def ; object_event constants
	const SANSKRITPOKECENTER1F_NURSE
	const SANSKRITPOKECENTER1F_POKEFAN_M
	const SANSKRITPOKECENTER1F_YOUNGSTER
	const SANSKRITPOKECENTER1F_COOLTRAINER_F

SanskritPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SanskritPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SanskritPokecenter1FPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	iffalse .SanskritPokecenterRocketsInTown
	writetext SanskritPokecenter1FPokefanMText
	waitbutton
	closetext
	end
	
.SanskritPokecenterRocketsInTown
	writetext SanskritPokecenter1FPokefanMText2
	waitbutton
	closetext
	end

SanskritPokecenter1FYoungsterScript:
	jumptextfaceplayer SanskritPokecenter1FYoungsterText

SanskritPokecenter1FCooltrainerFScript:
	jumptextfaceplayer SanskritPokecenter1FCooltrainerFText

SanskritPokecenter1FPokefanMText:
	text "Buon viaggio"
	line "TEAM ROCKET!"
	para "Non c'è posto per"
	line "loro qui!"
	done
	
SanskritPokecenter1FPokefanMText2:
	text "Cosa? TEAM"
	line "ROCKET è"
	cont "tornato?"

	para "C'è una casa"
	line "in città che"
	para "sembra piena"
	line "dei loro membri!"
	para "Mi chiedo cosa"
	line "vogliano…"
	done

SanskritPokecenter1FYoungsterText:
	text "Cerco di impedire"
	line "che i #MON si"
	para "evolvano troppo"
	line "presto."

	para "Prima che si evol-"
	line "vano voglio inse-"
	cont "gnare loro certe"
	cont "mosse."
	done

SanskritPokecenter1FCooltrainerFText:
	text "I #MON sono più"
	line "forti quando si e-"

	para "volvono, ma impa-"
	line "rano le mosse più"
	cont "lentamente."
	done

SanskritPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, SANSKRIT_TOWN, 4
	warp_event  6,  7, SANSKRIT_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FNurseScript, -1
	object_event  9,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FCooltrainerFScript, -1
