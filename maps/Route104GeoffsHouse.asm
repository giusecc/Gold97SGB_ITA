	object_const_def ; object_event constants
	const ROUTE104GEOFFSHOUSE_POKEFAN_M

Route104GeoffsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route104GeoffsHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_104_HOUSE
	iftrue .GotBerry
	writetext Route104GeoffsHouseMonEatBerriesText
	buttonsound
	verbosegiveitem PSNCUREBERRY
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_FROM_ROUTE_104_HOUSE
.GotBerry:
	writetext Route104GeoffsHouseCheckTreesText
	waitbutton
.NoRoom:
	closetext
	end

Route104GeoffsHouseBookshelf:
	jumpstd MagazineBookshelfScript

Route104GeoffsHouseMonEatBerriesText:
	text "Adoro prendermi"
	line "cura delle mie"
	cont "piante."
	para "Ma qui è tutto"
	line "arido."
	para "È veramente dif-"
	line "ficile far"
	cont "crescere i fiori."
	para "Di recente sono"
	line "riuscito a far"
	para "crescere delle"
	line "BACCHE sul retro."
	para "Ecco! Lascia che"
	line "ti dia un po'"
	cont "di frutti!"
	done

Route104GeoffsHouseCheckTreesText:
	text "Forse un giorno"
	line "riuscirò ad avere"
	cont "due alberi."
	done

Route104GeoffsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROUTE_104, 1
	warp_event  5,  7, ROUTE_104, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, Route104GeoffsHouseBookshelf
	bg_event  1,  0, BGEVENT_READ, Route104GeoffsHouseBookshelf

	db 1 ; object events
	object_event  4,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route104GeoffsHousePokefanMScript, EVENT_GEOFFREY_GONE_TO_DAITO
