	object_const_def ; object_event constants
	const AMPARECAVERN1F_PHARMACIST
	const AMPARECAVERN1F_POKE_BALL1
	const AMPARECAVERN1F_POKE_BALL2

AmpareCavern1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmpareCavern1FPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	iftrue .GotBlackglasses
	writetext AmpareCavern1FPharmacistText1
	buttonsound
	verbosegiveitem CONFUSE_CLAW
	iffalse .PackFull
	setevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
.GotBlackglasses:
	writetext AmpareCavern1FPharmacistText2
	waitbutton
.PackFull:
	closetext
	end

AmpareCavern1FRevive:
	itemball REVIVE

AmpareCavern1FTMSnore:
	itemball TM_SNORE

AmpareCavern1FPharmacistText1:
	text "Ehi! Mi hai"
	line "spaventato!"

	para "Credo di non"
	line "sapere bene"
	cont "dove sono."
	
	para "Se non vuoi che"
	line "i tuoi #MON"
	para "siano confusi"
	line "dai loro questo."
	done

AmpareCavern1FPharmacistText2:
	text "CAOSARTIGLIO"
	line "previene la"
	cont "confusione."
	done

AmpareCavern1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 15, ROUTE_109, 1
	warp_event 19, 25, AMPARE_CAVERN_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 13, 29, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmpareCavern1FPharmacistScript, -1
	object_event 25, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavern1FRevive, EVENT_AMPARE_CAVERN_1F_REVIVE
	object_event 15, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavern1FTMSnore, EVENT_AMPARE_CAVERN_1F_TM_SNORE
