	object_const_def ; object_event constants
	const KANTODEPTSTORE1F_RECEPTIONIST
	const KANTODEPTSTORE1F_GENTLEMAN
	const KANTODEPTSTORE1F_TEACHER

KantoDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoDeptStore1FReceptionistScript:
	jumptextfaceplayer KantoDeptStore1FReceptionistText

KantoDeptStore1FGentlemanScript:
	jumptextfaceplayer KantoDeptStore1FGentlemanText

KantoDeptStore1FTeacherScript:
	jumptextfaceplayer KantoDeptStore1FTeacherText

KantoDeptStore1FDirectory:
	jumptext KantoDeptStore1FDirectoryText

KantoDeptStore1FElevatorButton:
	jumpstd ElevatorButtonScript

KantoDeptStore1FReceptionistText:
	text "Benvenuto al"
	line "CENTRO COMMERCIALE"
	cont "di KANTO!"

	para "Appesa al muro c'è"
	line "la guida."
	done

KantoDeptStore1FGentlemanText:
	text "Questo CENTRO COM-"
	line "MERCIALE fa parte"

	para "della stessa"
	line "catena di quello"
	cont "di PORTOVEST."

	para "Sono stati"
	line "rinnovati"
	cont "insieme."
	done

KantoDeptStore1FTeacherText:
	text "È la prima volta"
	line "che vengo qui."

	para "È immenso…"

	para "Ho paura di"
	line "perdermi."
	done

KantoDeptStore1FDirectoryText:
	text "PT: ASSISTENZA"
	line "    CASSE"

	para "P1: NEGOZIO PER"
	line "    ALLENATORI"

	para "P2: NEGOZIO MT"

	para "P3: REGALI"

	para "P4: FARMACIA"

	para "P5: DISTRIBUTORI"
	line "    AUTOMATICI"
	done

KantoDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 13,  7, KANTO_REGION, 1
	warp_event 14,  7, KANTO_REGION, 13
	warp_event 15,  0, KANTO_DEPT_STORE_2F, 2
	warp_event  2,  0, KANTO_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, KantoDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, KantoDeptStore1FElevatorButton

	db 3 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoDeptStore1FReceptionistScript, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoDeptStore1FGentlemanScript, -1
	object_event  5,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoDeptStore1FTeacherScript, -1
