	object_const_def ; object_event constants
	const DAYOFWEEKSIBLINGSHOUSE_POKEDEX

DayOfWeekSiblingsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	closetext
	end

DayOfWeekSiblingsHousePokedexText1:
	text "Qui c'è scritto"
	line "qualcosa."

	para "Vuoi leggerlo?"
	done

DayOfWeekSiblingsHousePokedexText2:
	text "Fratelli e"
	line "sorelle:"

	para "È un onore per"
	line "noi servire gli"
	para "allenatori di"
	line "#MON."

	para "Quando gli alle-"
	line "tori si rivolgono"
	para "a voi, date loro"
	line "qualcosa di utile!"

	para "Con affetto,"
	line "LUANA"

	para "Continui?"
	done

DayOfWeekSiblingsHousePokedexText3:
	text "Lunedì, LUANA"
	line "PERCORSO 110"

	para "Martedì, MARTA"
	line "PERCORSO 104"

	para "Mercoledì, ERCOLE"
	line "PERCORSO 119"

	para "Giovedì, GIORGIO"
	line "PERCORSO 102"

	para "Venerdì, VERONICA"
	line "PERCORSO 112"

	para "Sabato, SABATINO"
	line "BIANCASELVA"

	para "Domenica, DORINO"
	line "PIANE SILENTI"
	done

DayOfWeekSiblingsHouse_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1
