	object_const_def ; object_event constants
	const ISENSTRAIT_SWIMMER_GIRL1
	const ISENSTRAIT_SWIMMER_GIRL2
	const ISENSTRAIT_SWIMMER_GUY

IsenStrait_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .IsenStraitClearRocks
	
.IsenStraitClearRocks:
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .Done20
	changeblock  51, 5, $63 ; rock
.Done20:
	return


TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNicoleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLoriAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCameronAfterBattleText
	waitbutton
	closetext
	end

FrostpointGymSign:
	jumptext FrostpointGymSignText

SwimmerfNicoleSeenText:
	text "In acqua il mio"
	line "corpo è così"
	cont "leggero!"
	done

SwimmerfNicoleBeatenText:
	text "Oh, no!"
	done

SwimmerfNicoleAfterBattleText:
	text "Nuotare rinforza"
	line "tutto il corpo."
	cont "Fa davvero bene."
	done

SwimmerfLoriSeenText:
	text "Che serie impres-"
	line "sionante di"

	para "MEDAGLIE. Dobbiamo"
	line "proprio lottare!"
	done

SwimmerfLoriBeatenText:
	text "No!"
	done

SwimmerfLoriAfterBattleText:
	text "SURF non è più"
	line "l'unica MN da"
	cont "usare in acqua."
	done

SwimmermCameronSeenText:
	text "Non credo che sia"
	line "possibile nuotare"

	para "fino alla"
	line "terraferma."
	done

SwimmermCameronBeatenText:
	text "Ahiahi!"
	done

SwimmermCameronAfterBattleText:
	text "Oltre che in mare,"
	line "posso nuotare"
	para "anche nei fiumi e"
	line "nei laghetti."
	done

FrostpointGymSignText:
	text "CENTRO RICERCA"
	line "#MON"
	para "…Dice il cartello."
	line "C'è la parola"
	para "'INAGIBILE'"
	line "scritta sopra…"
	done

IsenStrait_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 53, 11, SEASIDE_PATH_ISEN_STRAIT_GATE, 1
	warp_event 18,  3, ISEN_LAB_FRONT, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20,  2, BGEVENT_READ, FrostpointGymSign

	db 3 ; object events
	object_event 14, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 24, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 36, 11, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
