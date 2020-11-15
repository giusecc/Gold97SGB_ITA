	object_const_def ; object_event constants
	const CROWNMART_CLERK
	const CROWNMART_COOLTRAINER_M
	const CROWNMART_YOUNGSTER

CrownMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CrownMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CROWN_DEX
	closetext
	end

CrownMartCooltrainerMScript:
	jumptextfaceplayer CrownMartCooltrainerMText

CrownMartYoungsterScript:
	jumptextfaceplayer CrownMartYoungsterText

CrownMartCooltrainerMText:
	text "C'è un #MON"
	line "MARKET alla LEGA"
	cont "#MON."
	para "Credo che lì ci"
	line "sia una scelta"
	cont "migliore."
	done


CrownMartYoungsterText:
	text "Prendi delle ULTRA"
	line "BALL se vuoi cat-"
	para "turare dei #MON"
	line "nel MONTE FUJI."
	done

CrownMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CROWN_CITY, 4
	warp_event  5,  7, CROWN_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownMartClerkScript, -1
	object_event  8,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownMartCooltrainerMScript, -1
	object_event  2,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CrownMartYoungsterScript, -1
