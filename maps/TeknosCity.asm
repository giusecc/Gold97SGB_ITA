	object_const_def ; object_event constants
	const TEKNOSCITY_GRAMPS1
	const TEKNOSCITY_GRAMPS2
	const TEKNOSCITY_LASS1
	const TEKNOSCITY_LASS2
	const TEKNOSCITY_FISHER
	const TEKNOSCITY_YOUNGSTER
	const TEKNOSCITY_GRAMPS3
	const TEKNOSCITY_ROCKET1
	const TEKNOSCITY_ROCKET2
	const TEKNOSCITY_ROCKET3
	const TEKNOSCITY_ROCKET4
	const TEKNOSCITY_ROCKET5

TeknosCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .ClearTeknosCityRocks

.ClearTeknosCityRocks:
	checkevent EVENT_FROSTPOINT_ROCKS_CLEARED
	iftrue .Done
	changeblock 21,  7, $41 ; fence
	changeblock 23,  7, $41 ; fence
	changeblock 25,  7, $41 ; fence
	changeblock 21,  5, $21 ; water
	changeblock 23,  5, $21 ; water
	changeblock 25,  5, $21 ; water
.Done:
	return

.FlyPoint:
	setflag ENGINE_FLYPOINT_TEKNOS
	return

TeknosCityGramps1Script:
	jumptextfaceplayer TeknosCityGramps1Text

TeknosCityGramps2Script:
	faceplayer
	opentext
	checkevent EVENT_FROSTPOINT_ROCKS_CLEARED
	iftrue .Gramps2Script2
	writetext TeknosCityGramps2Text
	waitbutton
	closetext
	end
	
.Gramps2Script2:
	writetext TeknosCityGramps2Text2
	waitbutton
	closetext
	end

TeknosCityGramps3Script:
	jumptextfaceplayer TeknosCityGramps3Text

TeknosCityLass1Script:
	jumptextfaceplayer TeknosCityLass1Text

TeknosCityLass2Script:
	jumptextfaceplayer TeknosCityLass2Text

	
TeknosCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .NoRockets
	writetext TeknosCityFisherText_TheresRockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext TeknosCityFisherText
	waitbutton
	closetext
	end


TeknosCityRocket1Script:
;	setevent EVENT_WHITNEY_1_AQUARIUM
;	setevent EVENT_WHITNEY_2_AQUARIUM
;	setmapscene TEKNOS_AQUARIUM_1F, SCENE_DEFAULTs
	jumptextfaceplayer TeknosCityRocket1Text
	
TeknosCityRocket2Script:
	jumptextfaceplayer TeknosCityRocket2Text
	
TeknosCityRocket3Script:
	jumptextfaceplayer TeknosCityRocket3Text
	
TeknosCityRocket4Script:
	jumptextfaceplayer TeknosCityRocket4Text
	
TeknosCityRocket5Script:
	jumptextfaceplayer TeknosCityRocket5Text

TeknosCityYoungsterScript:
	jumptextfaceplayer TeknosCityYoungsterText

TeknosCitySign:
	jumptext TeknosCitySignText

TinTowerSign:
	checkevent EVENT_FROSTPOINT_ROCKS_CLEARED
	iftrue .TinTowerSign2
	jumptext TinTowerSignText
	
.TinTowerSign2
	jumptext TinTowerSignText2

BirdonGymSign:
	jumptext BirdonGymSignText
	
TeknosCityDocksSign:
	jumptext TeknosCityDocksText

TeknosDanceTheaterSign:
	jumptext TeknosDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

TeknosCityPokecenterSign:
	jumpstd PokecenterSignScript

TeknosCityMartSign:
	jumpstd MartSignScript

TeknosCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_TEKNOS_CITY_HIDDEN_HYPER_POTION
	
TeknosCityRocket3Text:
	text "Oh, sì!"
	para "Sarà divertente!"
	done
	
TeknosCityRocket4Text:
	text "È quasi tempo di"
	line "farci vedere!"
	done
	
TeknosCityRocket5Text:
	text "L'ACQUARIO non"
	line "resisterà!"
	done

TeknosCityRocket1Text:
	text "Stai lontano"
	line "dall'ACQUARIO!"
	para "Lo dico per il"
	line "tuo bene!"
	done
	
TeknosCityRocket2Text:
	text "Ehehehe!"
	para "Questo posto è"
	line "pieno di #MON"
	para "rari da vendere"
	line "al miglior"
	cont "offerente!"
	
	done

UnusedMissingDaughterText:
; unused
	text "Oh, no. Oh, no…"

;	para "My daughter is"
;	line "missing."
;
;	para "No… She couldn't"
;	line "have gone to the"
;	cont "BURNED TOWER."
;
;	para "I told her not to"
;	line "go near it…"
;
;	para "People seem to"
;	line "disappear there…"
;
;	para "Oh, what should I"
;	line "do…?"
	done

TeknosCityGramps1Text:
	text "Vivo qui da"
	line "sempre."
	para "Ai miei tempi"
	line "la città era"
	para "molto meno"
	line "trafficata."
	done

TeknosCityGramps2Text:
	text "Questa città"
	line "crescerà ancora"
	para "di più quando la"
	line "PASSERELLA sarà"
	cont "completa."
	done
	
TeknosCityGramps2Text2:
	text "Lo ammetto, sono"
	line "un grande amante"
	para "del CASINÒ che"
	line "ha aperto a"
	cont "nord di qui."
	done

