	object_const_def ; object_event constants
	const BLUE_FORESTHOUSE_1_GRANNY
	const BLUE_FORESTHOUSE_1_ANIMON

BlueForestHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestHouse1GrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM50_NIGHTMARE
	iftrue .AlreadyGotNightmare
	writetext Text_NightmareIntro
	buttonsound
	verbosegiveitem TM_NIGHTMARE
	iffalse .BagFull
	setevent EVENT_GOT_TM50_NIGHTMARE
.AlreadyGotNightmare:
	writetext Text_NightmareOutro
	waitbutton
.BagFull:
	closetext
	end	

BlueForestHouse1AnimonScript:
	faceplayer
	opentext
	writetext BlueForestHouse1MonText
	cry ANIMON
	waitbutton
	closetext
	end
	
BlueForestHouse1MonText:
	text "ANIMON:"
	line "Uooi!"
	done

Text_NightmareIntro:
	text "Ho fatto un incubo"
	line "stanotte: il mio"
	para "ANIMON era"
	line "scomparso!"
	para "È stato"
	line "terribile."
	para "Per fortuna era"
	line "solo un sogno."
	para "Tuttavia, quando"
	line "mi sono svegliata"
	cont "ho trovato questa."
	para "Io non la voglio."
	line "Prendila tu."
	done
	
Text_NightmareOutro:
	text "MT50 è INCUBO."
	line "È un'infida mossa"
	para "che continua a"
	line "danneggiare #-"
	cont "MON addormentati."
	done

BlueForestHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BLUE_FOREST, 7
	warp_event  5,  7, BLUE_FOREST, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8, 3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestHouse1GrannyScript, -1
	object_event  9, 6, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestHouse1AnimonScript, -1
