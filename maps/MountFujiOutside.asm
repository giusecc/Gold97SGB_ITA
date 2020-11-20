	object_const_def ; object_event constants
	const MOUNTMOONSQUARE_POKEFAN_M
	const MOUNTMOONSQUARE_SPORTSMAN
	const MOUNTMOONSQUARE_LASS

MountFujiOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerHikerBenjamin:
	trainer HIKER, BENJAMIN, EVENT_BEAT_HIKER_BENJAMIN, HikerBenjaminSeenText, HikerBenjaminBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBenjaminAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSportsmanArthur:
	trainer SPORTSMAN, ARTHUR, EVENT_BEAT_SPORTSMAN_ARTHUR, SportsmanArthurSeenText, SportsmanArthurBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SportsmanArthurAfterBattleText
	waitbutton
	closetext
	end

HealerLassScript:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_9
	iftrue .LassHealSequence
	writetext LassIntroText
	setevent EVENT_SWITCH_9
	waitbutton
	jump .LassHealSequence
	end

.LassHealSequence
	writetext LassAsksToHeal
	yesorno
	iftrue .LassHealTime
	writetext NoHealThisTime
	waitbutton
	closetext
	end
	
.LassHealTime
	writetext LassHealTimeText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special HealParty
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext LassHealTimeText2
	waitbutton
	closetext
	end
	
LassIntroText:
	text "Siamo già ad"
	line "alta quota."
	para "Eh? Sì, sono un"
	line "allenatore, ma"
	cont "mi sto riposando."
	para "Ho portato molti"
	line "rimedi con me."
	para "Se i tuoi #MON"
	line "devono essere"
	para "curati, lascia"
	line "che ti aiuti."
	done
	
LassAsksToHeal:
	text "Quindi?"
	para "I tuoi #MON"
	line "hanno bisogno"
	cont "di una cura?"
	done
	
NoHealThisTime:
	text "Va bene."
	para "Starò qui per un"
	line "po'. Se ti serve"
	cont "vieni qui."
	done
	
LassHealTimeText:
	text "Ok, lascia che"
	line "rimetta in sesto"
	cont "la tua squadra…"
	done
	
LassHealTimeText2:
	text "Ecco a te!"
	para "Pronti a lottare!"
	done

SportsmanArthurSeenText:
	text "Posso correre fino"
	line "alla cima."
	done

SportsmanArthurBeatenText:
	text "Senza fiato!"
	done

SportsmanArthurAfterBattleText:
	text "Non sono un grande"
	line "scalatore."
	done

HikerBenjaminSeenText:
	text "Che bello essere"
	line "qua fuori!"
	cont "Che libertà!"
	done

HikerBenjaminBeatenText:
	text "Ahahah!"
	done

HikerBenjaminAfterBattleText:
	text "Ci vuole molto"
	line "tempo a salire"
	cont "alla vetta."
	para "Ci vuole una"
	line "ventata di aria"
	cont "fresca!"
	done

MountFujiOutside_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 11, 15, VICTORY_ROAD, 2
	warp_event  5, 13, VICTORY_ROAD, 3
	warp_event 15, 11, VICTORY_ROAD, 4
	warp_event 11,  9, VICTORY_ROAD, 5
	warp_event  1,  7, VICTORY_ROAD, 6
	warp_event 17,  5, VICTORY_ROAD_2F, 1
	warp_event 11,  3, VICTORY_ROAD_2F, 2
	warp_event  7,  1, VICTORY_ROAD_2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerBenjamin, -1
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSportsmanArthur, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, HealerLassScript, -1
