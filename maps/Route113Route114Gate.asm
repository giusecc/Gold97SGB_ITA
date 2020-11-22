	object_const_def ; object_event constants
	const ROUTE113ROUTE114GATE_TEACHER1
	const ROUTE113ROUTE114GATE_BUTTERFREE
	const ROUTE113ROUTE114GATE_LASS
	const ROUTE113ROUTE114GATE_TEACHER2

Route113Route114Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route113Route114GateTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue .GotSweetScent
	writetext Route113Route114GateTeacherText
	buttonsound
	verbosegiveitem TM_SWEET_SCENT
	iffalse .NoRoom
	setevent EVENT_GOT_TM12_SWEET_SCENT
.GotSweetScent:
	writetext Route113Route114GateTeacher_GotSweetScent
	waitbutton
.NoRoom:
	closetext
	end



Route113Route114GateButterfreeScript:
	opentext
	writetext Route113Route114GateButterfreeText
	cry BUTTERFREE
	waitbutton
	closetext
	end

Route113Route114GateLassScript:
	jumptextfaceplayer Route113Route114GateLassText



Route113Route114GateTeacherText:
	text "L'aria è così"
	line "fresca qui!"
	para "#MON adorano"
	line "l'aria profumata."
	para "Alcuni #MON"
	line "emettono un"
	cont "buon odore."
	para "Lo sapevi?"
	done

Route113Route114GateTeacher_GotSweetScent:
	text "È PROFUMINO."

	para "Usa questa MT dove"
	line "possono esserci"
	cont "#MON!"

	para "Vedrai come ne"
	line "saranno attratti."
	done



Route113Route114GateButterfreeText:
	text "BUTTERFREE: Friii!"
	done

Route113Route114GateLassText:
	text "Da dove arrivi?"
	para "BORGO SILENTE?"
	para "Non è molto"
	line "lontano da qui."
	done

Route113Route114Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_113, 1
	warp_event  5,  0, ROUTE_113, 2
	warp_event  4,  7, ROUTE_114, 1
	warp_event  5,  7, ROUTE_114, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route113Route114GateTeacherScript, EVENT_ROUTE_113_ROUTE_114_GATE_TEACHER_BEHIND_COUNTER
	object_event  0,  4, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route113Route114GateButterfreeScript, -1
	object_event  6,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route113Route114GateLassScript, EVENT_ROUTE_113_ROUTE_114_GATE_LASS
