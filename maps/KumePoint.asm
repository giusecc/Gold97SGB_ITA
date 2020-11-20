	object_const_def ; object_event constants
	const URASOETRAIL_FISHER1
	const URASOETRAIL_FISHER2

KumePoint_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end
	
	
FisherMartinSeenText:
	text "La pazienza è"
	line "la chiave per"
	cont "la pesca."
	done

FisherMartinBeatenText:
	text "Aaaah!"
	done

FisherMartinAfterBattleText:
	text "Sono troppo"
	line "impaziente…"
	done
	

FisherKyleSeenText:
	text "È il posto"
	line "migliore per"
	cont "pescare!"
	done

FisherKyleBeatenText:
	text "Peschi mai qui?"
	done

FisherKyleAfterBattleText:
	text "Molti PESCATORI"
	line "dall'altro lato"
	para "dello STRETTO sono"
	line "convinti che"
	para "quello sia il"
	line "posto migliore per"
	cont "pescare."
	para "Ma si sbagliano!"
	para "Questo è il lato"
	line "migliore."
	done

KumePoint_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 10, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherMartin, -1
	object_event  6, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherKyle, -1
