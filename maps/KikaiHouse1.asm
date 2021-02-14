	object_const_def ; object_event constants
	const KKHOUSE1_BLACKBELT
	const KKHOUSE1_GRANNY

KikaiHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KKHouse1BBScript:
	jumptextfaceplayer KKHouse1BBText
	
KKHouse1GrannyScript:
	jumptextfaceplayer KKHouse1GrannyText
	
KKHouse1BBText:
	text "Sono venuto dal"
	line "DOJO KARATE di"
	para "DESMOPOLI per"
	line "allenarmi nella"
	para "CALDERA!"
	done

KKHouse1GrannyText:
	text "I lottatori"
	line "alloggiano nella"
	para "mia umile dimora."
	
	para "Forse non sembra,"
	line "ma molti anni fa"
	para "ero anch'io una"
	line "lottatrice giunta"
	para "qui per allenarmi"
	line "alla CALDERA."
	done
	

KikaiHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KIKAI_VILLAGE, 3
	warp_event  5,  7, KIKAI_VILLAGE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KKHouse1BBScript, -1
	object_event  7,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KKHouse1GrannyScript, -1
