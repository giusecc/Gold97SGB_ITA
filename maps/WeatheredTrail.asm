	object_const_def ; object_event constants
	const WEATHEREDBIKER1
	const WEATHEREDBIKER2
	const WEATHEREDBIKER3
	const WEATHEREDBIKER4
	const WEATHEREDOFFICER
	const WEATHEREDOFFICER2
	const WEATHEREDTREE

WeatheredTrail_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBikerBlaze:
	trainer BIKER, BLAZE, EVENT_BEAT_BIKER_BLAZE, BikerBlazeSeenText, BikerBlazeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerBlazeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBikerRafael:
	trainer BIKER, RAFAEL, EVENT_BEAT_BIKER_RAFAEL, BikerRafaelSeenText, BikerRafaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRafaelAfterBattleText
	waitbutton
	closetext
	end
	

TrainerBikerColton:
	trainer BIKER, COLTON, EVENT_BEAT_BIKER_COLTON, BikerColtonSeenText, BikerColtonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerColtonAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBikerJermaine:
	trainer BIKER, JERMAINE, EVENT_BEAT_BIKER_JERMAINE, BikerJermaineSeenText, BikerJermaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJermaineAfterBattleText
	waitbutton
	closetext
	end
	

BikerBlazeSeenText:
	text "Ehi! Nessun"
	line "estraneo!"
	done
	
BikerBlazeBeatenText:
	text "Uff…"
	done
	
BikerBlazeAfterBattleText:
	text "Lasciaci in"
	line "pace!"
	done
	

BikerRafaelSeenText:
	text "Non c'è bisogno"
	line "che passi di qui!"
	done
	
BikerRafaelBeatenText:
	text "Distrutto!"
	done
	
BikerRafaelAfterBattleText:
	text "Vogliamo solo"
	line "correre!"
	done
	

BikerColtonSeenText:
	text "Ehi teppista!"
	para "…Beh, forse sono"
	line "io il teppista."
	para "Ma tu dovresti"
	line "andartene!"
	done
	
BikerColtonBeatenText:
	text "Aah, non importa!"
	done
	
BikerColtonAfterBattleText:
	text "Perché invadi il"
	line "territorio?"
	done
	

BikerJermaineSeenText:
	text "Ragazzi come te"
	line "non hanno"
	cont "speranze!"
	done
	
BikerJermaineBeatenText:
	text "Non l'avrei"
	line "aspettato…"
	done
	
BikerJermaineAfterBattleText:
	text "Non faremo"
	line "danni, promesso!"
	done
	
WeatheredOfficer1Text:
	text "Stiamo aumentando"
	line "la sicurezza dopo"
	cont "questo incidente."
	done
	
WeatheredOfficer2Text:
	text "Ehi, ragazzo!"
	para "Grazie per il"
	line "tuo aiuto."
	para "Puoi passare!"
	done
	
	
WeatheredOfficer1:
	jumptextfaceplayer WeatheredOfficer1Text

WeatheredOfficer2:
	jumptextfaceplayer WeatheredOfficer2Text

WeatheredTrailHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_WEATHERED_TRAIL_HIDDEN_MAX_ETHER

WeatheredTrailHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_WEATHERED_TRAIL_HIDDEN_MAX_ELIXER

WeatheredTrailHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_WEATHERED_TRAIL_HIDDEN_RARE_CANDY

WeatheredTrailHiddenEnergyWall:
	hiddenitem ENERGY_WALL, EVENT_WEATHERED_TRAIL_HIDDEN_ENERGY_WALL
	
TatsugoPathTree:
	fruittree FRUITTREE_TATSUGO_PATH
	

WeatheredTrail_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 12,  9, HYDRO_PLANT, 1
	warp_event 13,  9, HYDRO_PLANT, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event 10, 16, BGEVENT_ITEM, WeatheredTrailHiddenMaxEther
	bg_event 20,  6, BGEVENT_ITEM, WeatheredTrailHiddenMaxElixer
	bg_event 35,  8, BGEVENT_ITEM, WeatheredTrailHiddenRareCandy
	bg_event 29, 17, BGEVENT_ITEM, WeatheredTrailHiddenEnergyWall

	db 7 ; object events
	object_event 11, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBikerBlaze, EVENT_IEJIMA_TOWN_FIXED
	object_event 47, 13, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBikerRafael, EVENT_IEJIMA_TOWN_FIXED
	object_event 15, 12, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBikerColton, EVENT_IEJIMA_TOWN_FIXED
	object_event 31, 12, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBikerJermaine, EVENT_IEJIMA_TOWN_FIXED
	object_event 11, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WeatheredOfficer1, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 14, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WeatheredOfficer2, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event  9, 14, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TatsugoPathTree, -1
