	object_const_def ; object_event constants
	const NAGO_CHARMANDER_1
	const NAGO_CHARMANDER_2
	const NAGO_CHARMANDER_3
	const NAGO_CHARMANDER_4
	const NAGO_CHARMANDER_5
	const NAGO_CHARMANDER_6

NagoCharmanderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
NagoCharmanderHouseCharmander:
	opentext
	writetext NagoCharmanderHouseCharmanderText
	cry CHARMANDER
	waitbutton
	closetext
	end
	
NagoCharmanderHouseTeacher:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_6
	iftrue .AlreadyGotCharmander
	writetext ILoveCharmanderText
	yesorno
	iffalse .DontTakeCharmander
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullCharmander
	writetext UnknownText_0x7e355a
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHARMANDER, 5
	writetext GiveCharmanderText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_6
	end
	
.AlreadyGotCharmander
	writetext AlreadyGotCharmanderText
	waitbutton
	closetext
	end
	
.DontTakeCharmander
	writetext NoCharmanderText
	waitbutton
	closetext
	end
	
.PartyFullCharmander
	writetext PartyFullCharmanderText
	waitbutton
	closetext
	end
	
UnknownText_0x7e355a:
	text "<PLAYER> riceve"
	line "CHARMANDER."
	done
	
AlreadyGotCharmanderText:
	text "Adoro i miei"
	line "CHARMANDER!"
	done
	
PartyFullCharmanderText:
	text "Hai troppi #-"
	line "MON con te!"
	done
	
NoCharmanderText:
	text "Ooh, non ti piace?"
	done
	

NagoCharmanderHouseCharmanderText:
	text "CHARMANDER: Char!"
	done
	
ILoveCharmanderText:
	text "Oooh, adoro i"
	line "CHARMANDER!"
	para "Sono adorabili!"
	para "Voglio trasmettere"
	line "al mondo il mio"
	para "amore per i"
	line "CHARMANDER."
	para "Ne vuoi uno?"
	done
	
GiveCharmanderText:
	text "Prenditi cura di"
	line "lui!"
	done

NagoCharmanderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, NAGO_VILLAGE, 3
	warp_event  5,  7, NAGO_VILLAGE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  9,  7, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  6,  2, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  8,  1, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  4,  5, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  2,  3, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  1,  4, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  7,  4, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseTeacher, -1
