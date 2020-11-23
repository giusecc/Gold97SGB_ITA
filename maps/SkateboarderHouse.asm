	object_const_def ; object_event constants
	const SKATEBOARDERHOUSE_GRAMPS

SkateboarderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SkateboarderHouseSkateboarderDude:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iffalse .nobicycleyet
	checkevent EVENT_GOT_SKATEBOARD
	iftrue .alreadygotskateboard
	writetext SkateboarderHouseSkateboarderDudeText
	waitbutton
	verbosegiveitem SKATEBOARD
	setevent EVENT_GOT_SKATEBOARD
	writetext SkateboarderHouseSkateboarderDudeText2
	waitbutton
	closetext
	end
	
.alreadygotskateboard
	writetext SkateboarderHouseSkateboarderDudeText2
	waitbutton
	closetext
	end

.nobicycleyet
	writetext SkateboarderHouseSkateboarderDudeTextNoBike
	waitbutton
	closetext
	end

SkateboarderHouseBookshelf:
	jumpstd MagazineBookshelfScript

SkateboarderHouseSkateboarderDudeText:
	text "Ehi, amico!"
	para "Vai ancora in"
	line "giro in bici?"
	para "Stai al passo"
	line "coi tempo!"
	para "Ecco, tieni!"
	done
	
SkateboarderHouseSkateboarderDudeText2:
	text "Amico!"
	para "Con questa tavola"
	line "puoi andare veloce"
	para "in molti più posti"
	line "rispetto alla"
	cont "bici!"
	done
	
SkateboarderHouseSkateboarderDudeTextNoBike:
	text "Ehi, amico!"
	para "Vai ancora in"
	line "giro a piedi?"
	para "Se non ti va di"
	line "andare in bici,"
	para "sicuramente ti"
	line "piacerà"
	cont "questo!"
	done
	

SkateboarderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SUNPOINT_CITY, 7
	warp_event  5,  7, SUNPOINT_CITY, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, SkateboarderHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, SkateboarderHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SkateboarderHouseSkateboarderDude, -1
