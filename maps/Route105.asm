	object_const_def ; object_event constants
	const ROUTE105_YOUNGSTER3
	const ROUTE105_YOUNGSTER4
	;const ROUTE105_FRUIT_TREE1
	;const ROUTE105_FRUIT_TREE2
	const ROUTE105_COOLTRAINER_F
	const ROUTE105_POKE_BALL

Route105_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks





TrainerYoungsterMikey:
	trainer YOUNGSTER, MIKEY, EVENT_BEAT_YOUNGSTER_MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterMikeyAfterText
	waitbutton
	closetext
	end



Route105YoungsterScript:
	jumptextfaceplayer Route105YoungsterText_DirectionsToMrPokemonsHouse

Route105CooltrainerFScript:
	jumptextfaceplayer Route105CooltrainerFText

Route105Sign:
	jumptext Route105SignText


Route105Antidote:
	itemball ANTIDOTE



Route105HiddenPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_105_HIDDEN_POTION




YoungsterMikeySeenText:
	text "Sei un allenatore,"
	line "giusto?"

	para "Allora devi"
	line "lottare!"
	done

YoungsterMikeyBeatenText:
	text "Che strano."
	line "Prima ho vinto."
	done

YoungsterMikeyAfterText:
	text "È difficile"
	line "diventare un bravo"
	cont "allenatore."

	para "Continuerò a"
	line "lottare per"
	cont "migliorare."
	done





Route105YoungsterText_DirectionsToMrPokemonsHouse:
	text "Sono stanco."
	para "Non riesco più"
	line "a camminare."
	para "Vorrei poter"
	line "volare verso"
	cont "un'altra città."
	done

Route105CooltrainerFText:
	text "Sto cercando"
	line "#MON di tipo"
	cont "ELETTRO."
	para "Ci sono diverse"
	line "specie che vivono"
	para "in queste zone"
	line "d'erba."
	done

Route105SignText:
	text "PERCORSO 105"

	para "BOSCO GIADA"
	line "per di qua!"
	done



Route105_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 30, ROUTE_105_ROUTE_106_GATE, 1
	warp_event  9, 30, ROUTE_105_ROUTE_106_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 28, BGEVENT_READ, Route105Sign
	bg_event 13, 30, BGEVENT_ITEM, Route105HiddenPotion

	db 4 ; object events
	object_event  8, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterMikey, -1
	object_event  7, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route105YoungsterScript, -1
	object_event 10,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route105CooltrainerFScript, -1
	object_event 14,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route105Antidote, EVENT_ROUTE_105_ANTIDOTE
