	object_const_def ; object_event constants
	const WESTPORTDEPTSTORE4F_CLERK
	const WESTPORTDEPTSTORE4F_COOLTRAINER_M
	const WESTPORTDEPTSTORE4F_BUG_CATCHER
	const WESTPORTDEPTSTORE4F_GAMEBOY_KID

WestportDeptStore4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportDeptStore4FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_WESTPORT_4F
	closetext
	end

WestportDeptStore4FCooltrainerMScript:
	jumptextfaceplayer WestportDeptStore4FCooltrainerMText

WestportDeptStore4FBugCatcherScript:
	jumptextfaceplayer WestportDeptStore4FBugCatcherText

WestportDeptStore4FGameboyKidScript:
	faceplayer
	opentext
	writetext WestportDeptStore4FGameboyKidText
	waitbutton
	closetext
	turnobject WESTPORTDEPTSTORE4F_GAMEBOY_KID, DOWN
	end

WestportDeptStore4FDirectory:
	jumptext WestportDeptStore4FDirectoryText
	


WestportDeptStore4FElevatorButton:
	jumpstd ElevatorButtonScript

WestportDeptStore4FCooltrainerMText:
	text "Io adoro i #MON"
	line "forti."

	para "Con la PROTEINA"
	line "potenzio il loro"
	cont "ATTACCO."
	done

WestportDeptStore4FBugCatcherText:
	text "Il FERRO migliora"
	line "la DIFESA dei tuoi"
	cont "#MON."
	done

WestportDeptStore4FGameboyKidText:
	text "Certi #MON si"
	line "evolvono soltanto"

	para "attraverso lo"
	line "scambio."

	para "Ne conosco 4:"
	line "MACHOKE, KADABRA,"

	para "HAUNTER e"
	line "GRAVELER."

	para "Ma so che ce ne"
	line "sono altri."
	done

WestportDeptStore4FDirectoryText:
	text "I tuoi #MON in"
	line "piena forma!"

	para "P3 LA BORSA DELLE"
	line "   MEDICINE"
	done

WestportDeptStore4F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, WESTPORT_DEPT_STORE_5F, 1
	warp_event 15,  0, WESTPORT_DEPT_STORE_3F, 2
	warp_event  2,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, WestportDeptStore4FDirectory
	bg_event  3,  0, BGEVENT_READ, WestportDeptStore4FElevatorButton

	db 4 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore4FClerkScript, -1
	object_event  8,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore4FCooltrainerMScript, -1
	object_event  7,  2, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore4FBugCatcherScript, -1
	object_event  5,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore4FGameboyKidScript, -1
