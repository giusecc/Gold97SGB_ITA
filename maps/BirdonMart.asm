	object_const_def ; object_event constants
	const BIRDONMART_CLERK
	const BIRDONMART_COOLTRAINER_M
	const BIRDONMART_BUG_CATCHER

BirdonMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BirdonMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_BIRDON
	closetext
	end

BirdonMartCooltrainerMScript:
	jumptextfaceplayer BirdonMartCooltrainerMText

BirdonMartBugCatcherScript:
	jumptextfaceplayer BirdonMartBugCatcherText

BirdonMartCooltrainerMText:
	text "Non ci sono MEGA"
	line "BALL qui. Dovrò"

	para "farmi bastare le"
	line "# BALL."
	para "A PORTOVEST c'è"
	line "molta più scelta."
	done

BirdonMartBugCatcherText:
	text "Una FUNE DI FUGA"
	line "è molto utile se"
	para "ti sei perso in"
	line "una grotta e vuoi"
	cont "andartene."
	done

BirdonMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BIRDON_TOWN, 3
	warp_event  5,  7, BIRDON_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonMartClerkScript, -1
	object_event  8,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BirdonMartCooltrainerMScript, -1
	object_event  4,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BirdonMartBugCatcherScript, -1
