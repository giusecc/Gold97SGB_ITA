	object_const_def ; object_event constants
	const JADE_FOREST_SNORLAX_ROOM_SNORLAX

JadeForestSnorlaxRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


AmamiSnorlax:
	;faceplayer
	opentext
	writetext SnorlaxText
	yesorno
	iffalse DontDisturbSnorlaxScript
	writetext SnorlaxText2
	waitbutton
	closetext
	pause 20
	opentext
	writetext SnorlaxText3
	cry SNORLAX
	pause 15
	closetext
	setevent EVENT_JADE_FOREST_SNORLAX
;	writecode VAR_BATTLETYPE, BATTLETYPE_ROAMING
	loadwildmon SNORLAX, 20
	startbattle
	disappear JADE_FOREST_SNORLAX_ROOM_SNORLAX
	reloadmapafterbattle
	end
	
DontDisturbSnorlaxScript:
	writetext SnorlaxAloneText
	waitbutton
	closetext
	end
	
SnorlaxAloneText:
	text "Meglio lasciarlo"
	line "da solo…"
	done
	
SnorlaxText:
	text "Questo SNORLAX"
	line "sembra irrequieto."
	para "…Vuoi disturbarlo?"
	done
	
SnorlaxText2:
	text "Hai toccato"
	line "SNORLAX…"
	para "Si è svegliato!"
	done
	
SnorlaxText3:
	text "SNORLAX:"
	line "Snor?"
	done
	

JadeForestSnorlaxRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, JADE_FOREST, 7
	warp_event  5, 15, JADE_FOREST, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  3, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiSnorlax, EVENT_JADE_FOREST_SNORLAX
