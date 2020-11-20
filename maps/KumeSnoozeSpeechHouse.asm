	object_const_def ; object_event constants
	const KUMESNOOZESPEECHHOUSE_TEACHER

KumeSnoozeSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KumeSnoozeSpeechHouseTeacherScript:
	jumptextfaceplayer KumeSnoozeSpeechHouseTeacherText
	
KumeSnoozeSpeechHouseTeacherText:
	text "La vita è così"
	line "tranquilla sulle"
	cont "ISOLE."
	para "Mi farò un"
	line "pisolino…"
	done
	
	

KumeSnoozeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KUME_CITY, 4
	warp_event  5,  7, KUME_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  4, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KumeSnoozeSpeechHouseTeacherScript, -1
