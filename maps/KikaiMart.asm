	object_const_def ; object_event constants
	const KIKAIMART_CLERK
	const KIKAIMART_WOMAN
	const KIKAIMART_BLACKBELT

KikaiMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KikaiMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_AMAMI
	closetext
	end

KikaiMartBlackbeltScript:
	jumptextfaceplayer KikaiMartBlackbeltText
	
KikaiMartWomanScript:
	jumptextfaceplayer KikaiMartWomanText
	
KikaiMartBlackbeltText:
	text "Ho bisogno di"
	line "molti strumenti"
	para "per allenarmi"
	line "nella CALDERA!"
	done

KikaiMartWomanText:
	text "Le IPERPOZIONI"
	line "vendono un sacco."
	para "Sono necessarie se"
	line "si passa molto"
	para "tempo nella"
	line "CALDERA."
	done

KikaiMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KIKAI_VILLAGE, 2
	warp_event  5,  7, KIKAI_VILLAGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiMartClerkScript, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiMartWomanScript, -1
	object_event  10,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiMartBlackbeltScript, -1
	
