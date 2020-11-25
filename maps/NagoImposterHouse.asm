	object_const_def ; object_event constants
	const NAGOIMPOSTORHOUSE_FISHING_GURU
	const NAGOIMPOSTORHOUSE_DIGLETT
	const NAGOIMPOSTORHOUSE_ITEM_BALL

NagoImposterHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NagoImposterHouseImposterScript:
	jumptextfaceplayer NagoImposterHouseImposterText

NagoDiglett:
	opentext
	writetext NagoDiglettText
	cry DIGLETT
	waitbutton
	closetext
	end

NagoImposterHouseAmuletCoin:; in case you miss it on the ship base
	itemball AMULET_COIN

NagoImposterHouseImposterText:
	text "OAK IMPOSTORE: O,h"
	para "Sei tu."
	para "…"
	para "Non sono qui per"
	line "lottare o per far"
	para "parte di qualche"
	line "piano malvagio."
	para "Ho sbagliato a"
	line "collaborare con"
	cont "il TEAM ROCKET."
	para "Ero accecato dal"
	line "potere che mi"
	cont "avevano promesso."
	para "Ma il TEAM ROCKET"
	line "non è fedele."
	para "Per loro non"
	line "valevo niente e"
	para "quando non ero"
	line "più utile a"
	para "ingannare la"
	line "gente, mi hanno"
	para "scaricato subito."
	para "Ora capisco chi"
	line "sono davvero e"
	para "sto cercando di"
	line "lasciarli nel"
	cont "passato."
	para "Non devi perdo-"
	line "narmi, ma questo"
	cont "è quanto."
	done


NagoDiglettText:
	text "DIGLETT: Dig dig."
	done

NagoImposterHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, NAGO_VILLAGE, 2
	warp_event  5,  7, NAGO_VILLAGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  4, SPRITE_SURGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NagoImposterHouseImposterScript, EVENT_TELEPORT_GUY
	object_event  3,  5, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NagoDiglett, EVENT_TELEPORT_GUY
	object_event  0,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NagoImposterHouseAmuletCoin, EVENT_GOT_TEAM_ROCKET_AMULET_COIN
