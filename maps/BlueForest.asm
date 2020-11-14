	object_const_def ; object_event constants
	const BLUE_FOREST_BLACK_BELT
	const BLUE_FOREST_COOLTRAINER_F1
	const BLUE_FOREST_YOUNGSTER1
	const BLUE_FOREST_SANTOS
	const BLUE_FOREST_COOLTRAINER_F2

BlueForest_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Santos

.FlyPoint:
	setflag ENGINE_FLYPOINT_BLUE_FOREST
	return

.Santos:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLUE_FOREST_SANTOS
	return

.SantosAppears:
	appear BLUE_FOREST_SANTOS
	return

BlueForestBlackBeltScript:
	jumptextfaceplayer BlackBeltText_WeirdRadio



BlueForestCooltrainerF1Script:
	jumptextfaceplayer BlueForestCooltrainerF1Text

BlueForestYoungsterScript:
	jumptextfaceplayer BlueForestYoungsterText

BlueForestCooltrainerF2Script:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_GYM
	iffalse .HotshotWow
	writetext BlueForestCooltrainerF2TextNotWow
	waitbutton
	closetext
	end
	
.HotshotWow
	writetext BlueForestCooltrainerF2Text
	waitbutton
	closetext
	end

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	buttonsound
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	buttonsound
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlueForestSign:
	jumptext BlueForestSignText

BlueForestGymSign:
;	verbosegiveitem HM_WHIRLPOOL
	jumptext BlueForestGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlueForestTrainerTips:
	jumptext BlueForestTrainerTipsText

BlueForestPokecenterSign:
	;setmapscene ROUTE_112_STAND_GATE, SCENE_DEFAULT
	;clearevent EVENT_SILVER_IN_STAND_GATE
	jumpstd PokecenterSignScript

BlueForestMartSign:
	jumpstd MartSignScript

BlackBeltText_WeirdRadio:
	text "ALFREDO è il"
	line "CAPOPALESTRA."
	para "Da fuori è un"
	line "pezzo di ghiaccio,"
	para "ma ha un cuore"
	line "d'oro."
	done

BlueForestCooltrainerF1Text:
	text "Vuoi far scordare"
	line "mosse ai tuoi"
	cont "#MON?"
	para "La casa dell'"
	line "ELIMINAMOSSE è"
	cont "a ovest di qui."
	done

BlueForestYoungsterText:
	text "Ci sono molti"
	line "#MON di tipo"
	para "GHIACCIO nel"
	line "PASSAGGIO"
	cont "SOMMERSO."
	done

MeetSantosText:
	text "SABATINO: …"

	para "Oggi è sabato…"

	para "E io sono SABATINO"
	line "del sabato…"
	done

SantosGivesGiftText:
	text "Prendi questo…"
	done

SantosGaveGiftText:
	text "SABATINO: …"

	para "SPETTROTARGA…"

	para "Potenzia le mosse"
	line "del tipo spettro…"

	para "Ti terrorizzerà,"
	line "vedrai…"
	done

SantosSaturdayText:
	text "SABATINO: …"

	para "Ci vediamo qualche"
	line "altro sabato…"

	para "Anche se non potrò"
	line "regalarti altro…"
	done

SantosNotSaturdayText:
	text "SABATINO: Oggi non"
	line "è mica sabato…"
	done

BlueForestCooltrainerF2Text:
	text "Uauh! Vieni dal"
	line "PASSAGGIO"
	cont "SOMMERSO?"
	para "Devi essere un"
	line "grande allenatore!"
	done
	
BlueForestCooltrainerF2TextNotWow:
	text "Non sono mai stato"
	line "più a nord."
	para "Ho troppa paura"
	line "del PASSAGGIO"
	cont "SOMMERSO!"
	done

BlueForestSignText:
	text "BIANCASELVA"

	para "Calmo bosco"
	line "innevato"
	done

BlueForestGymSignText:
	text "BIANCASELVA"
	line "CAPOPALESTRA:"
	cont "ALFREDO"

	para "Il maestro del"
	line "duro inverno"
	done

MoveDeletersHouseSignText:
	para "CASA DELL'"
	line "ELIMINAMOSSE"
	done

DragonDensSignText:
	text "PASSAGGIO SOMMERSO"
	line "Entrata sud"
	done

BlueForestTrainerTipsText:
	text "CONSIGLI UTILI"

	para "Un #MON che"
	line "tiene una BACCA"
	cont "MIRACOLO potrà"

	para "risolvere ogni"
	line "problema di stato."
	done

BlueForest_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 26, 21, BLUE_FOREST_GYM, 1
	warp_event  9,  9, BLUE_FOREST_DRAGON_SPEECH_HOUSE, 1
	warp_event 19, 13, BLUE_FOREST_EMYS_HOUSE, 1
	warp_event 25,  6, BLUE_FOREST_MART, 1
	warp_event 13, 18, BLUE_FOREST_POKECENTER_1F, 1
	;warp_event 13, 18, DEEPWATER_PASSAGE_B2F, 1
	warp_event  3, 22, MOVE_DELETERS_HOUSE, 1
	warp_event 27, 11, BLUE_FOREST_HOUSE_1, 1
	warp_event  5,  5, DEEPWATER_PASSAGE_ENTRANCE, 1
	warp_event 18,  3, BLUE_FOREST_ROUTE_111_GATE, 3
	warp_event 19,  3, BLUE_FOREST_ROUTE_111_GATE, 4
	warp_event 27, 21, BLUE_FOREST_GYM, 2

	db 0 ; coord events

	db 7 ; bg events
	bg_event  2, 26, BGEVENT_READ, BlueForestSign
	bg_event 28, 22, BGEVENT_READ, BlueForestGymSign
	bg_event  0, 18, BGEVENT_READ, MoveDeletersHouseSign
	bg_event  4,  8, BGEVENT_READ, DragonDensSign
	bg_event  0, 17, BGEVENT_READ, BlueForestTrainerTips
	bg_event 26,  6, BGEVENT_READ, BlueForestMartSign
	bg_event 14, 18, BGEVENT_READ, BlueForestPokecenterSign

	db 5 ; object events
	object_event 26, 23, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueForestBlackBeltScript, -1
	object_event 16, 23, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestCooltrainerF1Script, -1
	object_event 13, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestYoungsterScript, -1
	object_event 16,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLUE_FOREST_SANTOS_OF_SATURDAY
	object_event 25, 16, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestCooltrainerF2Script, -1
