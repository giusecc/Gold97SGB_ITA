	object_const_def ; object_event constants
	const KANTODEPTSTORE3F_CLERK
;	const KANTODEPTSTORE3F_CLERK2
	const KANTODEPTSTORE3F_YOUNGSTER
	const KANTODEPTSTORE3F_GAMEBOY_KID1
	const KANTODEPTSTORE3F_GAMEBOY_KID2
	const KANTODEPTSTORE3F_SUPER_NERD

KantoDeptStore3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoDeptStore3FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_KANTO_3F
	closetext
	end

;KantoDeptStore3FClerk2Script:
;	faceplayer
;	opentext
;	pokemart MARTTYPE_STANDARD, MART_KANTO_3F_2
;	closetext
;	end

KantoDeptStore3FYoungsterScript:
	jumptextfaceplayer KantoDeptStore3FYoungsterText

KantoDeptStore3FGameboyKid1Script:
	faceplayer
	opentext
	writetext KantoDeptStore3FGameboyKid1Text
	waitbutton
	closetext
	turnobject KANTODEPTSTORE3F_GAMEBOY_KID1, DOWN
	end

KantoDeptStore3FGameboyKid2Script:
	faceplayer
	opentext
	writetext KantoDeptStore3FGameboyKid2Text
	waitbutton
	closetext
	turnobject KANTODEPTSTORE3F_GAMEBOY_KID2, DOWN
	end

KantoDeptStore3FSuperNerdScript:
	jumptextfaceplayer KantoDeptStore3FSuperNerdText

KantoDeptStore3FElevatorButton:
	jumpstd ElevatorButtonScript

KantoDeptStore3FDirectory:
	jumptext KantoDeptStore3FDirectoryText

KantoDeptStore3FYoungsterText:
	text "Non saprei su"
	line "quale #MON"

	para "potrei usare"
	line "questa MT…"
	done

KantoDeptStore3FGameboyKid1Text:
	text "Oh no! Ho scambia-"
	line "to il #MON"

	para "senza prendergli"
	line "UPGRADE!"
	done

KantoDeptStore3FGameboyKid2Text:
	text "Sì! Finalmente"
	line "avrò un PORYGON!"

	para "Non ho fortuna al-"
	line "le slot, non avrei"

	para "mai vinto tutti"
	line "quei gettoni…"

	para "…Ma come?"

	para "Il PORYGON preso"
	line "nello scambio è"
	para "diventato un altro"
	line "#MON!"
	done

KantoDeptStore3FSuperNerdText:
	text "Nel negozio di MT"
	line "si trovano mosse"
	cont "rare."
	done

KantoDeptStore3FDirectoryText:
	text "P2: NEGOZIO MT"

	para "Più forza per i"
	line "tuoi #MON!"
	done

KantoDeptStore3F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, KANTO_DEPT_STORE_2F, 1
	warp_event 15,  0, KANTO_DEPT_STORE_4F, 2
	warp_event  2,  0, KANTO_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, KantoDeptStore3FDirectory
	bg_event  3,  0, BGEVENT_READ, KantoDeptStore3FElevatorButton

	db 5 ; object events
	object_event  7,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore3FClerkScript, -1
;	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore3FClerk2Script, -1
	object_event  3,  5, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoDeptStore3FYoungsterScript, -1
	object_event  9,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoDeptStore3FGameboyKid1Script, -1
	object_event 10,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore3FGameboyKid2Script, -1
	object_event 13,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoDeptStore3FSuperNerdScript, -1
