	object_const_def ; object_event constants
	const KKS_SWIMMER1
	const KKS_SWIMMER2

KikaiStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

SwimmerfDeniseSeenText:
	text "C'è un clima"
	line "stupendo, sono"
	cont "inebriato!"
	done

SwimmerfDeniseBeatenText:
	text "Ooooh!"
	done

SwimmerfDeniseAfterBattleText:
	text "Le scottature sono"
	line "terribili per la"
	cont "pelle!"

	para "Ma non uso nessuna"
	line "crema solare."

	para "Non voglio inqui-"
	line "nare l'acqua."
	done


SwimmerfWendySeenText:
	text "Di notte gli"
	line "STARYU salgono"
	para "fino alla"
	line "superficie."
	done

SwimmerfWendyBeatenText:
	text "Peccato…"
	done

SwimmerfWendyAfterBattleText:
	text "I nuclei degli"
	line "STARYU brillano"
	cont "tutti insieme."

	para "È tanto bello"
	line "quanto spaventoso."
	done


KikaiStrait_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 15, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event  9, 22, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfWendy, -1
