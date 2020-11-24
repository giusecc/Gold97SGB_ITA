	object_const_def ; object_event constants
	const WESTPORTDEPTSTORE1F_RECEPTIONIST
	const WESTPORTDEPTSTORE1F_POKEFAN_F
	const WESTPORTDEPTSTORE1F_BUG_CATCHER
	const WESTPORTDEPTSTORE1F_GENTLEMAN

WestportDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportDeptStore1FReceptionistScript:
	jumptextfaceplayer WestportDeptStore1FReceptionistText

WestportDeptStore1FGentlemanScript:
	jumptextfaceplayer WestportDeptStore1FGentlemanText

WestportDeptStore1FPokefanFScript:
	jumptextfaceplayer WestportDeptStore1FPokefanFText

WestportDeptStore1FBugCatcherScript:
	jumptextfaceplayer WestportDeptStore1FBugCatcherText

WestportDeptStore1FDirectory:
	jumptext WestportDeptStore1FDirectoryText

WestportDeptStore1FElevatorButton:
	jumpstd ElevatorButtonScript

WestportDeptStore1FReceptionistText:
	text "Benvenuto al"
	line "CENTRO COMMERCIALE"
	cont "di PORTOVEST."
	done

WestportDeptStore1FGentlemanText:
	text "C'è una buona"
	line "scelta al CENTRO"
	cont "COMMERCIALE."

	para "Ma certi strumenti"
	line "si possono avere"

	para "soltanto nei"
	line "sotterranei."
	done

WestportDeptStore1FPokefanFText:
	text "Che bello fare"
	line "spese!"
	done

WestportDeptStore1FBugCatcherText:
	text "La mamma è una"
	line "cacciatrice di"
	cont "offerte speciali."

	para "Riesce sempre a"
	line "comprare con lo"
	cont "sconto."
	done

WestportDeptStore1FDirectoryText:
	text "PT BANCO"
	line "   INFORMAZIONI"

	para "P1 BANCO PER"
	line "   ALLENATORI"

	para "P2 COLLEZIONE"
	line "   LOTTA"

	para "P3 LA BORSA DELLE"
	line "   MEDICINE"

	para "P4 ANGOLO MT"

	para "P5 PIAZZETTA"
	line "   ULTIMO PIANO"
	done

WestportDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 13,  7, WESTPORT_CITY, 5
	warp_event 14,  7, WESTPORT_CITY, 9
	warp_event 15,  0, WESTPORT_DEPT_STORE_2F, 2
	warp_event  2,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, WestportDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, WestportDeptStore1FElevatorButton

	db 4 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FReceptionistScript, -1
	object_event  6,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FPokefanFScript, -1
	object_event  6,  6, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FBugCatcherScript, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FGentlemanScript, -1
