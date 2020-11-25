	object_const_def ; object_event constants
	const URASOETRAIL_FISHER3
	const URASOETRAIL_FISHER4
	const URASOETRAIL_POKE_BALL1
	const URASOETRAIL_POKE_BALL2
	const URASOETRAIL_POKEMANIAC

UrasoeTrail_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerPokemaniacShane:
	trainer POKEMANIAC, SHANE, EVENT_BEAT_POKEMANIAC_SHANE, PokemaniacShaneSeenText, PokemaniacShaneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacShaneAfterBattleText
	waitbutton
	closetext
	end


TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

UrasoeTrailSign:
	jumptext UrasoeTrailSignText

FishingSpotSign:
	jumptext FishingSpotSignText

UrasoeTrailCalcium:
	itemball CALCIUM

UrasoeTrailNugget:
	itemball NUGGET

UrasoeTrailHiddenElixer:
	hiddenitem ELIXER, EVENT_URASOE_TRAIL_HIDDEN_ELIXER


FisherStephenSeenText:
	text "Che bello pescare"
	line "e ascoltare la"
	cont "radio."
	done

FisherStephenBeatenText:
	text "La radio mi"
	line "distrae!"
	done

FisherStephenAfterBattleText:
	text "Hai mai incontrato"
	line "qualche conduttore"
	cont "radiofonico?"
	para "Mi chiedo se"
	line "siano ganzi come"
	cont "sembrano."
	done

FisherBarneySeenText:
	text "Niente è meglio"
	line "della pesca!"
	done

FisherBarneyBeatenText:
	text "Ooh!"
	done

FisherBarneyAfterBattleText:
	text "Dicono che la"
	line "PUNTA KUME dall'"
	para "altra parte"
	line "dello STRETTO sia"
	para "il posto migliore"
	line "per pescare."
	para "Non è vero!"
	para "Questa parte è"
	line "sicuramente"
	cont "migliore!"
	done


PokemaniacShaneSeenText:
	text "Cosa significa la"
	line "rarità per te?"
	done

PokemaniacShaneBeatenText:
	text "Avrei dovuto usare"
	line "PIETRALUNARE…"
	done

PokemaniacShaneAfterBattleText:
	text "Stai lavorando"
	line "al #DEX?"

	para "Devi aver visto"
	line "molti #MON"
	cont "rari!"

	para "Posso vederlo?"
	done

UrasoeTrailSignText:
	text "SENTIERO URASOE"

	para "CITTÀ DI RYU KYU -"
	line "CITTÀ DI KUME"
	done

FishingSpotSignText:
	text "BOSCO DI NANJO"
	line "ENTRATA"
	done

UrasoeTrail_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8,  5, URASOE_PARK_URASOE_TRAIL_GATE, 3
	warp_event  9,  5, URASOE_PARK_URASOE_TRAIL_GATE, 4
	warp_event 14, 26, NANJO_FOREST, 1
	warp_event 14, 27, NANJO_FOREST, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  7,  7, BGEVENT_READ, UrasoeTrailSign
	bg_event 11, 25, BGEVENT_READ, FishingSpotSign
	bg_event  4,  4, BGEVENT_ITEM, UrasoeTrailHiddenElixer

	db 5 ; object events
	object_event  6, 21, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherStephen, -1
	object_event  4, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherBarney, -1
	object_event  5,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeTrailCalcium, EVENT_URASOE_TRAIL_CALCIUM
	object_event  5, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeTrailNugget, EVENT_URASOE_TRAIL_NUGGET
	object_event 10,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacShane, -1
