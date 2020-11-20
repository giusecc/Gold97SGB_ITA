	object_const_def ; object_event constants
	const KUMEMART_CLERK
	const KUMEMART_COOLTRAINER_M
	const KUMEMART_COOLTRAINER_F

KumeMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KumeMart_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_NAGO
	closetext
	end

KumeMart_CooltrainerM:
	jumptextfaceplayer KumeMart_CooltrainerMText

KumeMart_CooltrainerF:
	jumptextfaceplayer KumeMart_CooltrainerFText

KumeMart_CooltrainerMText:
	text "C'è un tipo qui"
	line "specializzato nel"
	para "costruire e ripa-"
	line "rare navi."
	done

KumeMart_CooltrainerFText:
	text "Non c'è niente"
	line "di interessante in"
	cont "questo negozio."
	done

KumeMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KUME_CITY, 1
	warp_event  5,  7, KUME_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeMart_Clerk, -1
	object_event  1,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KumeMart_CooltrainerM, -1
	object_event  7,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KumeMart_CooltrainerF, -1
