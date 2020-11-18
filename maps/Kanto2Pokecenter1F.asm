	object_const_def ; object_event constants
	const KANTO2POKECENTER1F_NURSE
	const KANTO2POKECENTER1F_COOLTRAINERM
	const KANTO2POKECENTER1F_GRANNY
	const KANTO2POKECENTER1F_YOUNGSTER

Kanto2Pokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Kanto2Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript
	
Kanto2PokecenterCooltrainerMScript:
	jumptextfaceplayer Kanto2PokecenterCooltrainerMText
	
Kanto2PokecenterGrannyScript:
	jumptextfaceplayer Kanto2PokecenterGrannyText
	
Kanto2PokecenterYoungsterScript:
	jumptextfaceplayer Kanto2PokecenterYoungsterText
	
Kanto2PokecenterCooltrainerMText:
	text "C'è un sacco di"
	line "roba da fare da"
	cont "queste parti."
	para "Hai già sfidato"
	line "la PALESTRA di"
	cont "ROSSO?"
	done
	
Kanto2PokecenterGrannyText:
	text "Ci sono molti"
	line "allenatori che"
	para "vengono in questa"
	line "città per sfidare"
	cont "ROSSO."
	done
	
Kanto2PokecenterYoungsterText:
	text "So che c'è una"
	line "PENSIONE #MON"
	para "vicino a"
	line "DESMOPOLI."
	done

Kanto2Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, KANTO_REGION, 21
	warp_event  6,  7, KANTO_REGION, 21
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kanto2Pokecenter1FNurseScript, -1
	object_event  3,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kanto2PokecenterCooltrainerMScript, -1
	object_event 10,  1, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kanto2PokecenterGrannyScript, -1
	object_event 14,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kanto2PokecenterYoungsterScript, -1
