	object_const_def ; object_event constants
	const KERAMASTRAIT_SWIMMER_GIRL
	const KERAMASTRAIT_SWIMMER_GUY2
	const KERAMASTRAIT_SWIMMER_GUY3
	const KERAMASTRAIT_FISHER1
	const KERAMASTRAIT_FISHER2

KeramaStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

KeramaStraitFisher1Script:
	jumptextfaceplayer KeramaStraitFisher1Text


KeramaStraitFisher2Script:
	jumptextfaceplayer KeramaStraitFisher2Text


KeramaStraitSign:
	jumptext KeramaStraitSignText


SwimmermTuckerSeenText:
	text "Uff, uff…"
	line "Ancora… un po'…"

	para "verso… KUME…"
	done

SwimmermTuckerBeatenText:
	text "Sto annegando!"
	done

SwimmermTuckerAfterBattleText:
	text "Ho… chiesto alla"
	line "mia ragazza di"
	para "nuotare fino a"
	line "KUME… Gasp…"
	done

SwimmerfDawnSeenText:
	text "Non mi piacciono"
	line "i deboli!"
	done

SwimmerfDawnBeatenText:
	text "Potrei batterti a"
	line "nuoto…"
	done

SwimmerfDawnAfterBattleText:
	text "È una breve"
	line "nuotata fino"
	cont "a KUME…"

	para "Guarda il mio"
	line "ragazzo! Che"

	cont "pappamolle!"
	done

SwimmermJeromeSeenText:
	text "Nuotare?"
	line "Lo adoro!"
	done

SwimmermJeromeBeatenText:
	text "Credevo di poter"
	line "vincere."
	done

SwimmermJeromeAfterBattleText:
	text "Sono un bravo"
	line "nuotatore e adoro"
	cont "il mare!"
	done

KeramaStraitFisher1Text:
	text "I PESCATORI che"
	line "preferiscono il"
	para "lato orientale"
	line "dello STRETTO si"
	cont "sbagliano."
	para "Anche quelli che"
	line "preferiscono il"
	para "lato occidentale."
	para "Il posto migliore"
	line "è il centro!"
	done

KeramaStraitFisher2Text:
	text "Questo è di"
	line "certo il posto"
	cont "migliore."
	done


KeramaStraitSignText:
	text "STRETTO DI KERAMA"

	para "CITTÀ DI KUME"
	line "a ovest"
	done


KeramaStrait_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 58, 11, BGEVENT_READ, KeramaStraitSign

	db 5 ; object events
	object_event 19,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDawn, -1
	object_event 46,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event 11, 11, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermTucker, -1
	object_event 27,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, KeramaStraitFisher1Script, -1
	object_event 29,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, KeramaStraitFisher2Script, -1