TeknosCityLass1Text:
	text "TECNOPOLI era"
	line "una città"
	cont "tranquilla."
	para "Ma è cresciuta"
	line "velocemente e"
	para "non credo che"
	line "tutti si siano"
	cont "abituati."
	done

TeknosCityLass2Text:
	text "CHIARA è la nostra"
	line "CAPOPALESTRA!"
	para "Aiuta sempre"
	line "tutti in città!"
	para "A volte è"
	line "difficile trovarla"
	para "in traversa,"
	line "perché è sempre"
	para "in giro ad"
	line "aiutare qualcuno."
	done

TeknosCityLass2Text_ReleasedBeasts:
	text "Tre grandi #MON"
	line "sono scappati in"
	cont "direzioni diverse."
	cont "Cosa sono?"
	done

TeknosCityFisherText:
	text "L'ACQUARIO non è"
	line "interessante per"
	cont "i MARINAI."
	para "Vediamo tutti"
	line "questi #MON in"
	cont "mare! Ohoho!"
	done

TeknosCityFisherText_TheresRockets:
	text "Questi sembrano"
	line "membri del TEAM"
	cont "ROCKET."
	para "Credevo si"
	line "fossero sciolti."
	done

TeknosCityYoungsterText:
	text "Non sono mai"
	line "riuscito a"
	para "sconfiggere"
	line "CHIARA…"
	done

TeknosCityGramps3Text:
	text "TECNOPOLI sta"
	line "diventando una"
	cont "città portuale."
	para "Spero che non"
	line "diventi troppo"
	cont "affollata!"
	done

TeknosCitySignText:
	text "TECNOPOLI"
	para "La città che"
	line "abbraccia il"
	cont "futuro."
	done

TinTowerSignText:
	text "IN ARRIVO!"
	para "PASSERELLA e"
	line "CASINÒ!"
	para "Un collegamento"
	line "tra TECNOPOLI"
	para "e VESTIGIA, con"
	line "giochi e grandi"
	cont "premi!"
	done

TinTowerSignText2:
	text "PASSERELLA e"
	line "CASINÒ a nord!"
	para "Giochi, premi e"
	line "divertimento!"
	done

BirdonGymSignText:
	text "TECNOPOLI"
	line "CAPOPALESTRA:"
	cont "CHIARA"

	para "Energica e"
	line "intraprendente!"
	done

TeknosDanceTheaterSignText:
	text "TECNOPOLI"
	line "ACQUARIO"
	done

BurnedTowerSignText:
	text "CASA DEL GURU"
	line "PESCATORE"
	done
	
TeknosCityDocksText:
	text "MOLI TECNOPOLI"
	done

TeknosCity_MapEvents:
	db 0, 0 ; filler

	db 14 ; warp events
	warp_event 22, 31, TEKNOS_PORT_PASSAGE, 1
	warp_event 23, 31, TEKNOS_PORT_PASSAGE, 2
	warp_event 31, 10, TEKNOS_POKECENTER_1F, 1
	warp_event  7, 17, TEKNOS_FISHING_HOUSE, 1
	warp_event  7, 27, TEKNOS_AQUARIUM_1F, 2
	warp_event 31, 16, TEKNOS_MART, 1
	warp_event 10, 11, TEKNOS_GYM, 1
	warp_event 15, 17, TEKNOS_ITEMFINDER_HOUSE, 1
	warp_event  6, 27, TEKNOS_AQUARIUM_1F, 1
	warp_event  9, 11, ROUTE_109_ROUTE_110_GATE, 4
	warp_event 22,  1, BOARDWALK_TEKNOS_GATE, 3
	warp_event 23,  1, BOARDWALK_TEKNOS_GATE, 4
	warp_event 11, 11, TEKNOS_GYM, 2
	warp_event 33, 20, TEKNOS_TRADE_HOUSE, 1

	db 0 ; coord events

	db 9 ; bg events
	bg_event 18, 20, BGEVENT_READ, TeknosCitySign
	bg_event 24,  8, BGEVENT_READ, TinTowerSign
	bg_event 12, 12, BGEVENT_READ, BirdonGymSign
	bg_event 10, 27, BGEVENT_READ, TeknosDanceTheaterSign
	bg_event 10, 17, BGEVENT_READ, BurnedTowerSign
	bg_event 32, 10, BGEVENT_READ, TeknosCityPokecenterSign
	bg_event 32, 16, BGEVENT_READ, TeknosCityMartSign
	bg_event 33, 13, BGEVENT_ITEM, TeknosCityHiddenHyperPotion
	bg_event 24, 29, BGEVENT_READ, TeknosCityDocksSign

	db 12 ; object events
	object_event 14, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps1Script, -1
	object_event 19,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps2Script, -1
	object_event 28, 27, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityLass1Script, -1
	object_event 23, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityLass2Script, -1
	object_event 10, 30, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosCityYoungsterScript, -1
	object_event 22, 13, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps3Script, -1
	object_event  5, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket1Script, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  8, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket2Script, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  7, 28, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket3Script, EVENT_ROCKETS_BLOCKING_AQUARIUM
	object_event  7, 30, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket4Script, EVENT_ROCKETS_BLOCKING_AQUARIUM
	object_event  6, 29, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket5Script, EVENT_ROCKETS_BLOCKING_AQUARIUM

	
