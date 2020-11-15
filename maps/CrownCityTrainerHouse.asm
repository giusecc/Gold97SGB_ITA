	object_const_def ; object_event constants
	const CROWNCITYTRAINERHOUSE_SUPER_NERD
	const CROWNCITYTRAINERHOUSE_COOLTRAINER_F
	const CROWNCITYTRAINERHOUSE_COOLTRAINER_M
	const CROWNCITYTRAINERHOUSE_ROCKER
	const CROWNCITYTRAINERHOUSE_LASS

CrownCityTrainerHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CrownCityTrainerHouseSuperNerdScript:
	jumptextfaceplayer CrownCityTrainerHouseSuperNerdText
	
CrownCityTrainerHouseCooltrainerfScript:
	jumptextfaceplayer CrownCityTrainerHouseCooltrainerfText

CrownCityTrainerHouseCooltrainermScript:
	jumptextfaceplayer CrownCityTrainerHouseCooltrainermText
	
CrownCityTrainerHouseRockerScript:
	jumptextfaceplayer CrownCityTrainerHouseRockerText

CrownCityTrainerHouseBookshelf:
	jumpstd MagazineBookshelfScript
	
CrownCityTrainerHouseLassScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext IejimaTownDreamEaterFisherText
	buttonsound
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext IejimaTownDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end
	

IejimaTownDreamEaterFisherText:
	text "Gulp!"

	para "Mi sono allenato"
	line "troppo…"
	para "Sono così stanco"
	line "che potrei"
	cont "addormentarmi!"
	
	para "Sapevi che esiste"
	line "una mossa efficace"
	para "solo contro i"
	line "#MON addormentati?"
	para "Ecco, guarda un"
	line "po'."
	done

IejimaTownDreamEaterFisherGotDreamEaterText:
	text "MT42 contiene"
	line "MANGIASOGNI…"

	para "…Zzzzz…"
	done

	
CrownCityTrainerHouseRockerText:
	text "Quale dei miei"
	line "#MON è adatto"
	para "per sfidare la"
	line "LEGA?"
	done
	
CrownCityTrainerHouseCooltrainermText:
	text "Sono pronto!"
	para "Posso farcela!"
	para "Mi sto solo"
	line "caricando un po'."
	done

CrownCityTrainerHouseSuperNerdText:
	text "Dicono che gli"
	line "allenatori della"
	para "LEGA usino #MON"
	line "PSICO, SPETTRO,"
	para "ACQUA, VELENO e"
	line "DRAGO."
	done
	
CrownCityTrainerHouseCooltrainerfText:
	text "Vincere otto"
	line "MEDAGLIE è stata"
	cont "dura."
	para "Mi servirà molto"
	line "più allenamento"
	para "per sfidare la"
	line "LEGA."
	done

CrownCityTrainerHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  7, CROWN_CITY, 8
	warp_event  8,  7, CROWN_CITY, 9

	db 0 ; coord events

	db 4 ; bg events
	bg_event  8,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf
	bg_event  9,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf
	bg_event 10,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf
	bg_event 11,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf

	db 5 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseSuperNerdScript, -1
	object_event  1,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseCooltrainerfScript, -1
	object_event  4,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseCooltrainermScript, -1
	object_event 10,  3, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseRockerScript, -1
	object_event 13,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseLassScript, -1
