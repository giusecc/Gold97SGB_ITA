	object_const_def ; object_event constants
	const RYUKYUMART_CLERK
	const RYUKYUMART_COOLTRAINER_M
	const RYUKYUMART_COOLTRAINER_F

RyukyuMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RyukyuMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_RYUKYU
	closetext
	end

RyukyuMartCooltrainerMScript:
	jumptextfaceplayer RyukyuMartCooltrainerMText

RyukyuMartCooltrainerFScript:
	jumptextfaceplayer RyukyuMartCooltrainerFText

RyukyuMartCooltrainerMText:
	text "C'è un tipo"
	line "in città che"
	para "vuole essere un"
	line "CAPOPALESTRA."
	para "L'hai già"
	line "sfidato?"
	done

RyukyuMartCooltrainerFText:
	text "Questa città è"
	line "la più calda"
	cont "delle ISOLE."
	done

RyukyuMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, RYUKYU_CITY, 1
	warp_event  5,  7, RYUKYU_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuMartClerkScript, -1
	object_event  7,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuMartCooltrainerMScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuMartCooltrainerFScript, -1
