	object_const_def ; object_event constants
	const KANTODEPTSTORE2F_CLERK1
	const KANTODEPTSTORE2F_CLERK2
	const KANTODEPTSTORE2F_POKEFAN_M
	const KANTODEPTSTORE2F_YOUNGSTER

KantoDeptStore2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_KANTO_2F_1
	closetext
	end

KantoDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_KANTO_2F_2
	closetext
	end

KantoDeptStore2FPokefanMScript:
	jumptextfaceplayer KantoDeptStore2FPokefanMText

KantoDeptStore2FYoungsterScript:
	jumptextfaceplayer KantoDeptStore2FYoungsterText

KantoDeptStore2FDirectory:
	jumptext KantoDeptStore2FDirectoryText

KantoDeptStore2FElevatorButton:
	jumpstd ElevatorButtonScript

KantoDeptStore2FPokefanMText:
	text "Da poco sono"
	line "allenatore."

	para "C'è davvero una"
	line "grande scelta di"
	cont "strumenti!"
	done

KantoDeptStore2FYoungsterText:
	text "Questo negozio"
	line "ha più strumenti"
	para "di quelli che"
	line "saprei usare."
	done

KantoDeptStore2FDirectoryText:
	text "Strumenti di prima"
	line "qualità per gli"
	cont "allenatori."

	para "P1: NEGOZIO PER"
	line "    ALLENATORI"
	done

KantoDeptStore2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, KANTO_DEPT_STORE_3F, 1
	warp_event 15,  0, KANTO_DEPT_STORE_1F, 3
	warp_event  2,  0, KANTO_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, KantoDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, KantoDeptStore2FElevatorButton

	db 4 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore2FClerk1Script, -1
	object_event 14,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore2FClerk2Script, -1
	object_event  5,  5, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoDeptStore2FPokefanMScript, -1
	object_event  6,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoDeptStore2FYoungsterScript, -1
