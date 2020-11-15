	object_const_def ; object_event constants
	const CROWN_HOUSE_1_GRANNY

CrownHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
CrownHouse1GrannyScript:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_10
	iftrue .alreadygavescopelens
	writetext CrownHouse1GrannyText1
	waitbutton
	verbosegiveitem SCOPE_LENS
	iffalse .Done
	setevent EVENT_SWITCH_10
	jump .alreadygavescopelens
	end
	
.alreadygavescopelens
	writetext CrownHouse1GrannyText2
	waitbutton
	closetext
	end
	
.Done
	closetext
	end
	
CrownHouse1GrannyText1:
	text "Ai miei tempi ero"
	line "uno sfidante della"
	cont "LEGA."
	para "Sai qual è il"
	line "segreto?"
	para "Strategia. Devi"
	line "saper usare gli"
	cont "strumenti."
	para "Ecco, ne ho uno"
	line "buono per te."
	done
	
CrownHouse1GrannyText2:
	text "MIRINO fa sì che"
	line "i tuoi #MON"
	para "possano fare più"
	line "brutti colpi."
	para "Non sapranno cosa"
	line "li ha colpiti!"
	done

CrownHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CROWN_CITY, 6
	warp_event  5,  7, CROWN_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownHouse1GrannyScript, -1
