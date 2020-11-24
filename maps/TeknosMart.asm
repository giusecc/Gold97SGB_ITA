	object_const_def ; object_event constants
	const TEKNOSMART_CLERK
	const TEKNOSMART_SUPER_NERD
	const TEKNOSMART_GRANNY

TeknosMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeknosMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_TEKNOS
	closetext
	end

TeknosMartSuperNerdScript:
	jumptextfaceplayer TeknosMartSuperNerdText

TeknosMartGrannyScript:
	jumptextfaceplayer TeknosMartGrannyText

TeknosMartSuperNerdText:
	text "Il mio EEVEE"
	line "si è evoluto"
	cont "in un FLAREON."

	para "Quello del mio"
	line "amico si è evoluto"
	cont "in UMBREON."
	
	para "EEVEE può"
	line "evolversi in"
	cont "molti modi."
	done

TeknosMartGrannyText:
	text "Se usi un"
	line "REVITALIZZANTE"

	para "puoi risvegliare"
	line "un #MON"
	cont "esausto."
	done

TeknosMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 6
	warp_event  5,  7, TEKNOS_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosMartClerkScript, -1
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosMartSuperNerdScript, -1
	object_event  6,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosMartGrannyScript, -1
